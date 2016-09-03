<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Code&nbsp;备忘录</title>
		<%@include file="/WEB-INF/views/include/head.jsp" %>
		<%@include file="/WEB-INF/views/include/taglib.jsp" %>
		<!-- 多说控件 -->
		<script type="text/javascript">var duoshuoQuery = {short_name:"xstechblog"};</script>
		<script src="http://static.duoshuo.com/embed.js" type="text/javascript"></script>
	</head>
	<script type="text/javascript">
		$(function() {
			
			//加载页面信息
			//loadPage();
			
			//解读hash
			readHash();
			
			//监听hash
			window.onpopstate = function(e) {
				
				//解读hash
				readHash();
		    };
		});
		
		//解读hash
		function readHash() {
			
			$('.l-m-list a').removeClass('active');
			
			var hash = location.hash;
			
			document.title = 'Code 备忘录';
			
			//如果是首页
			if(hash == '') {
				loadPage();
			} else {
				var keys = hash.split('/');
				var categoryId = '';
				var dailyName = '';
				var pageNo = '';
				
				//显示列表
				if(keys[0] == '#c') {
					
					//加载标题
					loadHead();
					
					$('.l-m-list a[categoryId=' + keys[1] + ']').addClass('active');
					categoryId = keys[1];
					if(keys.length > 2) {
						pageNo = keys[2];
					}
					
					//加载文章列表
					loadList(categoryId, dailyName, pageNo);
				} 
				else if(keys[0] == '#') {
					
					//加载标题
					loadHead();
					
					pageNo = keys[1];
					
					//加载文章列表
					loadList(categoryId, dailyName, pageNo);
				}
				//显示搜索
				else if(keys[0] == '#s') {
					
					//加载标题
					loadHead();
					
					dailyName = keys[1];
					if(keys.length > 2) {
						pageNo = keys[2];
					}
					
					//加载文章列表
					loadList(categoryId, dailyName, pageNo);
				}
				//显示文章
				else if(keys[0] == '#d') {
					
					$.getJSON('${path}/d/getModelj?dailyId=' + keys[1], function(data) {
						
						//填充标题
						$('.r-m-head').html('<div class="r-m-h-t-view">' + data.dailyName + '</div>');
						
						//填充内容
						$('.r-m-list').html('<div class="r-m-l-content">' + data.dailyContent + '</div>');
						
						//代码高亮
						SyntaxHighlighter.highlight();
						
						//多说控件
						$('.r-m-list').after('<div class="duoshuo"></div>');
						var el = $('.duoshuo');
						el.attr('data-thread-key', data.id);
						el.attr('data-url', '${basePath}#d/' + data.id);
						el.attr('data-title', data.dailyName);
						el.attr('data-author-key', data.userId);
						DUOSHUO.EmbedThread(el);
						
						$('.r-m-footer').hide();
						
						document.title = data.dailyName;
						
						widthFunctions();
					});
				}
			}
		}
		
		//加载页面信息
		function loadPage() {
			
			//加载标题
			loadHead();
			
			//加载文章列表
			loadList('', '', '');
		}
		
		//加载文章列表
		function loadList(categoryId, dailyName, pageNo) {
			
			$('.r-m-list').html('');
			
			if(pageNo == '') {
				pageNo = '1';
			}
			
			//加载分类信息
			if(categoryId != '') {
				$.getJSON('${path}/c/getInfoj/' + categoryId, function(data) {
					if(data.categoryContent != undefined && data.categoryContent != '') {
						$('.r-m-list').prepend('<div class="r-m-l-c-content">' + data.categoryContent + '</div>');
					}
				});
			}
			
			//加载文章列表
			$.getJSON('${path}/d/getListj?categoryId=' + categoryId + '&dailyName=' + dailyName + '&pageNo=' + pageNo, function(data) {
				
				$('.duoshuo').remove();
				$('.r-m-footer').hide();
				
				if(data.list != undefined && data.list.length > 0) {
					
					//填充模板
					var htemplate = Handlebars.compile($("#table-template").html());
					Handlebars.registerHelper("prettifyDate", function(timestamp) {
					    return new moment(timestamp).format('YYYY-MM-DD');
					});
					$('.r-m-list').append(htemplate(data.list));
					
					//设置分页
					if(parseInt(data.count/(data.pageSize + 1)) > 0) {
						var purl = '';
						if(dailyName != '') {
							purl = '#s/' + dailyName;
						} else if(categoryId != '') {
							purl = '#c/' + categoryId;
						} else {
							purl = '#';
						}
						$('.xpage').html(getPage(data.pageNo, data.pageSize, data.count, purl));
						$('.r-m-footer').show();
					}
					
					widthFunctions();
				}
			});
		}
		
		//加载标题
		function loadHead() {
			if($('.r-m-h-search').length == 0) {
				$('.r-m-head').load('${path}/top');
			}
		}
	</script>
	<body>
		<div class="main">
			<div class="left">
				<div class="l-head">
					<%@include file="/WEB-INF/views/include/lhead.jsp" %>
				</div>
				<div class="l-main">
					<%@include file="/WEB-INF/views/modules/blog/include/lmain.jsp" %>
				</div>
				<div class="l-footer">
					<%@include file="/WEB-INF/views/include/lfooter.jsp" %>
				</div>
			</div>
			<div class="right">
				<div class="r-main">
					<div class="r-m-head">
					</div>
					<div class="r-m-list">
					</div>
					<script id="table-template" type="text/x-handlebars-template">
						{{#each this}}
							<div class="r-m-l-item">
								<div class="r-m-l-head">
									<a href="#d/{{id}}" dailyId="{{id}}">{{dailyName}}</a>
								</div>
								<div class="r-m-l-comment">
									{{prettifyDate createDate}}
								</div>
							</div>
						{{/each}}
					</script>
					<div class="r-m-footer">
						<div class="r-m-f-main">
							<div class="xpage"></div>
							<div style="font-size:12px; text-align:right; margin:-3px 10px 0 0; display:none;">
								浙ICP备12000251号
							</div>
							<div style="font-size:12px; text-align:right; margin:8px 10px 0 0; display:none;">
								© 2016 / xs / ctxsdhy
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</body>
</html>