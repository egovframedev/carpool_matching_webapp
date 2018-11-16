<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp"%>
<style type="text/css">
	.popup {position: absolute;}
	.back {position:fixed; top:0; left:0; background-color: rgba(0,0,0,.25); width: 100%; height: 100%; overflow: hidden; z-index: 1101;}
	.front {top:50%; left:50%; transform: translate(-50%, -50%); z-index: 1110; border: 1px; margin: auto;}
	.show{position: relative; max-width: 1200px; max-height: 800px; overflow: auto;}
</style>
	<!-- Content Wrapper. Containes page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>${cri.title} <small>글 보기</small></h1>
			<ol class="breadcrumb">
				<li><a href="/"><i class="fa fa-home"></i> Home</a></li>
				<li><a href="<c:url value='/board/notice/list'/>">고객센터</a></li>
				<li class="active">${cri.title}</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="box box-success">			
				<div class="box-header with-border">
					<div class="user-block">
						<!-- 작성자 프로필 사진 연결 -->
		                <img class="img-circle" src="/resources/dist/img/user1-128x128.jpg" alt="User Image">
		                <span class="username"><a href="#">${boardVO.writer}</a></span>
		                <span class="description">Created At: <fmt:formatDate value="${boardVO.regdate}" pattern="yyyy년 M월 d일 HH시 mm분"/></span>
		            </div>	
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse" data-toggle="tooltip" title="Collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool" data-widget="remove"	data-toggle="tooltip" title="Remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<form role="form" action="modifyPage" method="post">
					<input type="hidden" name="bno" value="${boardVO.bno}" />
					<input type="hidden" name="page" value="${cri.page}"/>
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
					<input type="hidden" name="searchType" value="${cri.searchType}"/>
					<input type="hidden" name="keyword" value="${cri.keyword}"/>					
				</form>
				<div class="box-body">
	            	<h3 class="box-body-tit">${boardVO.title}</h3>	        
	            	<div class="box-body-cont" style="min-height:300px;">
	            		${boardVO.content}
	            	</div>	   
	            	<ul class="mailbox-attachments clearfix uploadedList"></ul>
	            </div><!-- /.box-body -->
				<div class="box-footer text-right">
				<c:if test="${login.uid == boardVO.writer}">				
	                <button type="button" class="btn btn-success" id="btnModify"><i class="fa fa-pencil"></i> 글 수정</button>&nbsp;&nbsp;
	                <button type="button" class="btn btn-danger" id="btnRemove"><i class="fa fa-trash"></i> 글 삭제</button>&nbsp;&nbsp;
	            </c:if>
	                <button type="button" class="btn btn-primary" id="btnList">목록 보기</button>	              
				</div><!-- /.box-footer-->
			</div><!-- /.box -->
			<!-- Comments -->
			
			<div class="row">
				<div class="col-md-12">
					<div class="box box-success">
						<div class="box-header with-border">						
							<h3 class="box-title">ADD NEW REPLY</h3>
						<c:if test="${not empty login}">						
							<div class="box-body">
								<label for="newReplyWriter">Writer</label>
								<input type="text" class="form-control" id="newReplyWriter" placeholder="USER ID" value="${login.uid}" readonly="readonly" />
								
								<label for="newReplyText" style="margin-top: 1em;">Reply Text</label>
								<textarea class="form-control" id="newReplyText" rows="4" placeholder="REPLY TEXT"></textarea>
							</div>
							<div class="box-footer text-right">
								<button type="button" class="btn btn-primary" id="btnReplyAdd"><i class="fa fa-pencil"></i> 댓글 등록</button>
							</div>
						</c:if>
						<c:if test="${empty login}">
							<div class="box-body">
								<div><a href="javascript:goLogin();">댓글을 작성하려면 로그인이 필요합니다.</a></div>
							</div>
						</c:if>
						</div>
					</div>
				</div>
			</div><!-- // Comments -->
			
			<!-- TimeLine -->
			<div class="row">
		    	<div class="col-md-12">
		        	<!-- The time line -->
		          	<ul class="timeline">
		          		<!-- timeline time-label -->
		            	<li class="time-label" id="repliesDiv">
		            		<span class="bg-green">Replies List <small id="replycntSmall">[ ${boardVO.replycnt} ]</small></span></li>
		            	<!-- /.timeline-label -->		             
		            	<li><i class="fa fa-clock-o bg-gray"></i></li>
		            </ul>
		            <div class="text-center">
		            	<ul id="pagination" class="pagination pagination-sm no-margin">		            		
		                  <li><a href="#">« 다음</a></li>
		                  <li class="active"><a href="#">1</a></li>
		                  <li><a href="#">2</a></li>
		                  <li><a href="#">3</a></li>
		                  <li><a href="#">이전 »</a></li>
		                </ul>		         
		            </div>
		        </div><!-- /.col-md-12 -->
		      </div><!-- //TimeLine -->
		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->
	<!-- Reply Modal Box -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno="">
					<p><input type="text" id="replytext" class="form-control" /></p>					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="btnReplyMod">수정</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-danger" id="btnReplyDel">삭제</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="popup back" style="display:none">
		<div id="popup_front" class="popup front" style="display:none">
			<img id="popup_img" />
		</div>
	</div>
	<!-- //Reply Modal Box -->	
<!-- Handlebar -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script type="text/javascript" src="/resources/dist/js/upload.js"></script>
<script id="tplAttach" type="text/x-handlebars-template">
	<li data-src="{{fullName}}">
		<span class="mailbox-attachment-icon has-img"><img src="{{imgSrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>			
		</div>
	</li>
</script>
<script id="template" type="text/x-handlebars-template">
{{#each .}}
	<li class="replyLi" data-rno={{rno}}>
		<i class="fa fa-comments bg-blue"></i>
		<div class="timeline-item">
			<span class="time"><i class="fa fa-clock-o"></i>{{prettifyDate createdate}}</span>
			<h3 class="timeline-header"><strong>{{rno}}</strong> - {{replyer}}</h3>
			<div class="timeline-body">{{replytext}}</div>
		    <div class="timeline-footer">
			{{#eqReplyer replyer}}
		    	<a class="btn btn-warning btn-flat btn-xs" data-toggle="modal" data-target="#modifyModal">댓글 수정</a>
			{{/eqReplyer}}
		    </div>
		</div>
	</li>
{{/each}}
</script>
<script>
	var rootPath = '<c:url value="/"/>';
	var boardPath = rootPath + 'board/${cri.btype}';
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	Handlebars.registerHelper("eqReplyer", function(replyer, block) {
		var accum = '';
		if (replyer == '${login.uid}') {
			accum += block.fn();
		}
		return accum;
	});
	
	var printData = function(replyArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}
	$(document).ready(function(){
		var bno=${boardVO.bno};
		var template = Handlebars.compile($("#tplAttach").html());
		var replyPage = 1;
		var formObj = $("form[role='form']");
		
		$.getJSON( rootPath +"board/getAttach/" + bno, function(list){
			$(list).each(function(){
				var fileInfo = getFileInfo(this);
				var html = template(fileInfo);
				$(".uploadedList").append(html);
			});
		});
		
		// console.log(formObj);
		// 게시물 목록으로 이동
		$("#btnList").on("click", function(){
			formObj.attr("action", boardPath + "/list");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		// 수정 페이지로 이동
		$("#btnModify").on("click", function(){
			formObj.attr("action", boardPath + "/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		// 삭제 페이지로 이동
		$("#btnRemove").on("click", function(){
			var replyCnt = $("#replycntSmall").html();
			if(replyCnt > 0) {
				alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
				return;
			}			
			var arr = [];
			var delConfirm = confirm('해당 게시글을 삭제합니까?');
			if(delConfirm) { 
				$(".uploadedList li").each(function(index){
					arr.push($(this).attr("data-src"));
				});
				if(arr.length > 0) {
					$.post("/deleteAllFiles", {files:arr}, function(){
						// 첨부 파일 삭제 처리.
					});
				}
				formObj.attr("action", boardPath + "/removePage");
				formObj.submit();
			}
		});
		
		function getPage(pageInfo) {
			$.getJSON(pageInfo, function(data){
				printData(data.list, $("#repliesDiv"), $("#template"));
				printPaging(data.pageMaker, $("#pagination"));
				
				$("#modifyModal").modal('hide');
				$("#replycntSmall").html("[ " + data.pageMaker.totalCount +" ]")
			});
		}
		
		var printPaging = function(pageMaker, target) {
			var str = "";
			if(pageMaker.prev) {
				str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
			}
			for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
				var strClass = pageMaker.cri.page == i ? " class='active'" : "";
				str += "<li"+ strClass +"><a href='"+ i +"'>" + i +"</a></li>";
			}
			if(pageMaker.next) {
				str += "<li><a href='" + (pageMaker.endPage +1 ) + "'> << </a></li>";
			}
			target.html(str);
		};
		
		$("#repliesDiv").on("click", function(){
			if($(".timeline li").size() > 1) {
				return;
			}
			getPage("/replies/" + bno + "/1");
		});
		
		$("#pagination").on("click", "li a", function(event){
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPage("/replies/" + bno + "/" + replyPage);
		});
		getPage("/replies/" + bno + "/1");
		
		// 댓글 등록
		$("#btnReplyAdd").on("click", function(){
			var replyerObj = $("#newReplyWriter");
			var replyer = replyerObj.val();
			var replytextObj =  $("#newReplyText");
			var replytext = replytextObj.val();			
			
			$.ajax({
				type: 'post',
				url: '/replies',
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType: 'text',
				data: JSON.stringify({
					bno: bno,
					replyer: replyer,
					replytext: replytext
				}),
				success: function(result) {
					if(result == "SUCCESS") {
						alert("댓글이 등록되었습니다.");
						replyPage = 1;
						getPage("/replies/" + bno + "/" + replyPage);
						replyerObj.val("");
						replytextObj.val("");
					}
				}
			});
		});
		
		// 댓글 수정 폼 모달 띄우기
		$(".timeline").on("click", ".replyLi", function(event){
			var reply = $(this);
			$("#replytext").val(reply.find(".timeline-body").text());
			$(".modal-title").html(reply.attr("data-rno"));
		});
		
		// 댓글 수정
		$("#btnReplyMod").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type: "put",
				url: "/replies/" + rno,
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override" : "PUT"},
				data: JSON.stringify({replytext:replytext}),
				dataType: 'text',
				success: function(result) {
					console.log("result: " + result);
					if(result == 'SUCCESS') {
						alert("댓글이 수정 되었습니다.");
						$("#modifyModal").modal('hide');
						getPage("/replies/"+bno+"/"+replyPage)
					}
				}
			});
		});
		
		// 댓글 삭제
		$("#btnReplyDel").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type: "delete",
				url: "/replies/" + rno,
				headers: {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override": "DELETE"
				},
				dataType: "text",
				success: function(result) {
					console.log("result: " + result);
					if(result == "SUCCESS") {
						alert("해당 댓글이 삭제 되었습니다.");
						$("#modifyModal").modal('hide');
						getPage("/replies/" + bno + "/" + replyPage);
						
					}
				}
			});
		});
		
		$(".uploadedList").on("click", ".mailbox-attachment-info a", function(e){
			var fileLink = $(this).attr("href");
			if(checkImageType(fileLink)) {
				e.preventDefault();
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
	});
</script>

<%@ include file="../includes/footer.jsp"%>