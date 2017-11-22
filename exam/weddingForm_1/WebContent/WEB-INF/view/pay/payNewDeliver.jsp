<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="load">
<div class="row">
	<p class="col3">수령인</p>
	<div><input type="text"></div>
</div>

<div class="row">
	<p class="col3">배송지명</p>
	<div><input type="text"></div>
</div>

<div class="row">
	<p class="col3">연락처</p>
	<div>
		<select>
			<option>010</option>
		</select>
		&nbsp;-&nbsp;
		<input type="text">
		&nbsp;-&nbsp;
		<input type="text">
	</div>
</div>

<div class="row">
	<p class="col3">배송지 주소</p>
	<div>
		<input type="text" name="post_number" class="postcodify_postcode5" value=""/>
		<button id="postcodify_search_button" class="bottom">검색</button><br/>
		<input type="text" name="addr" class="postcodify_address" value="" style="width: 300px;" />&nbsp;
		<input type="text" name="addr_etc" class="postcodify_extra_info" value="" style="width: 300px;" />
	</div>
</div>
</div>