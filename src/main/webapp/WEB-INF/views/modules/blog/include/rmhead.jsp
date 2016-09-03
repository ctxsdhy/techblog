<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		document.onkeydown = function(e){ 
		    var ev = document.all ? window.event : e;
		    if(ev.keyCode==13) {
		    	var dailyName = $('#search').val();
		    	if(dailyName != '') {
		    		window.location = '#s/' + dailyName;
		    	} else {
		    		window.location = '#';
		    	}
		    }
		}
	});
</script>
<div class="r-m-h-text">
	在目光无法抵达的远方，我们拥有心灵<br />
	在脚步无法到达的地方，我们拥有梦想
</div>
<div class="r-m-h-search">
	<input type="text" id="search" class="form-control search" placeholder="搜索" value="${dailyName}" />
</div>
<div class="clean"></div>
