<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
	.uploadbox label {display: block;}
	.uploadbox .img-box { max-height: 400px; background-color: #e1e1e1; overflow: hidden; margin-top: 10px; margin-bottom: 10px;}
	.uploadbox .img-box img { width: 100%; height: 100%; }
	

</style>
<!-- 컨텐츠 시작  -->
<div class="content-wrapper">
	<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<!-- 컨텐츠 헤더 부분(Page header) -->
			<section class="content-header">
				<h1><i class="fa fa-slideshare" aria-hidden="true"></i>
					운전자인증<small>서류등록폼</small></h1>
				<ol class="breadcrumb">
					<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
					<li><a href="<c:url value='/member/driver/certify'/>"><i class="fa fa-dashboard"></i> 운전자인증</a></li>
					<li class="active">서류등록폼</li>
				</ol>
			</section>
		</section>
	<!-- 메인 컨텐츠 부분 -->
	<section class="content">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">운전자 기본 정보 입력</h3>
			</div>
			<form action="cetiryOk" method="post" class="form-horizontal">
				<input type="hidden" name="mno" value="${driver.mno}" />
				<input type="hidden" name="license_no" value="${driver.license_no}" />
				<input type="hidden" name="car_no" value="${driver.car_no}" />
				<input type="hidden" name="car_prod" value="${driver.car_prod}" />
				<input type="hidden" name="car_model" value="${driver.car_model}" />
				<input type="hidden" name="car_color" value="${driver.car_color}" />
				<input type="hidden" name="car_year" value="${driver.car_year}" />
				<input type="hidden" name="car_insurance" value="${driver.insurance}" />
			<div class="box-body uploadbox">
				<div class="row">
					<div class="col-md-6">
						<label>운전면허증</label>
						<input type="file" class="uploadFile" data-item="license" />
						<div id="licenseRes" class="img-box">
							<img src="<c:url value='/img/'/>no_image.png" alt="no image" />
						</div>
						<input type="hidden" name="license_photo" id="licensePhoto" />
					</div>
					<div class="col-md-6">
						<label>자동차 사진</label>
						<input type="file" class="uploadFile" data-item="car"  />
						<div id="carRes" class="img-box">
							<img src="<c:url value='/img/'/>no_image.png" alt="no image" />
						</div>
						<input type="hidden" name="car_photo" id="carPhoto" />
					</div>
					
				</div>
				<div class="row">
					<div class="col-md-6">
						<label >보험증서</label>
						<input type="file" class="uploadFile" data-item="insurance" />
						<div id="insuranceRes" class="img-box">
							<img src="<c:url value='/img/'/>no_image.png" alt="no image" />
						</div>
						<input type="hidden" name="insurance_photo" id="insurancePhoto" />
					</div>
					<div class="col-md-6">
						<label >자동차등록증</label>
						<input type="file" class="uploadFile" data-item="carReg" />
						<div id="carRegRes" class="img-box">
							<img src="<c:url value='/img/'/>no_image.png" alt="no image" />
						</div>
						<input type="hidden" name="carreg_photo" id="carregPhoto" />
					</div>
				</div>
			</div>
			
			<div class="box-footer">
				<button type="reset" class="btn btn-default pull-left" id="btnCancel">취소</button>
				<button type="submit" class="btn btn-primary pull-right" id="btnSubmit">입력완료</button>
			</div>
			</form>
		</div>
		
	</section>
	</div>
</div>
<script>
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); 
	var maxSize = 5242880; // 5MB 제한
	var ctxPath = '<c:url value="/member" />';
	
	// 파일 체크
	function checkExtension(fileName, fileSize) {
		
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("input[type='file']").change(function(e) {
		var formData = new FormData();
		var inputFiles = $(this);
		var files = inputFiles[0].files;
		 
		
		var item = $(this).data("item");
		var $input = $("#" + item + "Photo");
		var $display = $("#" + item + "Res");
		
		// console.log(files);
		
		for(var i = 0; i < files.length; i++) {
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		formData.append("item", item);
		formData.append("userid", 'rider01');
		
		$.ajax({
			url: ctxPath +  "/uploadAction",
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'text',
			success: function(result) {
				$input.val(result);
				$display.html('<img src="' + ctxPath + '/display?filename='+ result +'" alt="'+ item +' image"/>');
			}
		});
	}); // input[type='file']
</script>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>