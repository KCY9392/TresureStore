/**
 * 
 */
 
$(function () {
    $('#search').keyup(function () {
        if ($("#search").val() != "") {
        	$("#search").css("background-color", "#FDF5E6");
            $("#exit").show();
        }else{
            $("#exit").hide();
        }
    });
    
    $("#search").focus(function(){
    	$(this).css("background-color", "#FDF5E6");
        $(".search2").css("background-color", "#FDF5E6");
    });
    $("#search").blur(function(){
    	$(this).css("background-color", "white");
        $(".search2").css("background-color", "white");
    });
});


function test() {
    $('#search').val('');
    $('#exit').hide();
}


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