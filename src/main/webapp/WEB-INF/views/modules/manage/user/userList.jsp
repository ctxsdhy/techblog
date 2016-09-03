<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@include file="/WEB-INF/views/include/taglib.jsp" %>
		<script type="text/javascript">
			$(function() {
				
				//设置分页
				var pageNo = parseInt('${pageUserList.pageNo}');
				var pageSize = parseInt('${pageUserList.pageSize}');
				var pcount = parseInt('${pageUserList.count}');
				
				if(pageNo != '' && parseInt(pcount/(pageSize + 1)) > 0) {
					$('.xpage').html(getPage(pageNo, pageSize, pcount, '/m/u/list'));
				} else {
					$('.r-m-footer').hide();
				}
			});
		</script>
	</head>
	<body>
		<div class="r-main">
			<div class="r-m-head">
				<div class="r-m-h-title">
					用户管理<a href="${path}/m/u/e" class="btn btn-default btn-xs" style="float:right; margin-right:12px;">新建</a>
				</div>
			</div>
			<div class="r-m-list">
				<c:if test="${ !empty pageUserList }">
					<c:forEach items="${pageUserList.list}" var="item">
						<div class="r-m-l-item">
							<div class="r-m-l-head">
								<%-- <a href="${path}/m/u/${item.id}" target="_blank"></a> --%>
								${item.loginName}
							</div>
							<div class="r-m-l-comment">
								<a href="${path}/m/u/e/${item.id}" class="btn btn-default btn-xs">编辑</a>&nbsp;
								<a href="#" onclick="javascript:if(confirm('你确定要删除?')){location.href='/m/u/d/${item.id}';return true;}return false;" class="btn btn-default btn-xs">删除</a>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="r-m-footer">
				<div class="r-m-f-main">
					<div class="xpage"></div>
				</div>
			</div>
		</div>
	</body>
</html>