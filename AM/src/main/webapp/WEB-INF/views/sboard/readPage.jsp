<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/navSource.jsp"%>
<%@include file="../include/navHeader.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.6/handlebars.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<li class="replyLi" data-rno={{rno}}>
			<i class="fa fa-comments bg-blue"></i>
			<div class="timeline-item">
				<span class="time">
					<i class="fa fa-clock-o"></i>{{prettifyDate regdt}}
				</span>
				<h3 class="timeline-header">
					<strong>{{rno}}</strong> -{{replyer}}
				</h3>
				<div class="timeline-body">{{replytext}}</div>
				<div class="timeline-footer">
					{{#eqReplyer replyer }}
						<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">
							수정
						</a>
					{{/eqReplyer}}
				</div>
			</div>
		</li>
		{{/each}}
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
			</div>
		</li>
</script>
	<form role="form" action="modifyPage" method="post">
		<input type="hidden" name="bno" value="${boardVo.bno }">
		<input type="hidden" name="page" value="${cri.page }">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
	</form>
<section id="portfolio" class="portfolio section-space-padding">
	<div class="container">
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
			<label for="exampleInputEmail1">제목</label> 
			<input type="text" name="title" class="form-control" value="${boardVo.title }" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">내용</label>
			<textarea rows="3" class="form-control" name="content" readonly="readonly">${boardVo.content }</textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">작성자</label>
			<input type="text" name="writer" class="form-control" value="${boardVo.writer }" readonly="readonly">
		</div>
	</div>
	<div class="box-footer">
	<!-- 팝업 창 영역 -->
		<div class='popup back' style="display:none;"></div>
		<div id="popup_front" class='popup front' style="display:none;">
			<img id="popup_img">
		</div>
	<!-- 첨부 파일 영역 -->
		<ul class="mailbox-attachments clearfix uploadedList"></ul>
	<!-- 버튼 영역 -->	
		<c:if test="${login.uid == boardVo.writer}">
			<button type="submit" class="btn btn-warning" id="boardModBtn">수정</button>
			<button type="submit" class="btn btn-danger" id="boardDelBtn">삭제</button>
		</c:if>
		<button type="submit" class="btn btn-primary" id="boardCloBtn" >목록</button>
	</div>
	<!-- 댓글 영역 -->
	<div class="row">
		<div class="col-md-12">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">댓글 추가하기</h3>
				</div>
				<c:if test="${not empty login}">
					<div class="box-body">
						<label for="newReplyWriter">작성자</label>
						<input class="form-control" type="text" 
													placeholder="아이디" 
													id="newReplyWriter" 
													value="${login.uid}" 
													readonly="readonly">
						<label for="newReplyText" id="reply">댓글</label>
						<input class="form-control" type="text" placeholder="내용 입력" id="newReplyText">
					</div>
					<div class="box-footer">
						<button type="submit" class="btn btn-primary" id="replyAddBtn">등록</button>
					</div>
				</c:if>
				<c:if test="${empty login}">
					<div class="box-body">
						<div>
							<a href="javascript:goLogin();">로그인이 필요합니다.</a>
						</div>
					</div>
				</c:if>
			</div>
	<!-- 댓글 리스트 -->
	<ul class="timeline">
		<!-- 댓글 리스트 버튼 -->
		<li class="time-label" id="repliesDiv">
			<span class="bg-green">
				댓글 리스트 <small id='replycntSmall'> [ ${boardVo.replycnt } ] </small>
			</span>
		</li>
	</ul>
	</div>
</div>
	<!-- 페이지영역 -->
	<div class="text-center">
		<ul id="pagination" class="pagination pagination-sm no-margin">
		
		</ul>
		
	</div>
	<!-- 모달 창 영역 -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn" data-dismiss="modal">수정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn" data-dismiss="modal">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
	<script>
			var result = '${msg}';
	
			if(result == 'SUCCESS'){
				alert("처리가 완료되었습니다.");
			}
			var formObj = $("form[role='form']");
			
			console.log(formObj);
			
			$("#boardModBtn").on("click",function(){
				formObj.attr("action","/sboard/modifyPage");
				formObj.attr("method","get");
				formObj.submit();
			});
			
			$("#boardDelBtn").on("click",function(){
				formObj.attr("action","/sboard/removePage");
				formObj.submit();
			});
			$("#boardCloBtn").on("click",function(){
				formObj.attr("method","get");
				formObj.attr("action","/sboard/list");
				formObj.submit();
			});
	</script>
	<script>
	
	function getPage(pageInfo){
		
		$.getJSON(pageInfo, function(data){
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount + " ]");
		});
	}
	
		Handlebars.registerHelper("prettifyDate",function(timeValue){
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			
			return year + "/" + month + "/" + date;
		});
		
		var printData = function(replyArr, target, templateObject){
			var template = Handlebars.compile(templateObject.html());
			
			var html = template(replyArr);
				$(".replyLi").remove();
			target.after(html);
		}
		
		var bno = ${boardVo.bno};
		var replyPage = 1;
		
		var printPaging = function(pageMaker, target){
			var str="";
			
			if(pageMaker.prev){
				str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
			}
			
			for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
				var strClass = pageMaker.cri.page == i?'class="active"':'';
				str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
			}
			
			if(pageMaker.next){
				str += "<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
			}
			target.html(str);
		};
		
		$("#repliesDiv").on("click",function(){
			if($(".timeline li").length > 1){
				$(this).siblings().slideToggle();
				$("#pagination").slideToggle();
				return;
			}
			getPage("/replies/" + bno + "/1");
		});
		
		$(".pagination").on("click","li a", function(event){
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPage("/replies/"+bno+"/"+replyPage);
		});
		
		$("#replyAddBtn").on("click",function(){
			var replyerObj = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var replyer = replyerObj.val();
			var replytext = replytextObj.val();
			
			$.ajax({
				type:'post',
				url:'/replies/',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override": "POST"},
				dataType:'text',
				data: JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result:" +result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage = 1;
						getPage("/replies/"+bno+"/"+replyPage);
						replyerObj.val("");
						replytextObj.val("");
						}
					}
			});
		});
		
		$(".timeline").on("click",".replyLi",function(event){
			var reply = $(this);
			
			$("#replytext").val(reply.find('.timeline-body').text());
			$(".modal-title").html(reply.attr("data-rno"));
		});
		
		$("#replyModBtn").on("click",function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type:'put',
				url:'/replies/'+rno,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"PUT"},
				data:JSON.stringify({replytext:replytext}),
				dataType:'text',
				success:function(result){
					console.log("result:" + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage);
					}
				}
			});
		});
		
		$("#replyDelBtn").on("click",function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"DELETE"},
				dataType:'text',
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage);
					}
				}
			});

		});
		
		var template = Handlebars.compile($("#templateAttach").html());
		
		$.getJSON("/sboard/getAttach/" + bno, function(list){
			$(list).each(function(){
				var fileInfo = getFileInfo(this);
				
				var html = template(fileInfo);
				
				$(".uploadedList").append(html);
			});
		});
		/* 이미지 팝업 기능 스크립트 */
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
		
		
		$("#boardDelBtn").on("click",function(){
			var replyCnt = $("#replycntSmall").html().replace(/[^0-9]/g,"");
			
			if(replyCnt > 0){
				alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
				return;
			}
			
			var arr = [];
			$(".uploadedList li").each(function(index){
				arr.push($(this).attr("data-src"));
			});
			/* 게시글 삭제 Ajax */
			if(arr.length > 0){
				$.post("/deleteAllFiles",{files:arr},function(){
					
				});
			}
			
			formObj.attr("action", "/sboard/removePage");
			formObj.submit();
		});
		
		function goLogin(){
			self.location = "/user/login";			
		}
		/* Handlebars function 추가 */
		Handlebars.registerHelper("eqReplyer", function(replyer, block){
			var accum = '';
			
			if(replyer == '${login.uid}'){
				accum += block.fn();
			}
			return accum;
		});
	</script>
<%@include file="../include/footer.jsp"%>