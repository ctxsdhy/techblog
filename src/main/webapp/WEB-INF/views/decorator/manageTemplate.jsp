<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Code&nbsp;备忘录</title>
		<%@include file="/WEB-INF/views/include/head.jsp" %>
		<script type="text/javascript">
			$(function() {
				$('.l-h-text a').click(function() {
					window.location = '/';
				});
			});
		</script>
		<sitemesh:write property='head' />
	</head>
<body>
	<div class="main">
			<div class="left">
				<div class="l-head">
					<%@include file="/WEB-INF/views/include/lhead.jsp" %>
				</div>
				<div class="l-main">
					<%@include file="/WEB-INF/views/modules/manage/include/lmain.jsp" %>
				</div>
				<div class="l-footer">
					<%@include file="/WEB-INF/views/include/lfooter.jsp" %>
				</div>
			</div>
			<div class="right">
				<sitemesh:write property='body' />
			</div>
			<div class="clear"></div>
		</div>
</body>
</html>