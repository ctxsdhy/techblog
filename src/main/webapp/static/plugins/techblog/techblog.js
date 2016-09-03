//固定一些div的高度
function widthFunctions(e) {
	var w = $('.main').outerWidth();
	if(w >= 1000) {
		var t = $('.l-head').outerHeight(true),
		n = $('.l-footer').outerHeight(true),
		r = $(window).height();
		$('.l-m-list').css('max-height', r - t - n);
		var m = r - t - n + 50;
		if($('.duoshuo').length > 0) {
			m = m - 25;
		}
		$('.r-m-list').css('min-height', m + 'px');
	}
}

//获得ajax分页数据
function getPage(pageNo, pageSize, pcount, url) {
	var page = '<ul class="ulxpage">';
	var count = parseInt(pcount/(pageSize + 1));
	for(var i=1; i<=count + 1; i++) {
		page += '<li';
		if(i == pageNo) {
			page += ' class="xpage-active"';
		}
		page += '><a href="' + url + '/' + i + '">' + i + '</a></li>';
	}
	page += '</div>';
	return page;
}

$(function (){
	widthFunctions();
});

$(window).bind('resize', widthFunctions);