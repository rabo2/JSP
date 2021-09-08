<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<style>
form{
	margin-left: 200px;
	margin-right: 200px;

}

.content-header{
	margin-left: 180px;
}

</style>
</head>

<title>공지사항 등록</title>

<body>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-sm-6">
						<h1>공지사항 등록</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
						</ol>
					</div>
				</div>
			</div>
		</section>
		<!-- Main content -->
		<section>
			<form>
				<div class="form-group">
					<label for="exampleFormControlInput1">제목</label> 
					<input type="text" class="form-control" id="title"placeholder="제목을 입력하세요">
				</div>
				<hr>
				<div class="form-group row">
					<div class="col-4">
						<label>시작 날짜</label>
						<input type="date" id="startDate">
					</div>
					<div class="col-4">
						<label>종료 날짜</label>
						<input type="date" id="endDate">
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">내용</label>
					<textarea onkeyup="console.log(this.value);" class="form-control" id="content" cols="15" rows="15" wrap="hard" style="resize: none;"></textarea>
				</div>
				<hr>
					<button type="button" class="btn btn-primary" onclick="regist('regist.do');">등록</button>
					<button type="button" class="btn btn-danger" onclick="CloseWindow();">취소</button>
			</form>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->


	<form id="registForm">
		<input type="hidden" name="title" value="">
		<input type="hidden" name="startDate" value="">
		<input type="hidden" name="endDate" value="">
		<input type="hidden" name="content" value="">
	</form>
<script>
function regist(url){
	if(!url) url="registForm.do";
	
	var form = $('#registForm');

	form.find('[name="title"').val($('#title').val());
	form.find('[name="content"]').val($('#content').val().replace(/(?:\r\n|\r|\n)/g,'<br/>'));
	form.find('[name="endDate"]').val($('#endDate').val());
	form.find('[name="startDate"]').val($('#startDate').val());
	
	if(form.find('[name="startDate"]').val() == ""){
		alert('시작날짜를 입력하세요');
		return false;
	}else if(form.find('[name="title"]').val() == ""){
		alert('제목을 입력하세요');
		return false;
	}
	
	if(form.find('[name="endDate"]').val() < form.find('[name="startDate"]').val()){
		alert('입력 날짜를 확인하세요');
		return false;
	}
	
	form.attr({
		action : url,
		method: 'post'
	}).submit();
}
function go_back(url){
	location.href = url;
}
</script>
</body>
