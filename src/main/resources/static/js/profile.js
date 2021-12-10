// import deployed smart contract information
import {contractABI, contractAddress} from "../contract/contractInfo.js"

$(document).ready(async () => {

    // get context path from session storage
    let contextPath = sessionStorage.getItem("context-path")

    let inquiryStudyFailAlert = $("#inquiryStudy-fail")
    inquiryStudyFailAlert.hide()

    let nickname = $("#nickname").html()

    // get study which is in progress as dto
    let progressStudyResponse = await fetch(`${contextPath}/study?nickname=${nickname}&complete=false`)
    if (!progressStudyResponse.ok) {
        inquiryStudyFailAlert.show()
        return
    }

    // convert study dto to element
    let progressStudyList = await progressStudyResponse.json()
    for (let study of progressStudyList) {
        await addProgressStudyCard(
            nickname, study.id, study.title, study.description, study.createdDate, study.leader.nickname
        )
    }

    // get study which is complete as dto
    let completeStudyResponse = await fetch(`${contextPath}/study?nickname=${nickname}&complete=true`)
    if (!completeStudyResponse.ok) {
        inquiryStudyFailAlert.show()
        return
    }

    // convert study dto to element
    let completeStudyList = await completeStudyResponse.json()
    for (let study of completeStudyList) {
        await addCompleteStudyCard(
            study.id, study.title, study.description, study.lastModifiedDate
        )
    }

})

// add in progress study information as an card element
async function addProgressStudyCard(nickname, id, title, description, createdDate, leaderNickname) {
    let date = new Date(createdDate)
    let startDate = date.getFullYear() + ". " + (date.getMonth() + 1) + ". " + date.getDate()
    let isLeader = (nickname === leaderNickname)

    let element = $("#progress-contents")
    element.append(`
        <div class="col-sm-3 study-card">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${title}</h5>
                    <p class="card-text">${description}</p>
                    <p class="card-text"><small class="text-muted">Start at ${startDate}</small></p>
                    ${isLeader ? `<div class="text-right"><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#manage-` + id + `">Manage</button></div>` : ``}
                </div>
            </div>
        </div>
    `)

    if (!isLeader) return

    // add some logic to manage study when a leader
    await addManageModal(nickname, id, title)
}

// add manage modal which is able to change study state, and evict study member
async function addManageModal(nickname, id, title) {
    let contextPath = sessionStorage.getItem("context-path")

    let element = $("#progress-contents")
    element.append(`
        <div class="modal fade" id="manage-` + id + `" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Manage <strong>` + title + `</strong> Study</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div id="request-success-` + id + `" class="alert alert-success" role="alert">
                    Success to Request, Need to Refresh Page for Updating data!
                </div>
                <div id="request-fail-` + id + `" class="alert alert-danger" role="alert">
                    Fail to Request...
                </div>
                
                <h5>Change Study State</h5>
                <button type="button" class="btn btn-success btn-lg btn-block" id="complete-` + id + `">Complete</button>
                <button type="button" class="btn btn-danger btn-lg btn-block" id="delete-` + id + `">Delete</button>
                <hr>
                
                <h5>In Participate User List</h5>
                <ul class="list-group" id="studyUser-` + id + `"></ul>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
    `)

    let requestSuccessAlert = $(`#request-success-${id}`)
    requestSuccessAlert.hide()

    let requestFailAlert = $(`#request-fail-${id}`)
    requestSuccessAlert.hide()

    // change study state as complete when button is clicked
    $(`#complete-${id}`).click(async () => {
        let response = await fetch(`${contextPath}/study?studyId=${id}`, {
            method: "PUT"
        })

        if (!response.ok) requestFailAlert.show()
        else requestSuccessAlert.show()
    })

    // remove study when button is clicked
    $(`#delete-${id}`).click(async () => {
        let response = await fetch(`${contextPath}/study?studyId=${id}`, {
            method: "DELETE"
        })

        if (!response.ok) requestFailAlert.show()
        else requestSuccessAlert.show()
    })

    // get user who is participated in study as dto
    let studyUserResponse = await fetch(`${contextPath}/study/user?studyId=${id}&leaderNickname=${nickname}`)
    if (!studyUserResponse.ok) $("#inquiryStudy-fail").show()

    // convert study dto to list element
    let studyUserList = await studyUserResponse.json()
    for (let studyUser of studyUserList) {
        let listElement = $(`#studyUser-${id}`)
        listElement.append(`
            <li class="list-group-item d-flex justify-content-between align-items-center">
                ${studyUser.user.nickname}
                <button type="button" class="btn btn-warning btn-sm evict-` + id + `" value="` + studyUser.id + `">Evict</button>
            </li>
        `)
    }

    // evict study member when button is clicked
    $(`.evict-${id}`).click(async (event) => {
        let studyUserId = event.target.value
        let response = await fetch(`${contextPath}/study/user?studyUserId=${studyUserId}`, {
            method: "PUT"
        })

        if (!response.ok) requestFailAlert.show()
        else requestSuccessAlert.show()
    })
}

// add complete study information as an card element
async function addCompleteStudyCard(id, title, description, lastModifiedDate) {
    let date = new Date(lastModifiedDate)
    let finishDate = date.getFullYear() + ". " + (date.getMonth() + 1) + ". " + date.getDate()

    let element = $("#complete-contents")
    element.append(`
        <div class="col-sm-3 study-card">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">${title}</h5>
                    <p class="card-text">${description}</p>
                    <p class="card-text"><small class="text-muted">Finish at ${finishDate}</small></p>
                    <button class="btn btn-info" id="certificate-` + id +`">Issue Certificate</button>
                </div>
            </div>
        </div>
    `)

    // issue certificate when button is clicked
    let certificateBtn = $(`#certificate-${id}`)
    certificateBtn.click(async () => {
        // init web3 object
        const web3 = new Web3(window.ethereum);

        // confirm current web3 object's network is proper
        const netId = await web3.eth.net.getId()
        if (netId !== 3) {
            alert("Please Change to Ropsten Network!")
            return
        }

        // get user account information
        const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
        const account = accounts[0];

        // prepare instance of smart contract
        const instance = new web3.eth.Contract(contractABI, contractAddress);

        // send transaction to issue certification
        let response = await instance.methods.issue(
                account, "http://localhost:8080"
            ).send({
                from: account
            })

        // add hyper link to view certification transaction
        certificateBtn.parent().append(`
            <a class="btn btn-success" href="https://ropsten.etherscan.io/tx/${response.transactionHash}" target="_blank">Check Certificate</a>
        `)

        // delete issue-able button
        certificateBtn.remove()
    })
}