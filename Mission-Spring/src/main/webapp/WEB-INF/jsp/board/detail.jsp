<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css"/> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/layout.css"/> 

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>

   function getReplyList(){ //댓글 있는 곳 로드시, 댓글 추가 시 댓글리스트가 뜨게끔 
//       ajax통해서 해당 게시물의 댓글리스트를 조회  => <div id="replyList"></div> 조회데이터 업데이트 
      $.ajax({
         url : '${ pageContext.request.contextPath }/reply/${ board.no }',
         type : 'get',
         success : function(data){  // /reply 로부터 받아온 데이터
        	 let list = JSON.parse(data); 
        	 
        	 
			
//         	   $('#replyList').html('');  //혜주 방법
        	   $('#replyList').empty(); //#replyList 하위 애들 지우기
        	 $(list).each(function() {
        		 console.log(this)
        		 
        		 let str = "";
        		 str += '<hr>';
        		 str += '<div>';
        		 str += '<strong>' +  this.content + '</strong>'
				 str += '(' + this.writer + ')'
				 str += '&nbsp;&nbsp;&nbsp;'+this.regDate
				 str += '&nbsp;&nbsp;&nbsp;'+'<button class="delBtn" id=' +this.no+'>삭제</button>'
				 str += '</div>'
        		 $('#replyList').append(str);
				
			})
//             for (var i = 0; i < list.length; i++) {
//             	console.log(list[i])
// 			}
         },
         error : function(){
            alert('실패')
         }
      })
   }

$(document).ready(function(){
   
   $('#replyAddBtn').click(function(){
      let content = document.rform.content.value;
      let writer = document.rform.writer.value;
      
      //  /reply/insert?boardNo=12&content=aaa&writer=bbb 
            
      $.ajax({
         url : '${ pageContext.request.contextPath }/reply',
         type : 'post',
         data : {   	// /reply에게 전달하는 데이터
            'boardNo' : ${ board.no }, 
            'content' : content, 
            'writer' : writer 
         }, 
         success : function(){
            //성공했을 경우 값 지워주기 화면단에서
            document.rform.content.value ='';
            document.rform.writer.value ='';
            getReplyList(); //전체 댓글리스트 호출
         }, 
         error : function(){
            alert('실패')
         },
         complete : function() {   // 성공하든 실패하든 무조건 실행하는...
             document.rform.content.value ='';
             document.rform.writer.value ='';
		}
        	 
      })      
   })
})

   $(document).ready(function(){
      getReplyList();
   })
   
   $(document).ready(function(){
	   $(document).on('click','.delBtn',function(){
		   
		   if(!confirm('댓글을 삭제하겠습니까?')) return;
		   
		   let replyNo = $(this).attr('id');
			
// 		   $.ajax({
// 			 url : '${pageContext.request.contextPath}/reply/' + replyNo,
// 			 type : 'delete',
// 			 success : function() {
// 				getReplyList();
// 			},
// 			error : function() {
// 				alert('실패')
// 			}
// 		   })
		   $.ajax({
			 url : '${pageContext.request.contextPath}/reply/' + replyNo + '/${board.no}',
			 type : 'delete',
			 success : function() {
				getReplyList();
			},
			error : function() {
				alert('실패')
			}
		   })
		   
	   })
		
	})
   
   
</script>
</head>
<body>
<header>   
   <jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>
   </header>
   <br>
   <br>
   <br>
   <section>
   <br>
   <br>
   <br>
      <div align="center">
         <hr>
         <h2>게시판 상세 페이지</h2>
         <hr>
         <br>
         <div class="container">
         <table class="table" border="1">
            <tr>
               <th width="25%">번호</th>
               <td>${ board.no }</td>
            </tr>
            <tr>
               <th width="25%">제목</th>
               <td><c:out value="${ board.title }" /></td>
            </tr>
            <tr>
               <th width="25%">글쓴이</th>
               <td><c:out value="${ board.writer }" /></td>
            </tr>
            <tr>
               <th width="25%">내용</th>
               <td>${ board.content }</td>
            </tr>
            <tr>
               <th width="25%">조회수</th>
               <td>${ board.viewCnt }</td>
            </tr>
            <tr>
               <th width="25%">등록일</th>
               <td>${ board.regDate }</td>
            </tr>
            <c:if test="${ not empty fileList }">
                  <tr>
                     <th>첨부파일</th>
                  <td>
                     <c:forEach items="${ fileList }" var="file">
                        <a href="/Mission-Spring/upload/${ file.fileSaveName }">
                           ${ file.fileOriName } 
                        </a>
                        (${ file.fileSize } bytes)<br>
                     </c:forEach>
                  </td>
               </tr>
               
            </c:if>
         </table>
         </div>
         <br> <input type="button"  value="수정" class="btn btn-outline-light text-dark" onclick="doAction('U')">&nbsp;&nbsp; 
         <input type="button"  value="삭제" class="btn btn-outline-light text-dark" onclick="doAction('D')">&nbsp;&nbsp; 
         <input type="button"  value="목록" class="btn btn-outline-light text-dark"onclick="doAction('L')">&nbsp;&nbsp;
         
         <br>
         <hr>
      <form name="rform">
         댓글 : <input type="text" name="content" size="50">
         이름: <input type="text" name="writer" size="10">
         <input type="button" class="btn btn-outline-light text-dark" value="댓글추가 " id="replyAddBtn">
      </form> 
      <div id="replyList"></div>       
         
      </div>
   </section>
   
   <footer>
      <jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
   </footer>

</body>
</html>