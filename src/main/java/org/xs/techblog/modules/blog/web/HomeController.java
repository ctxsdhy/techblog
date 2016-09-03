package org.xs.techblog.modules.blog.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xs.techblog.common.web.BaseController;

/**
 * 首页Controller
 */
@Controller
public class HomeController extends BaseController {
	
	/**
	 * 首页
	 */
	@RequestMapping(value = "")
	public String home(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "modules/blog/index";
	}
	
	/**
	 * 首页top
	 */
	@RequestMapping(value = "top")
	public String top(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "modules/blog/include/rmhead";
	}
}