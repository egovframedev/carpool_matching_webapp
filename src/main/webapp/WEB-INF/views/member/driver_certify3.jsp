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
					운전자인증<small>서류결과</small></h1>
				<ol class="breadcrumb">
					<li><a href="<c:url value='/'/>"><i class="fa fa-home"></i> HOME</a></li>
					<li><a href="<c:url value='/member/driver/certify'/>"><i class="fa fa-dashboard"></i> 운전자인증</a></li>
					<li class="active">인증 서류 결과</li>
				</ol>
			</section>
		</section>
	<!-- 메인 컨텐츠 부분 -->
	<section class="content">
		<div class="box box-danger">
			<div class="box-header with-border">
				<h3 class="box-title">운전자 기본 정보 입력</h3>
			</div>
			<form  role="form" action="/carpool" method="post" class="form-horizontal">
				<input type="hidden" name="mno" value="${driver.mno}" />
			<div class="box-body uploadbox">
				<div class="row">
					<div class="col-md-6">
						<label>운전면허증</label>
						<div id="licenseRes" class="img-box">
							<img src="<c:url value='/img/'/>no_image.png" alt="no image" />
							<c:if test="${driver.license_chk eq 0}">
							검토 실패
							</c:if>
							<c:if test="${driver.license_chk eq 1}">
							서류 검토중
							</c:if>
							<c:if test="${driver.license_chk eq 2}">
							서류 통과
							</c:if>
						</div>
					</div>
					<div class="col-md-6">
						<label>자동차 사진</label>
						<div id="carRes" class="img-box">
							<img src="<c:url value='/img/'/>no_image.png" alt="no image" />
							<c:if test="${driver.car_photo_chk eq 0}">
							검토 실패
							</c:if>
							<c:if test="${driver.car_photo_chk eq 1}">
							서류 검토중
							</c:if>
							<c:if test="${driver.car_photo_chk eq 2}">
							서류 통과
							</c:if>
						</div>
					</div>
					
				</div>
			 	<div class="row">
					<div class="col-md-6">
						<label >보험증서</label>
						<div id="insuranceRes" class="img-box">
							<img src="<c:url value='/img/'/>no_image.png" alt="no image" />
							<c:if test="${driver.insurance_chk eq 0}">
							검토 실패
							</c:if>
							<c:if test="${driver.insurance_chk eq 1}">
							서류 검토중
							</c:if>
							<c:if test="${driver.insurance_chk eq 2}">
							서류 통과
							</c:if>
						</div>
					</div>
					<div class="col-md-6">
						<label >자동차등록증</label>
						<div id="carRegRes" class="img-box">
							<img src="<c:url value='/img/'/>no_image.png" alt="no image" />
							<c:if test="${driver.carReg_photo_chk eq 0}">
							검토 실패
							</c:if>
							<c:if test="${driver.carReg_photo_chk eq 1}">
							서류 검토중
							</c:if>
							<c:if test="${driver.carReg_photo_chk eq 2}">
							서류 통과
							</c:if>
						</div>
					</div>
	
				</div>
				 <%-- <c:if test="${driver.post_state ==0}"> 
				불합격 사유 : <input type="text" class="form-control">
				 </c:if>  --%>
			</div>
			
			<div class="box-footer">
				<button type="reset" class="btn btn-default pull-left" id="btnCancel">취소</button>
				<button type="submit" class="btn btn-primary pull-right" id="btnSubmit">입력완료</button></a>
				<a onclick="modifyGO()"><button type="button" class="btn btn-danger pull-right" id="btnSubmit">수정하기</button></a>
				
			</div>
			</form>
		</div>
		
	</section>
	</div>
</div>
<script>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
		//수정페이지
		function modifyGO(){
			var formObj = $("form[role='form']");
			
			formObj.attr("action", "certify");
			formObj.attr("method", "get");
			formObj.submit();
		}
</script>
<script type="text/javascript">
	$(document).ready(function(){
		var bno = ${boardDTO.bno};
		var formObj = $("form[role='form']");
		var rootPath = '<c:url value="/"/>';
	
		(function(){
			$.getJSON( rootPath + "/getAttachList", {bno: bno} , function(arr){
				//console.log(arr);
				//alert(arr);
				var str = "";
				$(arr).each(function(i, attach){
					// image type
					if(attach.fileType) {
						var fileCallPath = encodeURIComponent(attach.uploadpath + "/s_" + attach.uuid + "_" + attach.filename);
						str += '<li data-path="'+attach.uploadpath + '" data-uuid="' + attach.uuid 
							+ '" data-filename="'+ attach.filename +'" data-type="'+ attach.fileType +'"><div>';						
						str += '<img src="<c:url value="/"/>member/display?filename=' + fileCallPath + '" class="img-thumbnail" />';
						str += "</div></li>";
					} else  {
						str += '<li data-path="'+attach.uploadpath + '" data-uuid="' + attach.uuid 
							+ '" data-filename="'+ attach.filename +'" data-type="'+ attach.fileType +'"><div>';
						str += '<span>'+ attach.filename +'</span>';					
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
				self.location = "<c:url value='/'/>download?filename=" + path;
			}
		});
		
		function showImage(fileCallPath) {
			alert(fileCallPath);
			$(".bigPictureWrapper").css("display", "flex").show();
			$(".bigPicture")
				.html("<img src='<c:url value='/'/>member/display?filename=" + fileCallPath + "'/>")
				.animate({width:'100%', height: '100%'}, 1000);
		}
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			}, 1000)
		});
		
		
	});
</script>
<!-- 컨텐츠 끝  -->
<%@ include file="../includes/footer.jsp"%>