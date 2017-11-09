<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Login</h1>
<link href="../css/login.css" rel="stylesheet">

<!-- 
<c:import url="./WEB-INF/view/temp/header.jsp"></c:import>
	 -->
<!-- contents 시작 -->
	<section class="contents_wrap2">

		<div class="blank"></div>
		<article class="content_top">
			<!-- logo -->
			<!-- <img alt="" src="../image/common/login_logo.gif"> -->
		</article>


		<article class="content_main2">


			<form name="frm" class="form-horizontal" action="commonLogin.common" method="post">
				<div class="imgcontainer">
				<!-- human icon -->
					<!-- <img src="../image/main/jyp.jpg" alt="Avatar" class="avatar"
						style="width: 300px; height: 300px; margin-top: 10px;"> -->
				</div>

<!-- login -->
				<div class="container">
					<label style="color: white;" class="btn btn-primary"><b>Id</b></label>
					<input type="text" placeholder="Enter Username" 
						required style="width: 60%;"  class="form-control" id="id"
									name="id">    <br>
						<label  style="color: white;" class="btn btn-primary"><b>Password</b></label>
					<input type="password" placeholder="Enter Password" 
						required style="width: 60%;"   class="form-control" id="pw1" name="pw">

					<button type="submit" style="width: 60%;">Login</button>		
					<input type="checkbox" checked="checked" value="remember" name="remember"> Remember me
				</div>

<!-- check your state -->
				<div class="container" style="background-color: #f1f1f1; height: 50px;" >

					<!-- customer business -->
				
					
					<div style="width: 50%; display: inline-block; padding-bottom: 10px;"> Choice your State &nbsp;&nbsp;
					
					<div class="checkbox" style="width: 50%; display: inline-block;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" class="ch" checked="checked"
							value="customer" name="job"> customer
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" class="ch"
							value="business" name="job"> business
					</div>
					</div>
		
<!-- join & forgot password  -->					
					<div style="float: right;">&nbsp;&nbsp; or &nbsp;&nbsp; Do you want
						&nbsp;<a href="./commonJoin.common">
							Sign Up</a>?
					</div>  <div style="float: right;">Forgot &nbsp;
					<a href="./commonEmail.common">password? </a></div>
					
					<%-- ${pageContext.request.contextPath}/common/commonJoin.jsp --%>
					
				</div>
			</form>


		</article>
	</section>
	<!-- contents 끝 -->



</body>
</html>