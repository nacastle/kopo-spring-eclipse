/**
 * ajax : 비동기식으로 서버와 통신
 * sendProcess와 responseMsg 함수 현장에서 정의 필요

 */


	let httpRequest = null;

	function getXMLHttpRequest() {

		if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		}

		if (window.ActiveXObject) {
			return new ActiveXObject("Microsoft.XMLHTTP");
		}

		return null;
	}

	function callbackFunc() {

		let msg = ""; // 여기부터 실질적 노필요

		if (httpRequest.readyState == 4) {

			// 서버 응답 후 상태코드 확인
			if (httpRequest.status == 200) {
				msg = httpRequest.responseText
				// alert(httpRequest.responseText)
				responseMsg(msg);
			}
		}


	}

	
