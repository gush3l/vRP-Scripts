const banimana = "<font color='#ff2400'>CASH</font><br>"
const monede = "<font color='#ff2400'>BANK</font><br>"

$(function() {
    window.onload = (e) => {
        window.addEventListener('message', (event) => {
            var item = event.data;
            if (item !== undefined && item.type === "ui") {
                if (item.display === true) {
                    $("#money").fadeIn(750);
                } else {
                    $("#money").fadeOut(750);
                }
            }
        });
    };
});

$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        if (event.data.pmoney) {
            $(".pmoney").html(banimana + event.data.pmoney + "$");
        }
        if (event.data.bmoney) {
            $(".bmoney").html(monede + event.data.bmoney + "$");
        }
        if (event.data.players) {
            document.querySelector("#idsiuseritext").innerHTML = data.players + "/128";
        }

        var today = new Date();
        const monthNames = [".01.", ".02.", ".03.", ".04.", ".05.", ".06.", ".07.", ".08.", ".09.", ".10.", ".11.", ".12."];
        var date = new Date().getDate() + monthNames[today.getMonth()] + today.getFullYear();

        document.getElementById("data").innerHTML = date;

    });
});