<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Code&nbsp;备忘录</title>
		<%@include file="/WEB-INF/views/include/head.jsp" %>
	</head>
	<body>
		<form action="${path}/m/u/auth" method="post">
			<div class="login-body">
				<div class="login-box">
					<div class="login-main">
						<div class="login-m-top">
						</div>
						<div class="login-m-bottom">
							<input type="text" class="form-control" placeholder="登录名称" name="loginName" value="${userInfo.loginName}" />
							<div style="height: 20px;"> </div>
							<input type="password" class="form-control" placeholder="登录密码" name="loginPwd" value="${userInfo.loginPwd}" />
							<div style="height: 20px;"> </div>
							<input type="submit"  class="btn btn-primary btn-sm btn-block" value="登&nbsp;录" />
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>