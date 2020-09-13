<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
</head>
<body>



    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script type="text/javascript">
    
    
//     CRUD - R
    function getConsultingList(){ //댓글 있는 곳 로드시, 댓글 추가 시 댓글리스트가 뜨게끔 
        //ajax통해서 해당 게시물의 댓글리스트를 조회  => <div id="replyList"></div> 조회데이터 업데이트 
        $.ajax({
           url : '${ pageContext.request.contextPath }/너가수정/${ 사원아이디 }',
           type : 'get',
           success : function(data){ //db에서 가져와
        	   
        	let consultingList = JSON.parse(data);
        	var consultingSchedule = [];
        	
        	  $(consultingList).each(function(){
        		  consultingSchedule.push({
        			title : this.consultingTitle(이건 너가 vo에 저장해준 이름으로 일단 임의로 컨설팅타이틀이라고 함),
        			start : this.startTime(얘도 마찬가지로 너가 정한 이름으로 고쳐)
        		  })
        	  }
               $('#calendar').fullCalendar({
                   header: {
                      left: 'prev,next today',
                      center: 'title',
                      right: 'month,agendaWeek,agendaDay'
                   },
                   /* defaultDate: '2020-09-12', */
                   businessHours: true, // display business hours
                   editable: true,
                   locale: "ko",
                   events: consultingSchedule,
                   
                   dayClick: function() {
                       alert('상담 예약을 진행 하시겠습니까?'); 
                       }
                });
          	}
          })
     });
     
     
     $(document).ready(function() {
		getConsultingList();
	})
	
	
	
// 	CRUD - C
$(document).ready(function(){
   
   $('#registerBtn').click(function(){
      let consultingTime = 어쩌구.value;
      let customerId = ${loginVO.id}
      let consultingTitle = 진희가 알아서 가져와바
      	기타 등등 필요한 데이터들 request영역에 등록해서 가져오는식으로 가져오든 어케 가져오든 가져오고
      
      //  /reply/insert?boardNo=12&content=aaa&writer=bbb 
            
      $.ajax({
         url : '${ pageContext.request.contextPath }/reply',
         type : 'post',
         data : {
        	 
        	 위에서 가져온 데이터들 data 속성안에 담아서 백엔드 쪽으로 넘겨주고 
         }, 
         success : function(){
        	 getConsultingList(); //전체 댓글리스트 호출
         }, 
         error : function(){
            alert('실패')
         }, complete : function(){
            //성공하던 실패하던 경우 값 지워주기 화면단에서
            document.rform.content.value ='';
            /* document.rform.writer.value =''; */
         }
         
      })      
   })
})

	
	
	
	
   


    
    
    
    
    
    </script>
</body>
</html>