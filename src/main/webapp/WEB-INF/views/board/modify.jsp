<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="../includes/header.jsp"%>
	<!-- Content Wrapper. Containes page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>SEARCH BOARD <small>Modify Article</small></h1>
			<ol class="breadcrumb">
				<li><a href="/"><i class="fa fa-home"></i> Home</a></li>
				<li><a href="/sboard/list">검색용 게시판</a></li>
				<li class="active">글 수정</li>
			</ol>
		</section>
	
		<!-- Main Content -->
		<section class="content">
			<div class="box box-primary">
            	<div class="box-header with-border">
              		<h3 class="box-title">게시글 수정</h3>
            	</div><!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="modifyPage" method="post">
            	<input type="hidden" name="page" value="${cri.page}" />
            	<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
            	<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
				<input type="hidden" name="searchType" value="${cri.searchType}"/>
				<input type="hidden" name="keyword" value="${cri.keyword}"/>	
            	<div class="box-body">
            		<div class="form-group">
                  		<label for="inputBno">글 번호</label>
                  		<input type="text" class="form-control" name="bno" id="inputBno" 
                  			value="${boardVO.bno}" readonly="readonly"/>
                	</div>
                	<div class="form-group">
                  		<label for="inputTitle">글 제목</label>
                  		<input type="text" class="form-control" name="title" id="inputTitle" placeholder="제목 입력" 
                  			value="${boardVO.title}" />
                	</div>
                	<div class="form-group">
	                	<label for="inputContent">글 내용</label>
	                	<textarea class="form-control" name="content"  id="inputContent" rows="8" placeholder="내용 입력">${boardVO.content}</textarea>
	                </div>
                	<div class="form-group">
                  		<label for="inputWriter">작성자</label>
                  		<input type="text" class="form-control" name="writer" id="inputWriter" placeholder="작성자 이름 입력" 
                  			value="${boardVO.writer}" readonly="readonly"/>
                	</div>
                </div><!-- /.box-body -->
				<div class="box-footer">
                	<button type="submit" class="btn btn-primary" id="btnSubmit">완 료</button>
                	<button type="button" class="btn btn-warning" id="btnCancel">취 소</button>
              	</div>
            </form>
          </div><!-- /.box -->
		</section><!-- /.content -->
	</div><!-- /.content-wrapper -->
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		// 수정을 취소하고 게시글 목록으로 이동
		$("#btnCancel").on("click", function(){
			self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
		});
		
		// 게시글 수정 처리 하기
		$("#btnSubmit").on("click", function(){
			formObj.submit();
		});
	});
</script>
<%@ include file="../includes/footer.jsp"%>