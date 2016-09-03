<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script type="text/javascript">
			$(function() {
				$.getJSON("${path}/c/getListj", function(data) {
					var roots = _.where(data,{parentId:'0'});
					for(var i=0; i<roots.length; i++) {
						$('.r-m-list').append('<div class="r-m-l-item"><div class="r-m-l-head">' + roots[i].categoryName + '</div><div class="r-m-l-comment"><a href="/c/m/e/' + roots[i].id + '" class="btn btn-default btn-xs">编辑</a>&nbsp;&nbsp;<a href="/c/d/' + roots[i].id + '" class="btn btn-default btn-xs">删除</a></div></div>');
						addChild(data, roots[i], 0);
					}
				});
			});
			
			//递归
			function addChild(data, parent, level) {
				var str = '';
				for(var i=0; i<level; i++) {
					str += '&nbsp;&nbsp;&nbsp;';
				}
				str = str + '└ ';
				var childs = _.where(data,{parentId:parent.id});
				for(var i=0; i<childs.length; i++) {
					$('.r-m-list').append('<div class="r-m-l-item"><div class="r-m-l-head">' + str + childs[i].categoryName + '</div><div class="r-m-l-comment"><a href="/c/m/e/' + childs[i].id + '" class="btn btn-default btn-xs">编辑</a>&nbsp;&nbsp;<a href="/c/d/' + childs[i].id + '" class="btn btn-default btn-xs">删除</a></div></div>');
					addChild(data, childs[i], level + 1);
				}
			}
		</script>
	</head>
	<body>
		<div class="r-main">
			<div class="r-m-head">
				<div class="r-m-h-title">
					分类管理<a href="/c/m/e" class="btn btn-default btn-xs" style="float:right; margin-right:12px;">新建</a>
				</div>
			</div>
			<div class="r-m-list">
			</div>
			<div class="r-m-footer" style="display:none;">
				<div class="r-m-f-main">
				</div>
			</div>
		</div>
	</body>
</html>