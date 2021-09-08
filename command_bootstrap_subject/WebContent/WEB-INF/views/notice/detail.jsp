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

.content-header {
	margin-left: 10px;
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
					<div class="">
						<h3>${notice.title }</h3>
					</div>
				</div>
			</div>
		</section>
		<!-- Main content -->
		<section>
			<form>
				<div>
				<label for="exampleFormControlInput1">${notice.writer }</label>
				<div class="form-group row">
					<div class="article_info col-12">
						<span class="date"><fmt:formatDate value="${notice.regdate }" pattern="yyyy.MM.dd"/> </span>
						<span class="count">   조회 ${notice.viewcnt }</span>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<div>${notice.content }</div>
				</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-11">
						<c:if test="${notice.writer eq loginUser.id }">
							<button type="button" class="btn btn-primary btn-sm" onclick="javascript:go_process('updateForm.do','${notice.nno}'); ">수정</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="javascipt:go_process('delete.do', '${notice.nno}');">삭제</button>
						</c:if>
					</div>
					<div class="col-1">
						<button type="button" class="btn btn-secondary btn-sm" onclick="window.close(); window.opener.location.href='list.do'">닫기</button>
					</div>
				</div>
			</form>
		</section>
		<!-- /.content -->

	</div>
	<!-- /.content-wrapper -->


<form id="form">
	<input type="hidden" name="nno" value=""/> 
</form>

<script>
function go_process(url, nno) {
	if(url == 'updateForm.do'){
		window.resizeTo(800,900);
		window.moveBy(0, 2000);
	}
	
	var form = $('#form');
	form.find('[name="nno"]').val(nno);
	
	form.attr({
		action : url,
		method : "post"
	}).submit();
}
</script>
</body>

