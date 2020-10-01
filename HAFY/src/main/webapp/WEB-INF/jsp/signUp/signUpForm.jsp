<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/product/product.css" rel="stylesheet">
<style>

.fa {
	font-size: 0.8rem;
}

.col-md-6 {
    -webkit-box-flex: 0;
/*     -ms-flex: 0 0 50%; */
    flex: none;
    max-width: 100%;
}

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>

</head>
<body>

   <nav class="site-header sticky-top py-1" style="background: #27b2a5">
      <div class="container d-flex flex-column flex-md-row justify-content-between">
      	<h5 class="masthead-brand" style="font-weight:bold; margin-top:2%; color: white;">본인 인증</h5>
      </div>
    </nav>
    
   <form action="${pageContext.request.contextPath }/signUpSuccess" name="sForm" autocomplete="off"
   		method="post" onsubmit="return doSignUp()">
     <div class="col-md-8 order-md-1">
          <h5 class="mb-3"> </h5>
            <div class="row">
              
              <div class="col-md-6 mb-3">
              <label for="username">닉네임</label>
              <div class="input-group">
                <input type="text" class="form-control" id="inputID" name="nickname" placeholder="닉네임" onkeydown="typing()">
                <div class="input-group-prepend">
                  <span onclick="checkID()" class="input-group-text">중복검사</span>
                </div>
              </div>
                <div id="okMsg" style="display:none; color: green;">사용가능한 아이디입니다.</div>
                <div id="notOkMsg" style="display:none; color: red;">중복되는 아이디입니다.</div>
                <div id="typeMsg" style="display:none; color: red;">아이디를 입력해주세요.</div>
                <div id="checkDupl" style="display:none; color: red;">아이디 중복검사를 해주세요.</div>
              <div class="check" id="nicknameCheck" style="color: red; display: none;">
                  	아이디를 입력해주세요
                </div>
                <div id="nicknameCheck2" style="color: red; display: none;">
                  	닉네임이 중복됩니다. 다른 닉네임을 입력해주세요.
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
                <input type="text" class="form-control" maxlength="6" name="resNo" 
                	style="width: 45%; display: inline;" oninput="numberMaxLength(this);" onkeydown="hideCheck()" > - 
<!--                 <input type="password" class="form-control" maxlength="7" name="resNo2"  -->
                <input type="text" class="form-control" maxlength="1" oninput="numberMaxLength(this);" name="sex" 
                	style="width: 2.3rem; display: inline;" onkeydown="hideCheck()" >
                	&nbsp;
                	<i class="fa fa-circle" aria-hidden="true"></i>
                	<i class="fa fa-circle" aria-hidden="true"></i>
                	<i class="fa fa-circle" aria-hidden="true"></i>
                	<i class="fa fa-circle" aria-hidden="true"></i>
                	<i class="fa fa-circle" aria-hidden="true"></i>
                	<i class="fa fa-circle" aria-hidden="true"></i>
<!--                 <div class="invalid-feedback"> -->
                <div class="check" id="resCheck" style="color: red; display: none;">
                  	주민등록번호를 입력해주세요.
                </div>
              </div>
            </div>

            

          

            <div class="mb-3">
              <label for="address">배송 상위주소</label>
              <input type="text" class="form-control" name="address1" placeholder="ex. 서울시 서초구 내곡동" onkeydown="hideCheck()">
             
            </div>

            <div class="mb-3">
              <label for="address2">배송 세부주소<!--  <span class="text-muted">(Optional)</span> --></label>
              <input type="text" class="form-control" name="address2" placeholder="아파트명" onkeydown="hideCheck()">
               <div class="check" id="addressCheck" style="color: red; display: none;">
                	주소를 입력해주세요.
              </div>
            </div>
            
            <div class="row">
              <div class="col-md-5 mb-3">
                <label for="country">통신사</label>
                <select class="custom-select d-block w-100" name="phoneCompany" onchange="hideCheck()">
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
              <input type="text" class="form-control" name="phone" placeholder="'-' 를 제외하고 입력해주세요." onkeydown="hideCheck()">
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
      
      function typing() {
    	  $("#okMsg").hide()
    	  $("#notOkMsg").hide()
    		$("#typeMsg").hide()
    		$("#nicknameCheck").hide()
    		isCheck = false;
    	  idCheck = false;
    		
	}
      
      let idCheck = false; // 아이디 중복여부
      let isCheck = false; // 중복검사 여부
      function checkID() {
    	  var inputID = $("#inputID").val()
    	  
    	  if (inputID == '') {
    		  $("#typeMsg").show()
    	  } else {
//     	  console.log(inputID)
    	  $.ajax({
    		  url: "${pageContext.request.contextPath}/checkID",
    		  type: 'post',
    		  data: {
    			  inputID : inputID
    		  },
    		  success : function(data) {
    			  console.log("성공")
    			  console.log(data)
    			  console.log(typeof data)
    			  
    			  // 아이디가 중복되지않을때
    			  if (data == "false" ) {
    				  idCheck = true;
    				  isCheck = true;
    				  $("#okMsg").show()
    				  $("#checkDupl").hide();
    				  
    			  // 아이디가 중복될때
    			  } else {
    				  $("#notOkMsg").show()
    				  $("#inputID").empty()
    				  $("#checkDupl").hide();
    				  isCheck = true;
    				  
    			  }
			},
			error : function() {
				console.log("실패")
				
			}
    	  })
    	  }
		
	}
      
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
    			
    			if (f.nickname.value == "") {
    				f.nickname.focus()
    				$("#nicknameCheck").show();
    				return false
    			}
    			
    			if (!isCheck) {
    				$("#checkDupl").show();
    				f.nickname.focus()
					return false						
				}
    			if (!idCheck) {
    				$("#notOkMsg").show();
    				f.nickname.focus()
					return false						
				}
//     			if (f.password.value == "") {
//     				f.password.focus()
//     				$("#passwordCheck").show();
//     				return false
//     			}
//     			if (f.password.value != f.password2.value) {
//     				f.password2.focus()
//     				$("#passwordCheck2").show();
//     				return false
//     			}
    			
    			if (f.name.value == "") {
    				f.name.focus()
    				$("#nameCheck").show();
    				return false
    			}
    			if (f.resNo.value == "") {
    				f.resNo.focus()
    				$("#resCheck").show();
    				return false
    			}
    			if (f.sex.value == "") {
    				f.sex.focus()
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
    			if (f.phoneCompany.value == "") {
    				f.phoneCompany.focus()
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