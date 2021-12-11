function openSideDrawer() {
    document.getElementById("side-drawer").style.right = "0";
    document.getElementById("side-drawer-void").classList.add("d-block");
    document.getElementById("side-drawer-void").classList.remove("d-none");
}

function closeSideDrawer() {
    document.getElementById("side-drawer").style.right = "-336px";
    document.getElementById("side-drawer-void").classList.add("d-none");
    document.getElementById("side-drawer-void").classList.remove("d-block");
}

window.openSideDrawer = openSideDrawer;
window.closeSideDrawer = closeSideDrawer;

$(document).ready(() => {
    // set drawer button position depending on background image position
    let drawerBtn = $("#drawer-btn")
    let backgroundElement = $(".boardBackground")

    if (backgroundElement.length === 0) return

    let top = backgroundElement.offset().top + 15
    let left = backgroundElement.offset().left + backgroundElement.outerWidth() - drawerBtn.outerWidth() - 15

    drawerBtn.offset({top, left})
})
