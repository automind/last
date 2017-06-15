<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<%@ include file="../include/navSource.jsp"%>
<style type="text/css">
</style>
<script id="template" type="text/x-handelbars-template">
	<li>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
				<i class="fa fa-fw fa-remove"></i>
			</a>
		</div>
	</li>
</script>
<script type="text/x-handlebars-template" id="templateAttach">
		<li data-src='{{fullName}}'>
			<span class="mailbox-attachment-icon has-img">
				<img src="{{imgsrc}}" alt="Attachment">
			</span>
			<div class="mailbox-attachment-info">
				<a href="{{getLink}}" class="mailbox-attachment-name">
					{{fileName}}
				</a>
				<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
					<i class="fa fa-fw fa-remove"></i>
				</a>
			</div>
		</li>
</script>
<style type="text/css">
.fileDrop{
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>
<%@include file="../include/navHeader.jsp"%>
	
	<section id="portfolio" class="portfolio section-space-padding">
		<div class="container">
			<form role="form" method="post" action="modifyPage" id="modifyForm">
	
				<input type="hidden" name="page" value="${cri.page }">
				<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
				<input type="hidden" name="searchType" value="${cri.searchType }">
				<input type="hidden" name="keyword" value="${cri.keyword }">
		
            <div class="row">
                <div class="col-sm-12">
                    <div class="section-title">
                        <h2>
                        	<fmt:formatDate value="${boardVo.regdt }" pattern="yyyy-MM-dd HH:mm"/>
                        </h2>
                    </div>
                </div>
            </div>	
		
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">글번호</label>
				<input type="text" name="bno" class="form-control" value="${boardVo.bno }" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">제목</label>
				<input type="text" name="title" class="form-control" value="${boardVo.title }">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">내용</label>
				<textarea rows="3" class="form-control" name="content">${boardVo.content }</textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">작성자</label>
				<input type="text" name="writer" class="form-control" value="${boardVo.writer }">
			</div>
			<div class="form-group">
			<label for="exampleInputEmail1">파일을 이 곳에  위치 하세요.</label>
			<div class="fileDrop"></div>
		</div>
		</div>
	</form>
		
	<div class="box-footer">
	<!-- 이미지 썸네일 영역 -->
		<div>
			<hr>
		</div>
		<div id="popup_back" class='popup back' style="display:none;"></div>
		<div id="popup_front" class='popup front' style="display:none;">
			<img id="popup_img">
		</div>
		<ul class="mailbox-attachments clearfix uploadedList"></ul>
	<!-- 버튼 영역 -->	
		<button type="submit" class="btn btn-primary">저장</button>
		<!-- <button type="submit" class="btn btn-warning">취소</button> -->
	</div>
  	</div>
</section>
	<script>
		$(document).ready(function(){
			
				var formObj = $("form[role='form']");
			
				console.log(formObj);
			
				/* $(".btn-warning").on("click",function(){
					self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
				  + "&searchType=${cri.searchType}&keyword=${cri.keyword}";
				}); */
				
				$(".btn-primary").on("click",function(){
					formObj.submit();
				});
			});
	</script>
	<script>
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file", file);
		
		$.ajax({
			url:'/uploadAjax',
			data:formData,
			dataType:'text',
			processData:false,
			contentType:false,
			type : 'POST',
			success: function(data){
				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);
				$(".uploadedList").append(html);
			}
		});
	});
</script>
<script>
	$("#modifyForm").submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str = "";
	$(".uploadedList .delbtn").each(function(index){
		str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'>";		
	});
	
	that.append(str);
	
	that.get(0).submit();
});
	
	$(".uploadedList").on("click", ".delbtn", function(event){
		
		event.preventDefault();
		
		var that = $(this);
		
		$.ajax({
			url:"deleteFile",
			data:{fileName:$(this).attr("href")},
			type:"post",
			dataType:"text",
			success:function(result){
				if(result == 'deleted'){
					alert("삭제 완료!!");
					that.parent().parent().remove();
					$("#popup_front").remove();
					$("#popup_back").remove();
				}
			}
		});
	});
	
	var bno = ${boardVo.bno}; 
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/sboard/getAttach/" + bno, function(list){
		$(list).each(function(){
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			$(".uploadedList").append(html);
		});
	});
	
	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			event.preventDefault();
			
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
			
			$(".popup").show('slow');
			imgTag.addClass("show");
		}
	});
	
	$("#popup_img").on("click", function(){
		$(".popup").hide('slow');
	});
</script>
	
<%@include file="../include/footer.jsp"%>