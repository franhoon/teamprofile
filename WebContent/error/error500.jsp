<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.jspf" %>

<style>
textarea { resize:none; height:200px;}
</style>

<div class="container">

	<form class="form-horizontal" id="form1">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="text-center">
					500 에러페이지
				</h3>
			</div>
			<div class="panel-body">
				<div class="form-group">
					<label class="control-label col-sm-2"></label>
					<div class="col-sm-10">
						<textarea class="form-control" name="common/errorParam" rows="10" readonly>
							HTTP상태코드 : 500에러
							요청한 페이지를 찾을 수 없습니다.
							문서이름을 다시 확인하세요 	
						</textarea>
						<div align="center"> <img src="error/error2.gif" width=600 height=150> </div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>