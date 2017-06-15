<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/navSource.jsp"%>
<%@include file="../include/navHeader.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<!-- Main content -->
<section id="portfolio" class="portfolio section-space-padding">
		<div class="container">
		<div class="row">
                <div class="col-sm-12">
                    <div class="section-title">
                        <h2>
                        	글 등록하기
                        </h2>
                    </div>
                </div>
            </div>
				<!-- /.box-header -->
<form role="form" method="post" id="registerForm">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> 
			<input type="text" name='title' class="form-control" placeholder="제목 입력">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">내용</label>
			<textarea class="form-control" name="content" rows="3" placeholder="내용 입력"></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">작성자</label> 
			<input type="text" name="writer" class="form-control" placeholder="작성자 입력" value="${login.uid}" readonly="readonly">
		</div>
	<!-- 파일 Drop 영역 -->
		<div class="form-group">
			<label for="exampleInputEmail1" style="margin-top:50px;">파일을 이 곳에 위치 하세요.</label>
			<div class="fileDrop"></div>
		</div>
	</div>
	<!-- /.box-body -->
	<div class="box-footer">
	<!-- 팝업 창 영역 -->
		<div class='popup back' style="display:none;"></div>
		<div id="popup_front" class='popup front' style="display:none;">
			<img id="popup_img">
		</div>
	<!-- 첨부 파일 영역 -->
		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>
		
		<div>
			<hr>
		</div>
		<button type="submit" class="btn btn-primary">등록</button>
		<button type="submit" class="btn btn-warning">취소</button>
	</div>
</form>
</div>
			<!-- /.box -->
		<!--/.col (left) -->

	<!-- /.row -->
</section>
<!-- /.content -->
<!-- /.content-wrapper -->
<script>
	var formObj = $("form[role='form']");
	
	$(".btn-warning").on("click",function(){
		formObj.attr("method","get");
		formObj.attr("action","/sboard/list");
		formObj.submit();
	});
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
<script id="template" type="text/x-handelbars-template">
	<li>
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
	$("#registerForm").submit(function(event){
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