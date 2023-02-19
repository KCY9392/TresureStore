 /**
 *
 */

 /* 상품 이미지 */
window.onload = function (){
	$('#inputImage').on('change', readURL); // 파일 올릴 때마다 readURL 함수 호출
}
const fileBuffer = []; // 파일저장용 전역변수

//이미지 미리 보기 함수
function readURL() {
	const maxSize = 10 * 1024 * 1024; // 이미지 파일 당 최대 사이즈 설정 : 10MB
	const input = this;

	if(input.files && input.files[0]) { // 크기가 정해지지 않은 files 배열
		var reader = new FileReader();

		//이미지 파일 개수 제한
		let mainImage = false;
		$('.registUserImages').each((i, e) => {
			// 삭제 상태가 아닌 것만 체크하도록
			if ($(e).find(":hidden.status").val() != "D" && $(e).find(":hidden.fileType").val() == "T") {
				mainImage = true;
				return false;
			}
		});

		let len = setCountText() + input.files.length;
		console.log("mainImage : ", mainImage);
		if (len > 3) {
			alert('사진은 최대 3장 까지 올릴 수 있습니다.');
			return false;
		}

		let index = 0;

		reader.onload = function(evt) {
			// 이미지 파일 사이즈 비교
			const fileSize = input.files[index].size;
			if(fileSize > maxSize) {
				alert('이미지파일 사이즈는 10MB 이내로 등록 가능합니다.');
				return false;
			}
			const image = input.files[index];

			// 이미지 파일 유효성 검사
			const fileEx = image.name.slice(image.name.lastIndexOf(".")+1).toLowerCase();
			if(fileEx != "jpg" && fileEx != "png" && fileEx != "gif" && fileEx != "bmp" && fileEx != "jpeg") {

				return false;
			}

			fileBuffer.push(image); //push

			// 이미지 태그 생성
			const $li = $('<li></li>').attr({ draggable: 'false' }).addClass('registUserImages');
			const $div = $('<div></div>');
			const $image = $('<img/>').attr({ 'src': this.result, alt: '상품이미지' });
			const $button = $('<button></button>');

			// 첫번째 이미지를 대표이미지로 설정
			// if($('.registUserImages').length == 0){
			if (!mainImage) {
				// index = 0;
				$div.addClass('imageRepresentive').text('대표이미지');
			}

			// 태그 붙이기
			$('#imageList').append($li); // ul 태그의 하위 태그로 li 태그 붙이기
			let $file = $("#inputImage").clone().removeAttr("id").hide();
			let fileType = $("<input>", { type : "hidden", class : "fileType", value : mainImage ? "D" : "T" });
			let status = $("<input>", { type : "hidden", class : "status", value : "N" });
			$li.append($div, $image, $button, $file, fileType, status); // li 태그의 하위 태그로 세가지 태그 붙이기

			// X버튼 클릭 시 deleteImage 함수 호출
			$button.attr('type', 'button').addClass('image_cancleBtn'); // .click(deleteImage);

			// 상품이미지(0/3) 개수 변경
			setCountText();
			// $('.image_sub small').text(`(${$('.registUserImages').length}/3)`);

			// 한번에 이미지 여러개 넣기
			if(index < input.files.length - 1) {
				reader.readAsDataURL(input.files[++index]);
			}
		}

		// 이미지를 데이터 URI로 표현
		reader.readAsDataURL(input.files[index]);

	}
}

	// 이미 업로드 된 이미지의 삭제 버튼을 누르면
	$(document).on("click", ".image_cancleBtn", (e) => {
		// li 변수를 선언하고 버튼으로부터 가장 가까운 li를 대입한다.
		let li = $(e.target).closest("li");
		// li로부터 자식 요소 중 class가 fileType인걸 찾아서 value에 "D"를 넣어준다. (대표이미지일 경우 삭제하면 대표이미지가 되면 안됨.)
		$(li).find(".fileType").val("D");
		// li로부터 자식 요소 중 class가 status인걸 찾아서 value에 "D"를 넣어준다. (삭제 처리)
		$(li).find(".status").val("D");
		// 마지막으로 해당 li를 숨긴다. 안보이게 해야함
		$(li).hide();

		// 마지막으로 이미지를 감 춘 후에 이미지 개수를 출력하기 위한 변수
		let length = 0;
		// 대표이미지의 유무를 판단할
		let mainImage = false;

		// class가 registUserImages인 li 요소를 반복한다. i는 index이고 e는 요소
		$('.registUserImages').each((i, e) => {
			// 일단 확인용으로 짝어봄
			console.log(i, " -> fileType :", $(e).find(".fileType").val());
			// 반복하는 li 요소의 자식 중 class가 fileType의 value 속성이 "T"인게 있다면
			if ($(e).find(".status").val() != "D" && $(e).find(".fileType").val() == "T") {
				// mainImage를 true로 변경한다.
				mainImage = true;
				return false;
			}
		});

		setCountText();
		// 대표 이미지 유무를 확인하기 위한 값

		console.log("mainImage :", mainImage);
		// 만약 대표 이미지가 없다면, 이미지 중 가장 첫번째를 대표 이미지로 선정한다.
		if (!mainImage) {
			$('.registUserImages').each((i, e) => {
				if ($(e).find(".status").val() != "D") {
					// 해당 이미지를 대표 이미지라는 "T"를 넣는다.
					$(e).find(".fileType").val("T");
					// div 태그를 생성하고 class는 "imageRepresentive"로 텍스트는 "대표이미지"로 설정
					let div = $("<div>", { class : "imageRepresentive", text : "대표이미지" });
					// 현재 요소의 가장 첫번쨰에 붙인다.
					$(div).prependTo(e);
					// break와 동일 효과
					return false;
				}
			});
		}
	});

function setCountText() {
	let len = 0;
	$('.registUserImages').each((i, e) => {
		// 삭제 상태가 아닌 것만 체크하도록
		console.log("STATUS :", $(e).find(":hidden.status").val());
		if ($(e).find(":hidden.status").val() != "D") {
			len++;
		}
	});
	$(".image_sub small").text("(" + len + "/3)");
	return len;
}

//이미지 삭제 함수
function deleteImage() {
	// 배열 내의 파일 제거
	const fileIndex = $(this).closest('li').index();
    fileBuffer.splice(fileIndex - 1, 1);

    // 대표이미지를 지웠을 시 다음 이미지를 대표이미지로 지정
	if($(this).closest('li').children('div').hasClass('imageRepresentive')) {
		const $pre = $(this).closest('li').next().find('div').addClass('imageRepresentive').text('대표이미지');
	}
	$(this).closest('li').remove();
	//$('.image_sub small').text(`(${$('.registUserImages').length}/3)`);
};

function sell_file() {
	if (setCountText() == 0) {
		alert("이미지를 하나라도 등록하셔야 합니다.");
		return false;
	}
	$("#inputImage").remove();
}
