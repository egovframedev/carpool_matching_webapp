<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
	<!-- 콘텐츠 시작  -->
	<div class="content-wrapper">
		<!-- 콘텐츠 헤더 부문(Page header) -->
		<section class="content-header">
			<h1>EXTENSION BOARD <small>New Answer</small></h1>
			<ol class="breadcrumb">
				<li><a href="/"><i class="fa fa-home"></i> Home</a></li>
				<li><a href="/xboard/list">확장 게시판</a></li>
				<li class="active">답글 쓰기</li>
			</ol>
		</section> <!-- //.content-header -->	
		<!-- 메인 콘텐츠 부분 -->
		<section class="content">
			<div class="box box-primary">
            	<div class="box-header with-border">
              		<h3 class="box-title">답글 쓰기</h3>
            	</div><!-- /.box-header -->
            <!-- form start -->
            <form  id="answerForm" role="form" method="post">
            	<input type="hidden" name="page" value="${cri.page}" />
            	<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
            	<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
				<input type="hidden" name="searchType" value="${cri.searchType}"/>
				<input type="hidden" name="keyword" value="${cri.keyword}"/>	
            	<input type="hidden" name="bGroup" value="${parent.bGroup}" />
            	<input type="hidden" name="bStep" value="${parent.bStep + 1}" />
            	<input type="hidden" name="bIndent" value="${parent.bIndent + 1}" />
            	<div class="box-body">
                	<div class="form-group">
                  		<label for="inputTitle">글 제목</label>
                  		<input type="text" class="form-control" name="title" id="inputTitle" placeholder="제목 입력" required="required" value="[답변] ">
                	</div>
                	<div class="form-group">
	                	<label for="inputContent">글 내용</label>
	                	<textarea class="form-control" name="content"  id="inputContent" rows="8" placeholder="내용 입력" required="required"></textarea>
	                </div>
                	<div class="form-group">
                  		<label for="inputWriter">작성자</label>
                  		<input type="text" class="form-control" name="writer" id="inputWriter" value='<c:out value="${login.uid}" default="guest" />' readonly="readonly"/>
                	</div>
                	<div class="form-group">
                		<label>첨부 파일</label>
                		<div class="info-box" style="background-color: #e1e1e1;">
				            <span class="info-box-icon bg-aqua"><i class="fa fa-fw fa-paperclip"></i></span>
				            <div class="info-box-content fileDrop text-center">
				             	<span style="font-size:28px; color:#fff; line-height:80px;">첨부 파일을 끌어넣기 하세요.</span>
				            </div>
				            <!-- /.info-box-content -->
				          </div>
                	</div>
                </div><!-- /.box-body -->
				<div class="box-footer">
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					<hr />
                	<button type="submit" class="btn btn-primary">완 료</button>
              	</div>
            </form>
          </div><!-- /.box -->
		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.min.js"></script>
<script type="text/javascript" src="/resources/dist/js/upload.js"></script>
<script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgSrc}}" alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
				<i class="fa fa-fw fa-remove"></i></a>			
		</div>
	</li>
</script>
<script>
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
		var files = e.originalEvent.dataTransfer.files;
		var file = files[0];
		var formData = new FormData();
		formData.append("file", file);
		
		$.ajax({
			url: '/uploadAjax',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data) {
				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);
				$(".uploadedList").append(html);
			}
		});
	});
	
	$("#answerForm").submit(function(e){
		e.preventDefault();
		var that = $(this);
		var str = "";
		$(".uploadedList .delbtn").each(function(index){
			str += "<input type='hidden' name='files["+ index +"]' value='"+ $(this).attr("href") +"' />";
		});
		console.log(str);
		that.append(str);
		
		that.get(0).submit();
	});
</script>
<%@ include file="../includes/footer.jsp"%>