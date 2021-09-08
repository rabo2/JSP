<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }" />

<head>
<style>
.notice_title>span:hover{
	cursor:pointer;
	text-decoration: underline;
}

</style>
</head>

<title>공지사항</title>

<body>
	 <!-- Main content -->
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>공지사항</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="list.do">
				        	<i class="fa fa-dashboard"></i>공지사항
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	목록
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
	 
   	<section class="content">
   		<div class="card">
   			<div class="card-header with-border">
<!--    				<button type="button" class="btn btn-primary" onclick="location.href='registForm.do'" >글쓰기</button> -->
   				<button type="button" class="btn btn-primary" onclick="javascript:OpenWindow('registForm.do', '글쓰기', '900', '800')" >글쓰기</button>
   				<div id="keyword" class="card-tools" style="width:550px;">
   					 <div class="input-group row">
   					 	<!-- search bar -->
   					 	
   					 	 <!-- sort num -->
					  	<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go(1);">
					  		<option value="10" >정렬개수</option>
					  		<option value="2" ${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>
					  		<option value="3" ${cri.perPageNum == 3 ? 'selected':''}>3개씩</option>
					  		<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
					  		
					  	</select>
					  	
					  	  <!-- search bar -->
					 	<select class="form-control col-md-3" name="searchType" id="searchType">
							<option value=""  ${cri.searchType eq '' ? 'selected':''}>검색구분</option>
							<option value="t"  ${cri.searchType eq 't' ? 'selected':''}>제목</option>
							<option value="w"  ${cri.searchType eq 'w' ? 'selected':''}>작성자</option>
							<option value="c"  ${cri.searchType eq 'c' ? 'selected':''}>내용</option>
						</select>
						<!-- keyword -->
   					 	<input  class="form-control" type="text" name="keyword" 
										placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" 
									id="searchBtn" data-card-widget="search" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					<!-- end : search bar -->		
   					 </div>
   				</div>   			
   			</div>
   			<div class="card-body" style="text-align:center;">
    		  <div class="row">
	             <div class="col-sm-12">	
		    		<table class="table table-bordered">
		    			<tr>
		                	<th>글번호</th>
		                	<th>제목</th>
		                	<th>작성자</th>
		                	<th>작성일자</th>
		                	<th>조회수</th>
		                </tr>
		               	<c:forEach items="${noticeList }" var="notice" >
		               	  <tr>
		               		<td>${notice.rownum }</td>
		              		<td onclick="javascript:go_detail('${notice.nno}')" class="notice_title">
		              			<span><c:if test="${notice.title.length() ge 9 }">
									${notice.title.substring(0,8) }...
		              			</c:if>
		              			<c:if test="${notice.title.length() lt 9 }">
			              			${notice.title }
		              			</c:if>
		              			</span>
		              		</td>
		              		<td>${notice.writer }</td>
		              		<td>
		              			<fmt:formatDate value="${notice.regdate }" pattern="yyyy-MM-dd"/>
<%-- 		              			${notice.regdate } --%>
		              		</td>
		              		<td>${notice.viewcnt }</td>
		              	  </tr>
		               	</c:forEach>   	
		              
		               	
		            </table>
    		     </div> <!-- col-sm-12 -->
    	       </div> <!-- row -->
    		</div> <!-- card-body -->
    		<div class="card-footer">
    			<!-- pagenation -->
    			<nav aria-label="Navigation">
    				<ul class="pagination justify-content-center m-0">
    					<li class="page-item">
							<a class="page-link" href="javascript:list_go(1);">
								<i class="fas fa-angle-double-left"></i>
							</a>
						</li>
						<li class="page-item">
							<a class="page-link" 
							href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">
								<i class="fas fa-angle-left"></i>
							</a>
						</li>
						<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
							<li class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
								<a class="page-link" href="javascript:list_go('${pageNum}');" >
								${pageNum }</a>
							</li>
						</c:forEach>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">
								<i class="fas fa-angle-right" ></i>
							</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}');">
								<i class="fas fa-angle-double-right"></i>
							</a>
						</li>	
    				</ul>
    			</nav>
    		</div>
	     </div>
   	</section>

<form id="jobForm">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form> 	

   	
<script>
function list_go(page,url){
	if(!url) url="list.do";
	
	var jobForm=$('#jobForm');
	
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}


function go_detail(nno){
	var url = "detail.do?nno="+nno;
	OpenWindow(url, '상세페이지', '800', '500');
	
}
	
//팝업창들 뛰우기
//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
							+"height="+ WinHeight +", top="+ wintop +", left=" 
							+ winleft +", resizable=yes, status=yes"  );
	win.focus() ; 
}

//팝업창 닫기
function CloseWindow(parentURL){
	if(parentURL){
		window.opener.parent.location.href=parentURL;
	}else{
		window.opener.parent.location.reload(true);	
	}
	window.close();
}

</script>
</body>





