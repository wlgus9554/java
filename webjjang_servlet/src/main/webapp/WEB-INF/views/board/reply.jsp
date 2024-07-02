<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pageNav" tagdir= "/WEB-INF/tags" %>

<script>
   $(function() {
      // 이벤트 처리 
      // ---------------- Modal 화면 이벤트 처리 ----------------
      // 댓글 등록 이벤트
      $("#replyWriteBtn").click(function() {

         // 제목을 댓글 등록
         $("#boardReplyModal").find(".modal-title").text("댓글 등록");
         // input / text 선택
         $("#boardReplyForm").find(".form-group").show();
         // data 지우기 
         $("#boardReplyForm")
         .find(".form-group input, .form-group textarea").val("");
         
         // 버튼 선택
         // 버튼이 다 보이게
         $("#boardReplyForm button").show();
         // 필요 없는 버튼을 안보이게 처리
         $("#replyModalUpdateBtn, #replyModalDeleteBtn").hide();

         // 모달창 보이게
         $("#boardReplyModal").modal("show");
      });

      // 댓글 수정 이벤트
      $(".replyUpdateBtn").click(function() {

         // 제목을 댓글 수정
         $("#boardReplyModal").find(".modal-title").text("댓글 수정");
         // input / text 선택 - 내용 / 작성자 / 비밀번호 
         
         // data 지우기 
         $("#boardReplyForm")
         .find(".form-group input, .form-group textarea").val("");
         
         // 댓글 번호와 내용, 작성자 데이터를 수집해서 value값으로 세팅해야함.
         // closest = 조상
         // find = 클릭 한 내부
         let replyDataRow = $(this).closest(".replyDataRow");
         // data("rno") - > tag 안에 data-rno = "값"
         let rno = replyDataRow.data("rno");
         let content = replyDataRow.find(".replyContent").text();
         let writer = replyDataRow.find(".replyWriter").text();
         
         // replyModal 입력란에 세팅하기
         $("#rno").val(rno);
         $("#content").val(content);
         $("#writer").val(writer);
         
         $("#boardReplyForm").find(".form-group").show();
         
         // 버튼 선택
         // 버튼이 다 보이게
         $("#boardReplyForm button").show();
         // 필요 없는 버튼을 안보이게 처리
         $("#replyModalWriteBtn, #replyModalDeleteBtn").hide();
         
         // 모달창 보이게
         $("#boardReplyModal").modal("show");
      });

      // 댓글 삭제 이벤트
      $(".replyDeleteBtn").click(function() {

         // 제목을 댓글 등록
         $("#boardReplyModal").find(".modal-title").text("댓글 삭제")
         // input / text 선택
         $("#boardReplyForm").find(".form-group").hide();
         $("#pwDiv").show();
         
         // data 지우기 
         $("#boardReplyForm")
         .find(".form-group input, .form-group textarea").val("");

         $(rno).val($(this).closest(".replyDataRow").data("rno"));
         // 버튼 선택
         // 버튼이 다 보이게
         $("#boardReplyForm button").show();
         // 필요 없는 버튼을 안보이게 처리
         $("#replyModalUpdateBtn, #replyModalWriteBtn").hide();

         // 모달창 보이게
         $("#boardReplyModal").modal("show")
      });
      
      // ---------------- Modal 화면 안의 처리버튼 이벤트 처리 ----------------
      $("#replyModalWriteBtn").click(function () {
         // alert("click - replyModalWrite");
         
         // 데이터 전송해서 실행되는 uri를 지정
         $("#boardReplyForm").attr("action" , "/boardreply/write.do");
         // 데이터를 전송하면서 페이지 이동 시킴
         $("#boardReplyForm").submit();
      });

      $("#replyModalUpdateBtn").click(function () {
         // alert("click - replyModalUpdate");
         
         // 데이터 전송해서 실행되는 uri를 지정
         $("#boardReplyForm").attr("action" , "/boardreply/update.do");
         // 데이터를 전송하면서 페이지 이동 시킴
         $("#boardReplyForm").submit();
      });
      
      $("#replyModalDeleteBtn").click(function () {
         // alert("click - replyModalDelete");
         
         // 데이터 전송해서 실행되는 uri를 지정
         $("#boardReplyForm").attr("action" , "/boardreply/delete.do");
         // 데이터를 전송하면서 페이지 이동 시킴
         $("#boardReplyForm").submit();
      });
   });
</script>

<div class="card">
   <div class="card-header">
      <span class="btn btn-primary float-right" id="replyWriteBtn">등록</span>
      <h3>댓글 리스트</h3>
   </div>
   <div class="card-body">
      <c:if test="${ empty replyList }">
        데이터가 존재하지 않습니다.
     </c:if>
      <c:if test="${ !empty replyList }">
         <!-- 데이터가 있는 만큼 반복 처리 시작 -->
         <c:forEach items="${replyList }" var="replyVO">
            <div class="card replyDataRow" data-rno="${replyVO.rno }"
               style="margin: 5px 0;">
               <div class="card-header">
                  <span class="float-right">${replyVO.writeDate }</span> 
                  <b class = "replyWriter">${replyVO.writer }</b>
               </div>
               <div class="card-body">
                  <pre class = "replyContent">${replyVO.content }</pre>
               </div>
               <div class="card-footer">
                  <button class="btn btn-success replyUpdateBtn">수정</button>
                  <button class="btn btn-danger replyDeleteBtn">삭제</button>
               </div>
            </div>
         </c:forEach>
         <!-- 데이터가 있는 만큼 반복 처리 끝 -->
      </c:if>
   </div>
   <div class="card-footer">
      <pageNav:replayPageNav listURI="view.do" pageObject="${replyPageObject }" query = "&inc=0"></pageNav:replayPageNav>
   
   </div>
</div>

<!-- 댓글 등록 / 수정 / 삭제를 위한 모달창 -->
<div class="modal" id="boardReplyModal">
   <div class="modal-dialog">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <!-- 버튼에 따라서 제목을 수정해서 사용 - .text(제목) -->
            <h4 class="modal-title">Modal Heading</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>

         <!-- 데이터를 넘기는 form -->
         <form id="boardReplyForm" method ="post">
            <input type="hidden" name="rno" id = "rno"> 
            <input type="hidden" name="no" value="${param.no }">
            
            <!-- 페이지 정보 보내기 -->
            <input type="hidden" name="page" value="${param.page }">
            <input type="hidden" name="perPageNum" value="${param.perPageNum }">
            <input type="hidden" name="key" value="${param.key }">
            <input type="hidden" name="word" value="${param.word }">
            
            <!-- Modal body -->
            <div class="modal-body">
               <!-- 내용 / 작성자 / 비밀번호 -->
               <div class="form-group" id ="contentDiv">
                  <label for="content">내용</label>
                  <textarea class="form-control" rows="3" id="content"
                     name="content"></textarea>
               </div>
               <div class="form-group" id = "writerDiv">
                  <label for="writer">작성자</label> <input type="text"
                     class="form-control" id="writer" name="writer">
               </div>
               <div class="form-group" id = "pwDiv">
                  <label for="pw">비밀번호</label> <input type="password"
                     class="form-control" id="pw" name="pw">
               </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
               <button class = "btn btn-primary" type = "button" id = "replyModalWriteBtn" >등록</button>
               <button class = "btn btn-success" type = "button" id = "replyModalUpdateBtn" >수정</button>
               <button class = "btn btn-warning" type = "button" id = "replyModalDeleteBtn" >삭제</button>
               <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
         </form>
      </div>
   </div>
</div>

