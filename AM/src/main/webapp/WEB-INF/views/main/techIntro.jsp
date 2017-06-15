<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<%@include file="../include/navSource.jsp"%>
<title>기술 소개</title>
</head>
<body>
<%@include file="../include/navHeader.jsp"%>
<!-- About Start -->

	<section id="about" class="about-section">
         <div class="row">
         	<div class="section-title toppad">
         		<h2>자율 주행 영상</h2>
         	</div>
               
              <div class="col-md-6 col-sm-12 col-xs-12 about-me section-space-padding padleft">
              	<iframe width="560" height="315" src="https://www.youtube.com/embed/bA6ywy8WMbc" frameborder="0" allowfullscreen></iframe>
              </div>
                
              <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="about-me section-space-padding">
                  
                  <h2>About Car.</h2>
                  
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                 </div>
             
              </div>
                
          </div>
       </section>

    <section id="testimonials" class="testimonial-section section-space-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="section-title">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/bA6ywy8WMbc" frameborder="0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- About End -->

    <!-- Portfolio Start -->
    <section id="portfolio" class="portfolio section-space-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="section-title">
                        <h2>주행 소개 영상</h2>
                        <video src="/resources/video/cityCar.mp4" width="540" height="280" controls>안보이냐</video>
                    </div>
                </div>
            </div>
        </div>
        
     </section>
    <!-- Portfolio End -->
    
    <!-- Testimonial Start -->
     <section id="testimonials" class="testimonial-section section-space-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="section-title">
                        <h2>주행 소개 영상2</h2>
                        <video src="/resources/video/cityCar2.mp4" width="540" height="280" controls></video>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial End -->
    
    <!-- Services Start -->
    <section id="services" class="services-section section-space-padding">
        <div class="container">
           <div class="row">
                <div class="col-sm-12">
                    <div class="section-title">
                        <h2>My Services.</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit</p>
                    </div>
                </div>
            </div>
            
            <div class="row">
            
            <div class="col-md-4 col-sm-6">
				<div class="services-detail">
					<i class="fa fa-mobile color-1"></i>
					<h3>Mobile Design</h3>
					<hr>
					<p>Rolling is a clean and beautiful template with every must features. You can use it for many purpose in website.</p>
				</div>
			</div>

			<div class="col-md-4 col-sm-6">
				<div class="services-detail">
					<i class="fa fa-tablet color-2"></i>
					<h3>Tablet Design</h3>
					<hr>
					<p>Rolling is a clean and beautiful template with every must features. You can use it for many purpose in website.</p>
				</div>
			</div>

			<div class="col-md-4 col-sm-6">
				<div class="services-detail">
					<i class="fa fa-code color-3"></i>
					<h3>Clean Code</h3>
					<hr>
					<p>Rolling is a clean and beautiful template with every must features. You can use it for many purpose in website.</p>
				</div>
			</div>
            
            <div class="col-md-4 col-sm-6">
				<div class="services-detail">
					<i class="fa fa-support color-4"></i>
					<h3>Full Support</h3>
					<hr>
					<p>Rolling is a clean and beautiful template with every must features. You can use it for many purpose in website.</p>
				</div>
			</div>

			<div class="col-md-4 col-sm-6">
				<div class="services-detail">
					<i class="fa fa-html5 color-5"></i>
					<h3>HTML5 Design</h3>
					<hr>
					<p>Rolling is a clean and beautiful template with every must features. You can use it for many purpose in website.</p>
				</div>
			</div>

			<div class="col-md-4 col-sm-6">
				<div class="services-detail">
					<i class="fa fa-ge color-6"></i>
					<h3>CSS3 Design</h3>
					<hr>
					<p>Rolling is a clean and beautiful template with every must features. You can use it for many purpose in website.</p>
				</div>
			</div>
            
            </div>
        </div>
    </section>
    <!-- Services End -->
    
<%@include file="../include/contactAction.jsp" %>
<%@include file="../include/footer.jsp" %>
</body>
</html>