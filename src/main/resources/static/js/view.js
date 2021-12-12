$(document).ready(() => {

    // get context path from session storage
    let contextPath = sessionStorage.getItem("context-path")

    // invite new member to study when button is clicked
    $(".study-invite").click(async (event) => {
        let parameterString = event.target.value
        let parameterList = parameterString.split("|")

        let recruitId = parameterList[0]
        let title = parameterList[1]
        let description = parameterList[2]
        let leaderNickname = parameterList[3]
        let followerNickname = parameterList[4]

        let followerId = parameterList[5]
        let modalBody = $("#modal-body-" + followerId)
        let inviteBtn = $("#invite-" + followerId)

        modalBody.html("Please Wait for a second...")

        // request to invite member
        let response = await fetch("http://localhost:8080" + contextPath + "/study/user", {
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
        })

        if (!response.ok) {
            modalBody.html("Fail to invite " + followerNickname)
            return
        }

        modalBody.html("Success to invite " + followerNickname)

        // add new badge state to invited
        inviteBtn.parent().append(`
            <span class="badge badge-info">Invited</span>
        `)

        // delete invite button
        inviteBtn.remove()
    })

})