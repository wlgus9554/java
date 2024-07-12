/**
 * main에서 사용되는 js
 */

 $(function(){
	$(".dataRow").click(function(){
		// alert("click");
		let no = $(this).find(".no").text();
		console.log("no= " + no);
		// 어떤 모듈을 클릭했는지 알아내 보자.
		if($(this).hasClass("board")){
//			alert("Board click")
			location = "/board/view.do?no=" + no + "&inc=1";
		} else if($(this).hasClass("image")){
//			alert("Image click")
			location = "/image/view.do?no=" + no;
		}
	});
 });