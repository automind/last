<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>navHeader</title>
</head>
<body>

	<!-- 로딩이미지배경설정  -->
    <div id="preloader">
      <!-- 로딩이미지 내부설정 -->
	  <div class="loader"></div>
    </div>
    
	<header id="home" class="home-section">
        
        <div class="header-top-area">
            <div class="container" style="margin:0; padding:0; width:100%;">
                
                <div class="col-sm-9">
                    <div class="col-sm-3" >
                        <div class="logo">
                            <a href="#">AutoMind</a>
                        </div>
                    </div>
                    
                    <div class="col-sm-9">
                        <div class="navigation-menu">
                            <div class="navbar">
                            	<!-- 모바일 반응형 처리 -->
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                        <span class="sr-only">토글 메뉴</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                                <!-- 메뉴창 -->
                                <div class="navbar-collapse collapse">
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="active">
                                        	<a class="smoth-scroll" href="/main/index">메 인</a>
                                        </li>
                                        <li>
                                        	<a class="smoth-scroll" href="/main/company">회사 소개</a>
                                        </li>
                                        <li class="dropdown">
          									<a class="dropdown-toggle" data-toggle="dropdown" href="#">
          										기술 소개 <span class="caret"></span>
          									</a>
          										<ul class="dropdown-menu">
            										<li>
            											<a href="/main/techIntro">주행 기술 내용</a>
            										</li>
            										<li>
            											<a href="/main/techIntro">주행 소개 영상</a>
            										</li>
          										</ul>
        								</li>
                                        <li>
                                        	<a class="smoth-scroll" href="/main/sellInfo">가격 & 차량안내</a>
                                        </li>
                                        <li>
                                        	<a class="smoth-scroll" href="/sboard/list">Q & A 게시판</a>
                                        </li>
                                        <li>
                                        	<a class="smoth-scroll" href="/main/contact">Contact</a>
                                        </li>
                                        <li>
                                        	<c:if test="${not empty login}">
                                        		<a class="smoth-scroll" href="/user/logout">
                                        			logout
                                        		</a>
                                        	</c:if>
                                        	<c:if test="${empty login}">
                                        		<a class="smoth-scroll" href="/user/login">
                                        			login / 회원가입
                                        		</a>
                                        	</c:if>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </header>
</body>
</html>