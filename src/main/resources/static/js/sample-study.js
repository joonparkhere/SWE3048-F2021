$(document).ready(() => {

    $("#join").click(() => {
        let recruitId = $("#join-recruitId").val()
        let title = $("#join-title").val()
        let description = $("#join-description").val()
        let leaderNickname = $("#join-leaderNickname").val()
        let followerNickname = $("#join-followerNickname").val()

        fetch("http://localhost:8080/study/user", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                "recruitId": recruitId,
                "title": title,
                "description": description,
                "leaderNickname": leaderNickname,
                "followerNickname": followerNickname
            })
        }).then(response => {
            console.log("join")
            if (!response.ok) {
                console.log("error")
            } else {
                console.log(response)
            }
        })
    })

    $("#remove").click(() => {
        let studyId = $("#remove-studyId").val()

        fetch(`http://localhost:8080/study?studyId=${studyId}`, {
            method: "DELETE"
        }).then(response => {
            console.log("remove")
            if (!response.ok) {
                console.log("error")
            } else {
                console.log(response)
            }
        })
    })

    $("#evict").click(() => {
        let studyUserId = $("#evict-studyUserId").val()

        fetch(`http://localhost:8080/study/user?studyUserId=${studyUserId}`, {
            method: "PUT"
        }).then(response => {
            console.log("evict")
            if (!response.ok) {
                console.log("error")
            } else {
                console.log(response)
            }
        })
    })

    $("#inquiryUser").click(() => {
        let studyId = $("#inquiryUser-studyId").val()
        let leaderNickname = $("#inquiryUser-leaderNickname").val()

        fetch(`http://localhost:8080/study/user?studyId=${studyId}&leaderNickname=${leaderNickname}`)
            .then(response => {
                console.log("inquiryUser")
                if (!response.ok) {
                    console.log("error")
                } else {
                    console.log(response)
                    response.json()
                        .then(data => console.log(data))
                }
            })
    })

    $("#inquiryStudy").click(() => {
        let nickname = $("#inquiryStudy-nickname").val()

        fetch(`http://localhost:8080/study?nickname=${nickname}&complete=false`)
            .then(response => {
                console.log("inquiryStudy")
                if (!response.ok) {
                    console.log("error")
                } else {
                    console.log(response)
                    response.json()
                        .then(data => console.log(data))
                }
            })
    })

    $("#complete").click(() => {
        let studyId = $("#complete-studyId").val()

        fetch(`http://localhost:8080/study?studyId=${studyId}`, {
            method: "PUT"
        }).then(response => {
            console.log("complete")
            if (!response.ok) {
                console.log("error")
            } else {
                console.log(response)
            }
        })
    })

})