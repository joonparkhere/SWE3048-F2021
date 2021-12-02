$(document).ready(() => {

    $("#join-success").hide()
    $("#join-fail").hide()

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
        }).then((response) => {
            if (!response.ok) {
                throw new Error()
            }
            $("#join-success").show()
        }).catch(() => {
            $("#join-fail").show()
        })
    })

})