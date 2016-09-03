<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@include file="/WEB-INF/views/include/taglib.jsp" %>
		<script type="text/javascript">
			$(function() {
				widthFunctions2();
				$(window).bind('resize', widthFunctions2);
			})
			
			function widthFunctions2(e) {
				var t2 = $('.l-head').outerHeight(true),
				n2 = $('.l-footer').outerHeight(true),
				r2 = $(window).height();
				var m2 = r2 - t2 - n2;
				$('.r-m-list').css('min-height', m2 + 60 + 'px');
			}
		</script>
	</head>
	<body>
		<div class="r-main">
			<form action="${path}/m/u/s" method="post">
				<div class="r-m-head">
					<div class="r-m-h-title">
						用户编辑
						<c:if test="${!empty userInfo}">
						     <input type="hidden" name="id" value="${userInfo.id}" />
						</c:if> 
					</div>
				</div>
				<div class="r-m-list">
					<div class="r-m-l-content">
						<input type="text" class="form-control" placeholder="登录名称" name="loginName" value="${userInfo.loginName}" />
						<br />
						<input type="text" class="form-control" placeholder="登录密码" name="loginPwd" value="${userInfo.loginPwd}" />
					</div>
				</div>
				<div class="r-m-footer">
					<div class="r-m-f-main">
						<input type="submit"  class="btn btn-default btn-xs" value="保存" />&nbsp;
						<a href="${path}/m/u/list" class="btn btn-default btn-xs">返回</a>&nbsp;
					</div>
				</div>
			</form>
		</div>
	</body>
</html>