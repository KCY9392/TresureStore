/**
 * 
 */
 
$(function () {
    $('#search').keyup(function () {
        if ($("#search").val() != "") {
            $("#exit").show();
        }else{
            $("#exit").hide();
        }
    });
});


var input = document.getElementById("search");
$(function () {
    $('#exit').click(function () {
        input.value = null;
        $("#exit").hide();
    });
});


$(function() {
    $(".catebox3").hide();
    $(".sun_wrap_div").mouseover(function() {
        $(".onecate").css("background-color", "gold");
        $(".catebox3").slideDown();
    });

    $(".main-section").mouseover(function() {
        $(".onecate").css('background-color', 'black');
        $(".catebox3").slideUp();
    })
})