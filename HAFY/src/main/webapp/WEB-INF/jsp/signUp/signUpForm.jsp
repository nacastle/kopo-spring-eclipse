<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/product/product.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>

</head>
<body>

   <nav class="site-header sticky-top py-1" style="background: #27b2a5">
      <div class="container d-flex flex-column flex-md-row justify-content-between">
      	<h5 class="masthead-brand" style="font-weight:bold; margin-top:2%; color: white;">본인 인증</h5>
      </div>
    </nav>
    
   <form action="${pageContext.request.contextPath }/signUpProcess" name="sForm" autocomplete="off"
   		method="post" onsubmit="return doSignUp()">
     <div class="col-md-8 order-md-1">
          <h5 class="mb-3"> </h5>
            <div class="row">
              
              <div class="col-md-6 mb-3">
              <label for="username">아이디</label>
              <div class="input-group">
                <input type="text" class="form-control" name="id" placeholder="아이디" onkeydown="hideCheck()">
                <div class="input-group-prepend">
                  <span class="input-group-text">중복검사</span>
                </div>
              </div>
              <div class="check" id="idCheck" style="color: red; display: none;">
                  	아이디를 입력해주세요
                </div>
                <div id="idCheck2" style="color: red; display: none;">
                  	아이디가 중복됩니다. 다른 아이디를 입력해주세요.
                </div>
            </div>
              
              <div class="col-md-6 mb-3">
                <label>패스워드</label>
                <input type="password" class="form-control" name="password" onkeydown="hideCheck()">
                <div class="check" id="passwordCheck" style="color: red; display: none;">
                  	패스워드를 입력해주세요
                </div>
              </div>
              
              <div class="col-md-6 mb-3">
                <label>패스워드 확인</label>
                <input type="password" class="form-control" name="password2" onkeydown="hideCheck()" >
                <div class="check" id="passwordCheck2" style="color: red; display: none;">
                  	패스워드가 불일치합니다.
                </div>
              </div>
              
              
              <div class="col-md-6 mb-3">
                <label>이름</label>
                <input type="text" class="form-control" name="name" onkeydown="hideCheck()">
                <div class="check" id="nameCheck" style="color: red; display: none;">
                  	이름을 입력해주세요
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName" style="display: block;">주민등록번호</label>
                <input type="number" class="form-control" maxlength="6" name="resNo1" 
                	style="width: 45%; display: inline;" oninput="numberMaxLength(this);" onkeydown="hideCheck()" > - 
                <input type="password" class="form-control" maxlength="7" name="resNo2" 
                	style="width: 45%; display: inline;" onkeydown="hideCheck()" >
<!--                 <div class="invalid-feedback"> -->
                <div class="check" id="resCheck" style="color: red; display: none;">
                  	주민등록번호를 입력해주세요.
                </div>
              </div>
            </div>

            

          

            <div class="mb-3">
              <label for="address">상위주소</label>
              <input type="text" class="form-control" name="address1" placeholder="ex. 서울시 서초구 내곡동" onkeydown="hideCheck()">
             
            </div>

            <div class="mb-3">
              <label for="address2">세부주소<!--  <span class="text-muted">(Optional)</span> --></label>
              <input type="text" class="form-control" name="address2" placeholder="아파트명" onkeydown="hideCheck()">
               <div class="check" id="addressCheck" style="color: red; display: none;">
                	주소를 입력해주세요.
              </div>
            </div>
            
            <div class="row">
              <div class="col-md-5 mb-3">
                <label for="country">통신사</label>
                <select class="custom-select d-block w-100" name="company" onchange="hideCheck()">
                  <option value="">선택</option>
                  <option>SKT</option>
                  <option>LG</option>
                  <option>KT</option>
                </select>
                <div class="check" id="companyCheck" style="color: red; display: none;">
                  통신사를 선택해주세요.
                </div>
              </div>
            </div>
            
            <div class="mb-3">
              <label for="phone">전화번호<!--  <span class="text-muted">(Optional)</span> --></label>
              <input type="number" class="form-control" name="phone" placeholder="'-' 를 제외하고 입력해주세요." onkeydown="hideCheck()">
              <div class="check" id="phoneCheck" style="color: red; display: none;">
               	전화번호를 입력해주세요.
              </div>
            </div>

            
        </div>
        
        <div class="footer" style="background: white;">
      		<div class="container" style="margin-bottom: 1rem;">
            	<button class="btn btn-primary btn-lg btn-block" type="submit" style="font-weight:bold; border:#27b2a5; background: #27b2a5; color: white;">인증하기</button>
      		</div>
    	</div>
     </form>

    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script>
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      });
      
      // 주민번호 앞자리 최대 길이 지정
      function numberMaxLength(e){
          if(e.value.length > e.maxLength){
              e.value = e.value.slice(0, e.maxLength);
          }
      }
      
      function isSelect() {
    	  if (document.sForm.company.value != "") {
				$("#companyCheck").hide();
    	  }
      }
      
      function pwdCheck() {
    	  if(document.sForm.password.value == document.sForm.password2.value)
        	  $(".check").hide();
	}
      
      function hideCheck() {
    	  $(".check").hide();
		
	}
    		
    		function doSignUp() {

    			var f = document.sForm;
    			
    			if (f.id.value == "") {
    				f.id.focus()
    				$("#idCheck").show();
    				return false
    			}
    			if (f.password.value == "") {
    				f.password.focus()
    				$("#passwordCheck").show();
    				return false
    			}
    			if (f.password.value != f.password2.value) {
    				f.password2.focus()
    				$("#passwordCheck2").show();
    				return false
    			}
    			
    			if (f.name.value == "") {
    				f.name.focus()
    				$("#nameCheck").show();
    				return false
    			}
    			if (f.resNo1.value == "") {
    				f.resNo1.focus()
    				$("#resCheck").show();
    				return false
    			}
    			if (f.resNo2.value == "") {
    				f.resNo2.focus()
    				$("#resCheck").show();
    				return false
    			}
    			
    			if (f.address1.value == "") {
    				f.address1.focus()
    				$("#addressCheck").show();
    				return false
    			}
    			if (f.address2.value == "") {
    				f.address2.focus()
    				$("#addressCheck").show();
    				return false
    			}
    			if (f.company.value == "") {
    				f.company.focus()
    				$("#companyCheck").show();
    				return false
    			}
    			if (f.phone.value == "") {
    				f.phone.focus()
    				$("#phoneCheck").show();
    				return false
    			}

    			
    			if (click == false) {
    				alert("아이디 중복체크를 해주세요.")
    				f.idCheck.focus();
    				return false;
    			}

    			if (tMsg == "unavailable") {
    				alert("아이디가 중복됩니다. 아이디를 확인해주세요.")
    				f.id.focus()
    				return false
    			}
    			

    			if (f.post.value == "") {
    				alert("우편번호를 입력하세요")
    				f.post.focus()
    				return false
    			}
    			return true;
    		}
    		

    </script>
</body>
</html>