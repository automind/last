
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>AutoMind | 로그인</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<%@include file="../include/navSource.jsp"%>
<style type="text/css">
	.background-white {
	  	background-color: #FFFFFF;
	}
	
	.margin-vert-30 {
		margin-top: 30px;
  		margin-bottom: 30px;
	}
	
	.login-page {
		background: none repeat scroll 0 0 #FEFEFE;
		border: 1px solid #ebebeb;
		border-radius: 5px;
		box-shadow: 0 0 3px #EEEEEE;
		color: #555555;
		padding: 30px;
		
	}
	
	.login-page label {
		font-weight: normal;
	}
	
	.cBox{
		margin-left:100px !important;
	}
	
	.goog-te-gadget-simple {
		background-color: black;
	}
	
</style>
</head>
<body>
<%@include file="../include/navHeader.jsp"%>
  <!-- === BEGIN CONTENT === -->
  <section id="portfolio" class="portfolio section-space-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-13">
                    <div class="section-title">
                        <h2>L&nbsp;o&nbsp;g&nbsp;i&nbsp;n</h2>
                    </div>
                </div>
            </div>
            <div id="content">
                <div class="container background-white">
                    <div class="container">
                        <div class="row margin-vert-30">
                            <!-- Login Box -->
                            <div class="col-md-6 col-md-offset-3 col-sm-offset-3">
                                <form class="login-page" action="/user/loginPost" method="post">
                                    <div class="login-header margin-bottom-30">
                                        <h2>로그인 하시길 바랍니다.</h2>
                                    </div>
                                    <div class="input-group margin-bottom-20">
                                        <span class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </span>
                                        <input name="uid" placeholder="I D" class="form-control" type="text">
                                    </div>
                                    <div class="input-group margin-bottom-20">
                                        <span class="input-group-addon">
                                            <i class="fa fa-lock"></i>
                                        </span>
                                        <input name="upw" placeholder="Password" class="form-control" type="password">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="checkbox">
                                                <input name="useCookie" type="checkbox" class="cBox">자동 로그인</label>
                                        </div>
                                        <div class="col-md-6">
                                            <button class="btn btn-primary pull-right" type="submit">Login</button>
                                        </div>
                                    </div>
                                    <hr>
                                    <h4>앗, 로그인이  안 되나요 ?</h4>
                                    <p>
                                       <p>
                                       		<a href="/user/staffJoinForm" class="text-right">회원 가입</a>
                                       </p>
                                       <a href="/main/contact" id="search">비밀번호 찾기</a>
                                    </p>
                                </form>
                            </div>
                            <!-- End Login Box -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- === END CONTENT === -->
		</div>
	</section>
<%@include file="../include/footer.jsp"%>
<script type="text/javascript">
	$("#search").on("click",function(){
		alert("고객센터로 유선문의 바랍니다!!");
	});
</script>
  </body>
</html>