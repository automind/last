<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<%@include file="../include/navSource.jsp"%>
<title>가격 & 차량 안내</title>
<script type="text/javascript">
	$(function(){
		var url = "/main/sellInfo/popup";
		var winWidth = 430;
		var winHeight = 550;
		var winPosLeft = (screen.width - winWidth)/2;
		var winPosTop = (screen.height - winHeight)/2;
		var winOption = "width = " + winWidth 
				   + ", height = " + winHeight 
				   + ", top = " + winPosTop 
				   + ", left = " + winPosLeft;

		$("#order").on("click",function(){
			if(confirm("예약 하시겠습니까?")){
				window.open(url,"팝업",winOption,"resizable=no, scrollbar=no, status=no, toolbar=no");
			}else{
				return false;
			}
		});
	});
</script>
</head>
<body>
<%@include file="../include/navHeader.jsp"%>
	<!-- Portfolio Start -->
    <section id="portfolio" class="portfolio section-space-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="section-title">
                        <h2>가격 & 차량 안내</h2>
                        <p>AutoMind만의 혁신적인 기술이 탑재된 차량입니다.</p>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <ul class="portfolio">
                    <li class="filter" data-filter="all">모든차종</li>
                    <li class="filter" data-filter=".sedan">세단</li>
                    <li class="filter" data-filter=".suv">SUV</li>
                    <li class="filter" data-filter=".light">경차</li>
                </ul>
            </div>
            
            <div class="portfolio-inner">
                <div class="row">
                
                
                    <div class="col-md-4 col-sm-6 col-xs-12 mix sedan">
                        <div class="item">
                            <a href="/resources/images/sellInfo/porsche.jpg" class="portfolio-popup" title="포르쉐 파나메라 스포츠 투리스모">
                                <img src="/resources/images/sellInfo/porsche.jpg" alt="">
                            </a>
                            <p>가격 : ￦ 200,920,000원</p>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-sm-6 col-xs-12 mix sedan">
                        <div class="item">
                            <a href="/resources/images/sellInfo/benz.jpg" class="portfolio-popup" title="메르세데스-벤츠 S클래스">
                                <img src="/resources/images/sellInfo/benz.jpg" alt="">
                            </a>
                            <p>가격 : ￦ 111,550,000원</p>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-sm-6 col-xs-12 mix sedan">
                        <div class="item">
                            <a href="/resources/images/sellInfo/bmw.jpg" class="portfolio-popup" title="2018 BMW M4 CS">
                                <img src="/resources/images/sellInfo/bmw.jpg" alt="">
                            </a>
                            <p>가격 : ￦ 111,780,000원</p>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-sm-6 col-xs-12 mix sedan">
                        <div class="item">
                            <a href="/resources/images/sellInfo/huracan.jpg" class="portfolio-popup" title="2014 람보르기니 우라칸">
                                <img src="/resources/images/sellInfo/huracan.jpg" alt="">
                            </a>
                            <p>가격 : ￦ 317,200,000원</p>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-sm-6 col-xs-12 mix sedan">
                        <div class="item">
                            <a href="/resources/images/sellInfo/performante.png" class="portfolio-popup" title="2018 람보르기니 우라칸 퍼포만테">
                                <img src="/resources/images/sellInfo/performante.png" alt="">
                            </a>
                            <p>가격 : ￦ 420,000,000원</p>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-sm-6 col-xs-12 mix suv">
                        <div class="item">
                            <a href="/resources/images/sellInfo/landrover.jpg" class="portfolio-popup" title="2018 랜드로버 레인지로버 벨라">
                                <img src="/resources/images/sellInfo/landrover.jpg" alt="">
                            </a>
                            <p>가격 : ￦ 115,620,000원</p>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-sm-6 col-xs-12 mix suv">
                        <div class="item">
                            <a href="/resources/images/sellInfo/ford.jpg" class="portfolio-popup" title="2018 포드 익스페디션">
                                <img src="/resources/images/sellInfo/ford.jpg" alt="">
                            </a>
                            <p>가격 : ￦ 114,320,000원</p>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-sm-6 col-xs-12 mix apps light">
                        <div class="item">
                            <a href="/resources/images/sellInfo/spark.jpg" class="portfolio-popup" title="더 넥스트 스파크">
                                <img src="/resources/images/sellInfo/spark.jpg" alt="">
                            </a>
                            <p>가격 : ￦ 45,360,000원</p>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <div class="text-center margin-top-50">
          <a class="button button-style button-style-dark button-style-icon fa fa-long-arrow-right" href="/main/index" id="order">시 승 예 약 하 기</a>
            </div>
     
     </section>
    <!-- Portfolio End -->
<%@include file="../include/footer.jsp" %>
</body>
</html>