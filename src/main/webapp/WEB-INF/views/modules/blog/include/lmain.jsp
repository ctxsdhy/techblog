<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		
		//加载分类列表
		$.getJSON("${path}/c/getListj", function(data) {
			
			var roots = _.where(data,{parentId:'0'});
			for(var i=0; i<roots.length; i++) {
				var fclass = '';
				if(i == 0) {
					fclass = 'class="l-m-list-f"';
				}
				$('.l-m-list').append('<a ' + fclass + ' href="#c/' + roots[i].id + '" categoryId="' + roots[i].id + '"><span>' + roots[i].categoryName + '</span></a>')
				addChild(data, roots[i], 0);
			}
		});
	});
	
	//递归
	function addChild(data, parent, level) {
		var str = '';
		for(var i=0; i<level; i++) {
			str += '&nbsp;&nbsp;&nbsp;&nbsp;';
		}
		str = str + '&nbsp;└&nbsp;';
		var childs = _.where(data,{parentId:parent.id});
		for(var i=0; i<childs.length; i++) {
			$('.l-m-list').append('<a href="#c/' + childs[i].id + '" categoryId="' + childs[i].id + '"><span>' + str + childs[i].categoryName + '</span></a>');
			addChild(data, childs[i], level + 1);
		}
	}
</script>
<div class="l-m-list"></div>