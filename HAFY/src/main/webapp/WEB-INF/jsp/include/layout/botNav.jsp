<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <nav class="na-nav2 navbar fixed-bottom navbar-expand-sm navbar-dark" style="background: #27b2a5; padding: .1rem 0rem; height: 3rem;">

		<a class="p-2" href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a> 
		<a class="p-2" href="#" ><div><i class="fa fa-bars fa-lg"></i></div> 카테고리</a>
		<a class="p-2" href="#" ><div><i class="fa fa-hourglass-half fa-lg" aria-hidden="true"></i></div>내 경매</a>
		<a class="p-2" href="${pageContext.request.contextPath}/displayForm" ><div><i class="fa fa-arrow-circle-up fa-lg"></i></div>출품하기</a> 
		<a class="p-2" href="#" ><div><i class="fa fa-user fa-lg"></i></div>MY</a> 
    </nav>
    
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script type="text/javascript">
	  $('.na-nav a').on('click',function(){
		 $(this).addClass('top-on');
		 $(this).siblings().removeClass('top-on');
		});
	  
	  $('.na-nav2 a').on('click',function(){
		 $(this).addClass('bottom-on');
		 $(this).siblings().removeClass('bottom-on');
		});
  
  </script>    

