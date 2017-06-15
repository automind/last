<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<%@include file="../include/navSource.jsp"%>
<title>contact</title>

<script type="text/javascript">
	function chk(value){
		if(value=="견적 상담 신청"){
			alert("연락 받으실 번호를 꼭 기재해 주시길 바랍니다.");
		}
	}
</script>

</head>
<body>
<%@include file="../include/navHeader.jsp"%>
<!-- Contact Start -->
    <section id="contact" class="contact-us section-space-padding">
       <div class="container">
          <div class="row">
                <div class="col-sm-12">
                    <div class="section-title">
                        <h2>Contact Us</h2>
                        <p>AutoMind와 관련하여 궁금하신 점은 언제든지 문의해 주십시오. &nbsp;최대한 신속한 서비스로 여러분의 관심과 성원에 보답하겠습니다!</p>
                    </div>
                </div>
            </div>
            
            
           <div class="text-center" style="margin-top:10px; margin-bottom:40px">
            <div class="row">
            
               <div class="col-md-4 col-sm-4">
                <div class="contact-us-detail">  
                 <i class="fa fa-mobile color-6"></i>
                  <p><a href="tel:+0104967229">02 - 496 - 7229</a></p>
                 </div>
                </div>
               
               <div class="col-md-4 col-sm-4">
                <div class="contact-us-detail">
                 <i class="fa fa-mail-reply color-5"></i>
                  <p><a href="mailto:vddbb1@gmail.com">vddbb1@gmail.com</a></p>
                 </div>
                </div>
                 
               <div class="col-md-4 col-sm-4">
                <div class="contact-us-detail">
                 <i class="fa fa-clock-o color-3"></i>
                  <p>Mon - Fri &nbsp;11:00 – 17:00</p>
                 </div>
                </div>
              
               </div>
              </div>
            
         
         <div class="row">
           
           <div class="col-md-6">   
                 
               <div class="row">
                  <form role="form" name="frm">
                    
					  <div class="col-sm-6">
						<div class="form-group">
						  <input type="text" name="nm" id="nm" class="form-control" placeholder="이름(Name)">
						 </div>
                        </div>
								
                       <div class="col-sm-6">
					    <div class="form-group">
						 <input type="text" name="email" id="email" class="form-control" placeholder="이메일(E-mail)">
						 </div>
                        </div>
                        
                         <div class="col-sm-12">
						  <select name="subj" id="subj" class="form-group form-control" onchange="chk(this.value);">
							<option value="" selected disabled>항목</option>
							<option value="견적 상담 신청">견적 상담 신청</option>
							<option value="제품 관련 문의 및 고객 제안">제품 관련 문의 및 고객 제안</option>
							<option value="A/S 및 서비스 관련 문의">A/S 및 서비스 관련 문의</option>
							<option value="인사 및 채용 관련 문의">인사 및 채용 관련 문의</option>
						   </select>
                         </div>
								
                       	<div class="col-sm-12">
					    	<div class="textarea-message form-group">
					      		<textarea name="message" id="message" class="textarea-message form-control" placeholder="내용 입력(Insert Comment)" rows="5"></textarea>
						  	</div>
                        </div>
                   
                   
						<div class="text-center">
							<input type="button" id="contact-btn" class="button button-style button-style-dark button-style-icon text-center" value="전 송">      
		  					<!-- <button id="contact-btn" class="button button-style button-style-dark button-style-icon  fa fa-long-arrow-right text-center">
		  						전 송
		  					</button> -->
	                  	</div>
                       
                  </form>
                   
				</div>
               </div>
            
            
            <div class="col-md-6">   
              <div id="my-address" class="map space-set">
              <p>인터넷 연결 오류로 인해 구글맵 연동이 되지 않습니다.</p>
            </div>
           </div>
           
        
        </div>
       </div>
	</section>
	<script type="text/javascript" src="/resources/js/contact.js"></script>
	<script type="text/javascript">
		var result = "${message}";
	
		if(result == "SUCCESS"){
			alert("전송이 완료되었습니다.");
		}
	</script>
	<script>
			
		var formObj = $("form[role='form']");
			
		$("#contact-btn").on("click",function(){
			if(contactChk()){
				formObj.attr("method","post");
				formObj.attr("action","/main/contact/send");
				formObj.submit();
			}
		});
	</script>
<%@include file="../include/footer.jsp" %>
</body>
</html>