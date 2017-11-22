<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script> 
$(function() { 
	$("#postcodify_search_button").postcodifyPopUp();
	$("#postcodify").postcodify({
        insertAddress : "#address",
        hideOldAddresses : false
    });

});
</script>


<script type="text/javascript">
	$(function() {
		$("input[type='radio']").click(function() {
			var type = $(this).val();
			$.ajax({
				url: "./payDeliverType.pay",
				type: "POST",
				data: {
					type: type
				},
				success: function(data) {
					$("#result").html(data);
				}
			});
		});
		
		$("#result").on('load', '#load', function() {
			$("#postcodify_search_button").postcodifyPopUp();
			$("#postcodify").postcodify({
		        insertAddress : "#address",
		        hideOldAddresses : false
		    });
		});
	});
</script>

<style type="text/css">
	.title01 {
		padding: 10px;
		border-bottom: 1px solid black;
		margin-bottom: 20px;
	}
	
	.list {
		list-style: none;
		font-size: 16px;
	}
	
	.col3 {
	    float: left;
		margin: 0 18px 0 -10px;
		padding: 5px 0 0 10px;
		width: 100px;
		line-height: 20px;
		color: #4b4b4b;
	}
	
	.list li {
		margin-bottom: 5px;
	}
	
	.btnSize {
		width: 50px;
		height: 30px;
		font-size: 11px;
	}
	
	.row, .bottom {
		margin-bottom: 10px;
	}
</style>

</head>
<body>
	<!-- <button id="postcodify_search_button">검색</button>
	<input type="text" name="post_number" class="postcodify_postcode5" value="" style="width: 300px;"/>
	<input type="text" name="addr" class="postcodify_address" value="" style="width: 300px;" /><br />
	<input type="text" name="addr_extra" class="postcodify_details" value="" style="width: 300px;" /><br />
	<input type="text" name="addr_etc" class="postcodify_extra_info" value="" style="width: 300px;" /><br /> -->
	
	
	<form action="#" method="POST">
		<div class="container">
			<h4 class="title01">배송지 정보</h4>
			<div class="row">
				<p class="col3">배송지 정보</p>
				<div>
					<input type="radio" id="basic" name="deliver" value="Basic" checked="checked">
					<label for="basic">기본배송지</label>
					<input type="radio" id="new" name="deliver" value="New">
					<label for="new">신규배송지</label>
				</div>
					
			</div>
			<div id="result">
			</div>			
			
		</div>
	</form>
	


</body>
</html>