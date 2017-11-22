<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" name="name" value=" "> <!-- sessionName -->
<input type="hidden" name="addr" value=" "> <!-- sessionAddr -->
<input type="hidden" name="phone" value=" "> <!-- sessionPhone -->
<input type="hidden" name="mail" value=" "> <!-- sessionMail -->

<ul class="list">
	<li><strong>이름:</strong> sessionName</li>
	<li><strong>전화번호:</strong> sessionPhone</li>
	<li><strong>주소:</strong> sessionAddr &nbsp;<button id="changeAddr" class="btn btnSize">변경</button></li>
	<li><strong>메일:</strong> sessionMail</li>
</ul>