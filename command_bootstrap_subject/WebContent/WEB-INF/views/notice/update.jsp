<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
form {
	width: 600;
	margin-left: 10px;
	margin-right: 10px;
}
</style>
</head>

<title>${notice.title }</title>

<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<br /> <br />
		<section class="content-header">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12">
						<h2>
							<label for="exampleFormControlInput1">제목</label> 
							<input type="text" class="form-control" id="title" value="${notice.title }">
						</h2>
					</div>
				</div>
			</div>
		</section>
		<!-- Main content -->
		<section>
			<form>
				<div class="form-group">
					<label for="exampleFormControlInput1">${notice.writer }</label>
					<div class="article_info">
							<span class="date"><fmt:formatDate value="${notice.regdate }" pattern="yyyy.MM.dd"/> </span>
							<span class="count">   조회 ${notice.viewcnt }</span>
					</div>
				</div>
				<hr>
				<div class="form-group row">
					<div class="col-3">
						<label>시작 날짜</label>
						<input type="date" id="startDate" value="<fmt:formatDate value="${notice.startdate }" pattern="yyyy-MM-dd"/>"/>
					</div>
					<div class="col-3">
						<label>종료 날짜</label>
						<input type="date" id="endDate" value=<fmt:formatDate value="${notice.enddate }" pattern="yyyy-MM-dd"/> />
					</div>
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">내용</label>
					<textarea class="form-control" id="content" rows="15">${notice.content }</textarea>
				</div>
				<hr>
				<c:if test="${notice.writer eq loginUser.id }">
					<button type="button" class="btn btn-primary btn-sm" onclick="javascript:modify('update.do','${notice.nno}')">수정 등록</button>
					<button type="button" class="btn btn-danger btn-sm" onclick="window.close();">취소</button>
				</c:if>
			</form>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->


<form id="form">
	<input type="hidden" name="nno" value=""> 
	<input type="hidden" name="title" value=""> 
	<input type="hidden" name="content" value=""> 
	<input type="hidden" name="startdate" value=""> 
	<input type="hidden" name="enddate" value=""> 
</form>

<script>

function modify(url, nno) {
	if(!url) url="list.do";
	
	var form = $('#form');
	
	form.find('[name="nno"').val(nno);
	form.find('[name="title"').val($('#title').val());
	form.find('[name="content"]').val($('#content').val());
	form.find('[name="enddate"]').val($('#endDate').val());
	form.find('[name="startdate"]').val($('#startDate').val());
	
	if(form.find('[name="startdate"]').val() == ""){
		alert('시작날짜를 입력하세요');
		return;
	}else if(form.find('[name="title"]').val() == ""){
		alert('제목을 입력하세요');
		return;
	}
	if(form.find('[name="enddate"]').val() < form.find('[name="startdate"]').val()){
		alert('입력 날짜를 확인하세요');
		return false;
	}
	
	form.attr({
		action : url,
		method: 'post'
	}).submit();
}
</script>
</body>
