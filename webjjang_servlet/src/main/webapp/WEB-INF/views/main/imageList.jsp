<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>


<script type="text/javascript">
   $(function() {
	   
      // 이미지 사이즈 조정 5:4
      let imgWidth = $(".imageDiv:first").width();
      let imgHeight = $(".imageDiv:first").height();
      console.log("image Width = " + imgWidth + " image Height = "
            + imgHeight);

      // 높이계산 - 너비는 동일 : 이미지와 이미지를 감싸고 있는 Div의 높이로 사용
      let height = imgWidth / 5 * 4;
      // imageDiv의 높이 조정.
      $(".imageDiv").height(height);
      // imageDiv의 배경을 검정색으로 변경
      $(".imageDiv").css("background","black");

      // 이미지 배열로 사용하면 안된다 . foreach사용 - jQuery each()
      $(".imageDiv > img").each(function(idx, image) {
         // 이미지가 계산된 높이보다 크면 줄인다.
         if ($(image).height() > height) {
            let image_width = $(image).width();
            let image_height = $(image).height();
            let width = height / image_height * image_width;
            console.log("changed image_width = " + width);
            // 이미지 높이 줄이기           
            $(image).height(height);
            // 이미지 너비 줄이기
            $(image).width(width);
         }
      });
});

</script>


   <div class="container">
      <h4>이미지 게시판 리스트</h4>
      
      <c:if test="${empty imageList }">
         <div class="jumbotron">
            <h4>데이터가 존재하지 않습니다.</h4>
         </div>
      </c:if>
      <c:if test="${!empty imageList }">
         <div class="row">
            <!-- 이미지의 데이터가 있는 만큼 반복해서 표시하는 처리 시작 -->
            <c:forEach items="${imageList }" var="vo" varStatus="vs">
               <!-- 줄바꿈처리 - 찍는 인덱스 번호가 3의 배수이면 줄바꿈을 한다. -->
               <c:if test="${(vs.index != 0) && (vs.index % 3 == 0) }">
              ${"</div>"}
              ${"<div class='row'>"}
           </c:if>
               <!-- 데이터 표시 시작 -->
               <div class="col-md-4 dataRow image imageLink">
                  <div class="card" style="width: 100%">
                     <div class="imageDiv text-center align-content-center">
                        <img class="card-img-top" src="${vo.fileName }" alt="image">
                     </div>
                     <div class="card-body">
                        <strong class="card-title"> <span class="float-right">${vo.writeDate }</span>
                           ${vo.name }(${vo.id })
                        </strong>
                        <p class="card-text text-truncate title">
                           <span class="no">${vo.no}</span>. ${vo.title }
                        </p>
                     </div>
                  </div>

               </div>
               <!-- 데이터 표시 끝 -->
            </c:forEach>
            <!-- 이미지의 데이터가 있는 만큼 반복해서 표시하는 처리 끝 -->
         </div>
      </c:if>
   </div>
