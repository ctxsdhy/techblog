<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="Keywords" content="技术,教程,学习,分享"/>
<meta name="description" content="Xs的Code备忘录 在目光无法抵达的远方，我们拥有心灵 在脚步无法到达的地方，我们拥有梦想" />
<meta name="author" content="ctxsdhy" />
<meta name="renderer" content="webkit" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-store" />
<%
	/* 当前基础url地址 */
	String path = request.getContextPath();
	request.setAttribute("path", path);
	String basePath = request.getScheme() +"://" + request.getServerName() + ":" +request.getServerPort() + path + "/";
	request.setAttribute("basePath", basePath);
%>
<!-- bootstrap -->
<link href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- nadhif -->
<link href="${path}/static/plugins/nadhif/css/style.min.css?v=2.1" rel="stylesheet" type="text/css" />
<!-- bootkit -->
<link href="${path}/static/plugins/bootkit/css/bootkit.css" rel="stylesheet" type="text/css" />
<!-- fontawesome -->
<link href="http://apps.bdimg.com/libs/fontawesome/4.4.0/css/font-awesome.css" rel="stylesheet" type="text/css" />
<!-- techblog -->
<link href="${path}/static/skins/default/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${path}/static/skins/default/css/form.css" rel="stylesheet" type="text/css" />
<link href="${path}/static/skins/default/css/frame.css" rel="stylesheet" type="text/css" />
<!-- jquery -->
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<!-- bootstrap -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- validate -->
<script src="${path}/static/plugins/validate/jquery-validate.js"></script>
<!-- layer -->
<script src="${path}/static/plugins/layer/layer.js"></script>
<link href="${path}/static/plugins/layer/skin/layer.css" rel="stylesheet" type="text/css" />
<!-- My97DatePicker -->
<script src="${path}/static/plugins/My97DatePicker/WdatePicker.js"></script>
<!-- moment -->
<script src="${path}/static/plugins/moment/moment.min.js"></script>
<!-- underscore -->
<script src="http://apps.bdimg.com/libs/underscore.js/1.7.0/underscore-min.js"></script>
<!-- handlebars -->
<script src="http://apps.bdimg.com/libs/handlebars.js/2.0.0-alpha.4/handlebars.min.js"></script>
<!-- techblog -->
<script src="${path}/static/plugins/techblog/techblog.js"></script>
<!-- syntaxhighlighter -->
<script src="http://apps.bdimg.com/libs/SyntaxHighlighter/3.0.83/scripts/shCore.min.js"></script>
<script src="http://apps.bdimg.com/libs/SyntaxHighlighter/3.0.83/scripts/shBrushCSharp.min.js"></script>
<script src="http://apps.bdimg.com/libs/SyntaxHighlighter/3.0.83/scripts/shBrushCss.min.js"></script>
<script src="http://apps.bdimg.com/libs/SyntaxHighlighter/3.0.83/scripts/shBrushJScript.min.js"></script>
<script src="http://apps.bdimg.com/libs/SyntaxHighlighter/3.0.83/scripts/shBrushPlain.min.js"></script>
<script src="http://apps.bdimg.com/libs/SyntaxHighlighter/3.0.83/scripts/shBrushJava.min.js"></script>
<script src="http://apps.bdimg.com/libs/SyntaxHighlighter/3.0.83/scripts/shBrushSql.min.js"></script>
<script src="http://apps.bdimg.com/libs/SyntaxHighlighter/3.0.83/scripts/shBrushXml.min.js"></script>
<link href="http://apps.bdimg.com/libs/SyntaxHighlighter/3.0.83/styles/shCore.min.css" rel="stylesheet" type="text/css" />
<link href="${path}/static/plugins/syntaxhighlighter/styles/shCoreEclipse.css" rel="stylesheet" type="text/css" />
