<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp"%>
<style type="text/css">
	.board-block {border-top: 1px solid #f4f4f4; padding-top: 10px; margin-top: 10px; font-size: 16px; color:#666;}
	.board-block .info {list-style: none; padding-left: 10px; overflow: hidden; }
	.info li, .hit-head, .hit-num { display: inline-block; padding-left: 10px;};
	.info li.info-head, .hit-head {color: #ddd;}
	.info li.info-desc {width: 200px;}
	.hit-num {width: 100px;}
	.board-attach { padding: 1em; border-top: 1px solid #e1e1e; border-bottom: 1px solid #e1e1e1; background-color: #eee;}
	.board-attach ul {list-style: none; margin-bottom: 0; padding: 0; }
	.board-attach ul li {display: inline-block; padding-right: 1.2em;}
	.board-attach a {color: #333;}
	.board-attach .fa { color: #888; font-size: 1.2em; padding-right: 8px;}
	.uploadResult { width: 100%; background-color: #eee;}
	.uploadResult ul {display:flex; flex-flow: row; justify-content:center; align-items: center;}
	.uploadResult ul li { position: relative; list-style: none; padding: 10px; align-content: center; text-align: center; }
	.uploadResult ul li img {height: 80px;}
	.uploadResult ul li span {color: white;}
	.uploadResult .del {display: block; position: absolute; top: 0; right: 0; font-size: 20px; font-weight: bold;
		line-height: 24px;width: 24px; background-color: #e1e1e1;border-radius: 50%;color: red; cursor:pointer;}
	.bigPictureWrapper {position: absolute; display: none; justify-content: center; align-items: center;top: 0%;
		width: 100%;height: 100%; background-color: gray; z-index: 100;	background: rgba(255,255,255,0.5);}
	.bigPicture { position: relative; display: flex;; justify-content: center; align-item: center;}
	.bigPicture img { width: 600px;}
</style>
	<!-- 콘텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 콘텐츠 헤더 부문(Page header) -->
		<section class="content-header">
			<h1>${cri.btitle} <small>글 읽기</small></h1>
			<ol class="breadcrumb">
				<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
				<li><a href="<c:url value='/board/list'/>${cri.btype}">고객센터</a></li>
				<li class="active">${cri.btitle}</li>
			</ol>
		</section><!-- //.content-header -->	
		<!-- 메인 콘텐츠 부분 -->
		<section class="content">
			<div class="box box-success">			
				<div class="box-header with-border">
					<h3 class="box-title"><c:out value="${board.title}"/></h3>
					<div class="board-block">
						<ul class="info pull-left">
							<li class="info-head"><i class="fa fa-user"></i></li>
							<li class="info-desc"><c:out value="${board.writer}"/></li>
							<li class="info-head"><i class="fa fa-clock-o"></i></li>
							<li class="info-desc"><fmt:formatDate value="${board.regdate}" pattern="yyyy년 M월 d일 HH시 mm분"/></li>
						</ul>
						<div class="viewcnt pull-right">
							<span class="hit-head text-danger"><i class="fa fa-eye"></i></span>
							<span class="hit-num"><c:out value="${board.viewcnt}"/></span>
						</div>
					</div>
				</div>				
				<form role="form" action="modify" method="post">
					<input type="hidden" id="csrfToken" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name="bno" value="${board.bno}" />
					<%-- <input type="hidden" name="btype" value="${board.btype}"/> --%>
					<input type="hidden" name="page" value="${cri.page}"/>
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
					<input type="hidden" name="searchType" value="${cri.searchType}"/>
					<input type="hidden" name="keyword" value="${cri.keyword}"/>					
				</form>
				<div class="box-body">	  
	            	<div class="box-body-cont" style="min-height:300px;">
	            		${board.content}
	            	</div>	   
	            	<!-- <div class="board-attach">
	            		<ul class="files">
	            			<li><a href="#"><i class="fa fa-file-image-o"></i>
	            				sample_001.jpg</a></li>
	            			<li><a href="#"><i class="fa fa-file-text-o"></i>
	            				document_002.txt</a></li>
	            		</ul>
	            	</div> -->
	            </div><!-- /.box-body -->
				<div class="box-footer text-right">
				<%-- <c:if test="${login.uid == board.writer}">	 --%>			
	                <button type="button" class="btn btn-success" id="btnModify">
	                	<i class="fa fa-pencil"></i>&nbsp; 글 수정</button>&nbsp;&nbsp;
	                <button type="button" class="btn btn-danger" id="btnRemove">
	                	<i class="fa fa-trash"></i>&nbsp; 글 삭제</button>&nbsp;&nbsp;
	            <%-- </c:if> --%>
					<button type="button" class="btn btn-primary" id="btnAnswer">
						<i class="fa fa-pencil"></i>&nbsp; 답글 달기</button>&nbsp;&nbsp;
	                <button type="button" class="btn btn-primary" id="btnList">
	                	<i class="fa fa-th-list"></i>&nbsp; 목록 보기</button>	              
				</div><!-- /.box-footer-->
			</div><!-- /.box -->
			<div class="box box-solid">
	         	<div class="box-header with-border">
	         		<h3 class="box-title">첨부 파일</h3>
	         	</div>
	         	<div class="box-body clearfix" style="min-height:120px;">
	         		<div class="uploadResult">
	         			<ul></ul>
	         		</div>
	         	</div>
	         </div>			
		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->
	
	<div class="bigPictureWrapper">
		<div class="bigPicture">
		</div>
	</div>	
<script>
	$(document).ready(function(){
		var boardPath = '<c:url value="/board/${cri.btype}/"/>'; 
		var bno = ${board.bno};
		var formObj = $("form[role='form']");
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		//Ajax spring security header
		/* $(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		}) */
		
		(function(){
			$.getJSON( boardPath + "getAttachList", {bno: bno} , function(arr){
				// console.log(arr);
				var str = "";
				$(arr).each(function(i, attach){
					// image type
					if(attach.fileType) {
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
						str += '<li data-path="'+attach.uploadPath + '" data-uuid="' + attach.uuid 
							+ '" data-filename="'+ attach.fileName +'" data-type="'+ attach.fileType +'"><div>';						
						str += '<img src="<c:url value="/"/>display?fileName=' + fileCallPath + '" class="img-thumbnail" />';
						str += "</div></li>";
					} else  {
						str += '<li data-path="'+attach.uploadPath + '" data-uuid="' + attach.uuid 
							+ '" data-filename="'+ attach.fileName +'" data-type="'+ attach.fileType +'"><div>';
						str += '<span>'+ attach.fileName +'</span>';					
						str += '<img src="<c:url value="/"/>img/attach.png" class="img-thumbnail"></a>';
						str += '</div></li>';
					}
				});
				$(".uploadResult ul").html(str);
			}); // end getJson
		})(); // end function
		
		$(".uploadResult").on("click", "li", function(e){
			// console.log("view image");
			var liObj = $(this);
			var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
			if(liObj.data("type")) {
				showImage(path.replace(new RegExp(/\\/g), "/"));
			} else  {
				// download
				self.location = "<c:url value='/'/>download?fileName=" + path;
			}
		});
		
		function showImage(fileCallPath) {
			alert(fileCallPath);
			$(".bigPictureWrapper").css("display", "flex").show();
			$(".bigPicture")
				.html("<img src='<c:url value='/'/>display?fileName=" + fileCallPath + "'/>")
				.animate({width:'100%', height: '100%'}, 1000);
		}
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			}, 1000)
		});
		
		// 게시물 목록으로 이동
		$("#btnList").on("click", function(){
			$("#csrfToken").remove();
			formObj.attr("action", boardPath + "list");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		// 답글 달기
		$("#btnAnswer").on("click", function(){
			$("#csrfToken").remove();
			formObj.attr("action", boardPath + "answer");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		// 수정 페이지로 이동
		$("#btnModify").on("click", function(){
			$("#csrfToken").remove();
			formObj.attr("action", boardPath + "modify");
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
					$.post(boardPath +"/deleteAllFiles", {files:arr}, function(){
						// 첨부 파일 삭제 처리.
					});
				}
				formObj.attr("action", boardPath +"remove");
				formObj.submit();
			}
		});
	
	});
</script>

<%@ include file="../includes/footer.jsp"%>