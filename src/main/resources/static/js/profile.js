$(document).ready(() => {

    $("#inquiryStudy-fail").hide()

    let nickname = $("#nickname").html()

    fetch(`http://localhost:8080/study?nickname=${nickname}&complete=false`)
        .then(response => {
            if (!response.ok) {
                throw new Error()
            }
            return response.json()
        }).then(studyList => {
            let element = $("#progress-contents")

            for (let study of studyList) {
                let studyId = study.id
                let title = study.title
                let description = study.description
                let date = new Date(study.createdDate)
                let startDate = date.getFullYear() + ". " + (date.getMonth() + 1) + ". " + date.getDate()
                let isLeader = (nickname === study.leader.nickname)

                element.append(`
                    <div class="col-sm-3 study-card">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">
                                    ${title}
                                </h5>
                                <p class="card-text">${description}</p>
                                <p class="card-text"><small class="text-muted">Start at ${startDate}</small></p>
                                ${isLeader ? `<div class="text-right"><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#manage-` + studyId + `">Manage</button></div>` : ``}
                            </div>
                        </div>
                    </div>
                `)

                if (isLeader) {
                    element.append(`
                        <div class="modal fade" id="manage-` + studyId + `" tabindex="-1" role="dialog" aria-hidden="true">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Manage <strong>` + title + `</strong> Study</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                <div id="request-success-` + studyId + `" class="alert alert-success" role="alert">
                                    Success to Request, Need to Refresh Page for Updating data!
                                </div>
                                <div id="request-fail-` + studyId + `" class="alert alert-danger" role="alert">
                                    Fail to Request...
                                </div>
                                
                                <h5>Change Study State</h5>
                                <button type="button" class="btn btn-success btn-lg btn-block" id="complete-` + studyId + `">Complete</button>
                                <button type="button" class="btn btn-danger btn-lg btn-block" id="delete-` + studyId + `">Delete</button>
                                <hr>
                                
                                <h5>In Participate User List</h5>
                                <ul class="list-group" id="studyUser-` + studyId + `"></ul>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                              </div>
                            </div>
                          </div>
                        </div>
                    `)

                    $(`#request-success-${studyId}`).hide()
                    $(`#request-fail-${studyId}`).hide()

                    $(`#complete-${studyId}`).click(() => {
                        fetch(`http://localhost:8080/study?studyId=${studyId}`, {
                            method: "PUT"
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error()
                            }
                            $(`#request-success-${studyId}`).show()
                        }).catch(() => {
                            $(`#request-fail-${studyId}`).show()
                        })
                    })

                    $(`#delete-${studyId}`).click(() => {
                        fetch(`http://localhost:8080/study?studyId=${studyId}`, {
                            method: "DELETE"
                        }).then(response => {
                            if (!response.ok) {
                                throw new Error()
                            }
                            $(`#request-success-${studyId}`).show()
                        }).catch(() => {
                            $(`#request-fail-${studyId}`).show()
                        })
                    })

                    fetch(`http://localhost:8080/study/user?studyId=${studyId}&leaderNickname=${nickname}`)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error()
                            }
                            return response.json()
                        }).then(studyUserList => {
                            let listElement = $(`#studyUser-${studyId}`)

                            for (let studyUser of studyUserList) {
                                let studyUserId = studyUser.id
                                let studyUserNickname = studyUser.user.nickname

                                listElement.append(`
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        ${studyUserNickname}
                                        <button type="button" class="btn btn-warning btn-sm evict-` + studyId + `" value="` + studyUserId + `">Evict</button>
                                    </li>
                                `)
                            }

                            $(`.evict-${studyId}`).click(event => {
                                let studyUserId = event.target.value

                                fetch(`http://localhost:8080/study/user?studyUserId=${studyUserId}`, {
                                    method: "PUT"
                                }).then(response => {
                                    if (!response.ok) {
                                        throw new Error()
                                    }
                                    $(`#request-success-${studyId}`).show()
                                }).catch(() => {
                                    $(`#request-fail-${studyId}`).show()
                                })
                            })
                    })
                }
            }
        }).catch(() => {
            $("#inquiryStudy-fail").show()
    })

    fetch(`http://localhost:8080/study?nickname=${nickname}&complete=true`)
        .then(response => {
            if (!response.ok) {
                throw new Error()
            }
            return response.json()
        }).then(studyList => {
        let element = $("#complete-contents")

        for (let study of studyList) {
            let title = study.title
            let description = study.description
            let date = new Date(study.lastModifiedDate)
            let finishDate = date.getFullYear() + ". " + (date.getMonth() + 1) + ". " + date.getDate()

            element.append(`
                    <div class="col-sm-3 study-card">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">
                                    ${title}
                                </h5>
                                <p class="card-text">${description}</p>
                                <p class="card-text"><small class="text-muted">Finish at ${finishDate}</small></p>
                                <button type="button" class="btn btn-info">Certificate</button>
                            </div>
                        </div>
                    </div>
                `)
        }
    }).catch(() => {
        $("#inquiryStudy-fail").show()
    })

})