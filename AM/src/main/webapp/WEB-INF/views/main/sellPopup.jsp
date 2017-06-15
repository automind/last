<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<%@include file="../include/navSource.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시승 신청서</title>
<style type="text/css">
#pop{
	width:90%; 
	height:84%; 
	color:black; 
	position:absolute; 
	text-align:left;
	border:2px solid #3d3d3d;
	left:15px;
	padding:10px;
}
.form-nm {
	display: inline-block;
	width: 40%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	margin-bottom:40px;
	margin-top:15px;
}

.form-model {
	display: inline-block;
	width: 40%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	margin-bottom:40px;
	text-align: center !important;
}

.form-hp {
	display: inline-block;
	width: 70px;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	margin-bottom:40px;
}

.form-dt {
	display: inline-block;
	width: 77px;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	margin-bottom:30px;
}
html{
	overflow: hidden;
}
</style>
</head>
<body id="pBody">
	<h1 style="text-align: center;">&lt;신 청 서&gt;</h1>
	<form method="post" role="form" name="frm">
	<div id="pop">
		<div style="padding-top:15px; color:red; text-align: center;">**주의: 당일날 시승 신청은 불가능 합니다.</div>
		<div>
			<label for="nm">이 름 : </label>
			<input type="text" name="nm" id="nm" class="form-nm"/>
		</div>
		<div>
			<label for="hpf">휴대폰 번호 : </label>
			<select id="hpf" name="hpf" class="form-hp">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
			- <input type="text" name="hps" id="hps" size="1" maxlength="4" class="form-hp"/> 
			- <input type="text" name="hpt" id="hpt" size="1" maxlength="4" class="form-hp"/>
		</div>
		<div>
			<label for="model">차 종 : </label>
			<select id="model" name="model" class="form-model">
				<option value="" disabled="disabled" selected="selected">------선택--------</option>
				<optgroup label="세단">
					<option value="포르쉐 파나메라 스포츠 투리스모">포르쉐 파나메라 스포츠 투리스모</option>
					<option value="메르세데스-벤츠 S클래스">메르세데스-벤츠 S클래스</option>
					<option value="2018 BMW M4 CS">2018 BMW M4 CS</option>
					<option value="2014 람보르기니 우라칸">2014 람보르기니 우라칸</option>
					<option value="2018 람보르기니 우라칸 퍼포만테">2018 람보르기니 우라칸 퍼포만테</option>
				</optgroup>
				<optgroup label="SUV">
					<option value="2018 랜드로버 레인지로버 벨라">2018 랜드로버 레인지로버 벨라</option>
					<option value="2018 포드 익스페디션">2018 포드 익스페디션</option>
				</optgroup>
				<optgroup label="경차">
					<option value="더 넥스트 스파크">더 넥스트 스파크</option>
				</optgroup>
			</select>
			<div>
				<label for="dt_yy">신 청 날 짜 : </label>
				<input maxlength="4" class="form-dt" type="text" name="dt_yy" id="dt_yy" placeholder="년(4자)"/>
				<select name="dt_mm" id="dt_mm" class="form-dt" style="top:1">
					<option value="" selected="selected" disabled="disabled">월</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<input type="text" maxlength="2" name="dt_dd" id="dt_dd" class="form-dt" placeholder="일"/>
			<div>
				<label for="rvTime">예 약 시 간 : </label>
				<select name="rvTime" id="rvTime" class="form-dt" style="top:1">
					<option value="" selected="selected" disabled="disabled">선택</option>
					<option value="10">10시</option>
					<option value="11">11시</option>
					<option value="14">14시</option>
					<option value="15">15시</option>
					<option value="16">16시</option>
					<option value="17">17시</option>
				</select>
			</div>		
			<button type="submit" id="chk" class="btn-primary" style="text-align: center; margin-right:60px; margin-left:100px">신청</button>
			<button type="button" id="close" class="btn-primary">닫기</button>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript">
	$("#chk").on("click",function(e){
			e.preventDefault();
			
			if(popupChk()){
				var formObj = $("form[role='form']");
					formObj.attr("action","/main/sellInfo/popup");
					formObj.submit();
				alert("신청이 완료 되었습니다.");
			};
		});
			
	$("#close").on("click",function(){
			if(confirm("창을 닫으시겠습니까?")){
					window.close();
				}else{
					return false;
				}
			});	
			
</script>
<!-- 유효성 검사 -->
<script type="text/javascript">
/*이름/공백 체크*/
function space(val){
	/*var pattern = /(^\s*)|(\s*$)/g;*/ // \s 공백 문자
	var pattern = /^[가-힣a-zA-Z]*$/;

	val = pattern.test(val);
	
	return val;
}
/* 숫자 체크 */
function num(val){
	var pattern = /[0-9]/g;
	
	val = pattern.test(val);
	
	return val;
};

function popupChk(){
	
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
			document.frm.nm.value = "";
			document.frm.nm.focus();
			chk = false;
			return false;
		}
		
		
		/*유효성 체크(가운데번호)*/
		var hpsVal = document.frm.hps.value;
		
		if(hpsVal == null || hpsVal == ""){
			alert("번호를 입력하여 주세요.");
			document.frm.hps.focus();
			chk = false;
			return false;
		}
		if(hpsVal != null || hpsVal != ""){
			
			if(hpsVal.length < 3){
				alert("번호를 3개 또는 4개이상 입력하여 주세요.");
				document.frm.hps.value = "";
				document.frm.hps.focus();
				chk = false;
				return false;
			}
		}	
			if(num(hpsVal)==false){
				alert("숫자만 가능합니다.");
				document.frm.hps.value = "";
				document.frm.hps.focus();
				chk = false;
				return false;
			}
		
			/*유효성 체크(마지막번호)*/
			var hptVal = document.frm.hpt.value;
			
			if(hptVal == null || hptVal == ""){
				alert("번호를 입력하여 주세요.");
				document.frm.hpt.focus();
				chk = false;
				return false;
			}
			if(hptVal != null || hptVal != ""){
				
				if(hptVal.length < 4){
					alert("번호를 4개이상 입력하여 주세요.");
					document.frm.hpt.value = "";
					document.frm.hpt.focus();
					chk = false;
					return false;
				}
			}	
				if(num(hptVal)==false){
					alert("숫자만 가능합니다.");
					document.frm.hps.value = "";
					document.frm.hpt.focus();
					chk = false;
					return false;
				}
			
			
		/*유효성 체크(모델)*/
		var modelVal = document.frm.model.value; 
		
		if(modelVal==""){
			alert("차종을 선택하여 주세요.");
			document.frm.model.focus();
			chk = false;
			return false;
		}
		
		/*유효성 체크(년도)*/
		var dt_yyVal = document.frm.dt_yy.value;
		
		if(dt_yyVal == null || dt_yyVal == ""){
			alert("년도를 입력하여 주세요.");
			document.frm.dt_yy.focus();
			chk = false;
			return false;
		}
		if(dt_yyVal != null || dt_yyVal != ""){
			
			if(dt_yyVal.length < 4){
				alert("숫자를 4개이상 입력하여 주세요.");
				document.frm.dt_yy.value = "";
				document.frm.dt_yy.focus();
				chk = false;
				return false;
			}
		}	
			if(num(dt_yyVal)==false){
				alert("숫자만 가능합니다.");
				document.frm.dt_yy.value = "";
				document.frm.dt_yy.focus();
				chk = false;
				return false;
			}
		
			/*유효성 체크(월)*/
			var dt_mmVal = document.frm.dt_mm.value; 
			
			if(dt_mmVal==""){
				alert("월을 선택하여 주세요.");
				document.frm.dt_mm.focus();
				chk = false;
				return false;
			}
			
			/*유효성 체크(일)*/
			var dt_ddVal = document.frm.dt_dd.value;
			
			if(dt_ddVal == null || dt_ddVal == ""){
				alert("일을 입력하여 주세요.");
				document.frm.dt_dd.focus();
				chk = false;
				return false;
			}	
			if(num(dt_ddVal)==false){
				alert("숫자만 가능합니다.");
				document.frm.dt_dd.value = "";
				document.frm.dt_dd.focus();
				chk = false;
				return false;				
			}
			

		/*유효성 체크(예약시간)*/
		var rvTimeVal = document.frm.rvTime.value; 
		
		if(rvTimeVal==""){
			alert("시간을 선택하여 주세요.");
			document.frm.rvTime.focus();
			chk = false;
			return false;
	}
		return chk;
}
</script>
</body>
</html>