<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="subModal">
	<h3 class="title">신고 접수 정보</h3>
	<ul class="list-group">
		<li class="list-group-item">글번호 : ${report.num}</li>
		<li class="list-group-item">글제목 : ${report.title}</li>
		<li class="list-group-item">작성자 : ${report.id}</li>
		<li class="list-group-item">문의내용<br>${report.contents}</li>
		<li class="list-group-item">작성 날짜 : ${report.reg_date}</li>
	</ul>
</div>

<div class="subModal">
	<h3 class="title">해당 업체 정보</h3>
	<ul class="list-group">
		<li class="list-group-item">업체 ID : ${company.id}</li>
		<li class="list-group-item">웨딩홀 이름 : ${company.company_name}</li>
		<li class="list-group-item">웨딩홀 전화번호 : ${company.company_tel}</li>
		<li class="list-group-item">웨딩홀 주소 : ${company.company_addr}</li>
		<li class="list-group-item">사업자번호 : ${company.company_number}</li>
	</ul>
</div>

<div class="btn_box">
	<c:if test="${report.black eq 'F'}">
		<a href="./reportBlackUpdate.report?num=${report.num}&black=T" class="btn btn-dark">블랙 등록</a>
	</c:if>
	<c:if test="${report.black eq 'T'}">
		<a href="./reportBlackUpdate.report?num=${report.num}&black=F" class="btn btn-dark">블랙 취소</a>
	</c:if>
	<a href="./reportDelete.report?num=${report.num}" class="btn btn-danger">삭제</a>
</div>