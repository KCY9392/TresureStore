/**
 * header js
 */
 
//검색창에 검색키워드 적었을 경우 -> exit버튼 보이게
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

//검색키워드 없을 경우, exit버튼 안보이게
function test() {
    $('#search').val('');
    $('#exit').hide();
}



// 검색키워드 작성후 검색버튼 눌렀을 경우,
$(document).on('click', '#searchGO', function(e){

	e.preventDefault();

	if($('#search').val()==''){
		Swal.fire({
                icon: 'error',
                title: '검색어를 입력하세요'                  
            });	
		return false;
	}
	
   document.getElementById('sfm').submit();
});



//카테고리박스 관련
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