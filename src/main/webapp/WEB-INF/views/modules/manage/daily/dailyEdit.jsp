<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<%@include file="/WEB-INF/views/include/taglib.jsp" %>
		<script src="${path}/static/plugins/ueditor/ueditor.config.js" type="text/javascript"></script>
		<script src="${path}/static/plugins/ueditor/ueditor.all.js" type="text/javascript"></script>
		<script src="${path}/static/plugins/utils/banBackSpace.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
				widthFunctions2();
				
				$.getJSON("/c/getListj", function(data) {
					
					var roots = _.where(data,{parentId:'0'});
					for(var i=0; i<roots.length; i++) {
						var fclass = '';
						if(i == 0) {
							fclass = 'class="l-m-list-f"';
						}
						$('#categorySelect').append('<option value="' + roots[i].id + '">' + roots[i].categoryName + '</option>');
						addChild(data, roots[i], 0);
					}
					
					if('${dailyInfo.categoryId}' != '') {
						$('#categorySelect').val('${dailyInfo.categoryId}');
					}
				});
				
				$(window).bind('resize', widthFunctions2);
			})
			
			//递归
			function addChild(data, parent, level) {
				var str = '';
				for(var i=0; i<level; i++) {
					str += '&nbsp;&nbsp;&nbsp;';
				}
				str = str + '└ ';
				var childs = _.where(data,{parentId:parent.id});
				for(var i=0; i<childs.length; i++) {
					$('#categorySelect').append('<option value="' + childs[i].id + '">' + str + childs[i].categoryName + '</option>');
					addChild(data, childs[i], level + 1);
				}
			}
			
			function widthFunctions2(e) {
				var t2 = $('.l-head').outerHeight(true),
				n2 = $('.l-footer').outerHeight(true),
				r2 = $(window).height();
				var m2 = r2 - t2 - n2;
				$('#edui1_iframeholder').css('height', '');
				$('#edui1_iframeholder').css('min-height', m2 - 33 + 'px');
				$('#editor').css('min-height', m2 - 33 + 'px');
			}
		</script>
	</head>
	<body>
		<div class="r-main">
			<form action="${path}/d/s" method="post">
				<div class="r-m-head">
					<div class="r-m-h-title">
						<input type="text" class="form-control" placeholder="文章名称" name="dailyName" value="${dailyInfo.dailyName}" />
						<c:if test="${!empty dailyInfo}">
						     <input type="hidden" name="id" value="${dailyInfo.id}" />
						</c:if> 
					</div>
				</div>
				<div class="r-m-list">
					<div class="r-m-l-content">
						<script type="text/plain" id="editor" name="dailyContent" style="width: 100%; height: 100%;">${dailyInfo.dailyContent}</script>
					    <script type="text/javascript">
					        var ue = UE.getEditor('editor');
					    </script>
					</div>
				</div>
				<div class="r-m-footer">
					<div class="r-m-f-main">
						<input type="submit"  class="btn btn-default btn-xs" value="保存" />&nbsp;
						<a href="${path}/d/m/list" class="btn btn-default btn-xs">返回</a>&nbsp;
						<span style="display:inline-block;float:right;">
							<select id="categorySelect" name="categoryId">
								<option value="0">选择分类</option>
							</select>
						</span>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>