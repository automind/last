/*이름/공백 체크*/
function space(val){
	var pattern = /^[가-힣a-zA-Z]*$/;

	val = pattern.test(val);
	
	return val;
}
	
function contactChk(){
	
	var chk = true;
	
	/*유효성 체크(이름)*/
	var nmVal = document.frm.nm.value;
	
	if(nmVal == null || nmVal == ""){
		alert("이름을 입력하여 주세요.");
		document.frm.nm.focus();
		chk = false;
		return false;
	}
	if(nmVal != null || nmVal != ""){
		
		if(nmVal.length < 2){
			alert("이름을 2글자 이상 입력하여 주세요.");
			document.frm.nm.focus();
			chk = false;
			return false;
		}else if(nmVal.length > 20){
			alert("이름은 최대 20자까지 입력 가능합니다.");
			document.frm.nm.focus();
			chk = false;
			return false;
		}
	}	
		if(space(nmVal)==false){
			alert("한글, 영어만 가능합니다.");
			document.frm.nm.focus();
			chk = false;
			return false;
		}
	/*유효성 체크(이메일)*/
	var emailVal = document.frm.email.value;
	
	if(emailVal==null || emailVal==""){
		alert("이메일을 입력하여 주세요.");
		document.frm.email.focus();
		chk = false;
		return false;
	}
	
	if(emailVal!=null || emailVal!=""){
		var emailChk = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		
		if(emailChk.test(emailVal)==false){
			alert("이메일 주소를 다시 확인하여 주세요.");
			chk = false;
			return false;
		}
	}
	
	/*유효성 체크(항목)*/
	var subjVal = document.frm.subj.value; 
	
	if(subjVal==""){
		alert("항목을 선택하여 주세요.");
		document.frm.subj.focus();
		chk = false;
		return false;
	}
	
	/*유효성 체크(메세지)*/
	var messageVal = document.frm.message.value;
	
	if(messageVal == null || messageVal == ""){
		alert("내용을 입력하여 주세요.");
		document.frm.message.focus();
		chk = false;
		return false;
	}
	
	return chk;
}


