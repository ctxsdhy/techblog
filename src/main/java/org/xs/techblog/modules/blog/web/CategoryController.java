package org.xs.techblog.modules.blog.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xs.techblog.common.utils.StringUtils;
import org.xs.techblog.common.web.BaseController;
import org.xs.techblog.modules.blog.entity.Category;
import org.xs.techblog.modules.blog.service.CategoryService;

import com.alibaba.fastjson.JSON;

/**
 * 分类Controller
 */
@Controller
@RequestMapping("c")
public class CategoryController extends BaseController {
	
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * 获得实体
	 */
	@ResponseBody
	@RequestMapping(value = "getInfoj/{id}", produces = { "text/plain;charset=utf-8" })
	public String listj(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		return JSON.toJSONString(categoryService.getById(id));
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping(value = "getListj", produces = { "text/plain;charset=utf-8" })
	public String listj() throws Exception {
		return JSON.toJSONString(categoryService.getList(Order.asc("orderId")));
	}
	
	/**
	 * 编辑列表
	 */
	@RequestMapping("m/list")
	public String mlist(HttpServletRequest request) throws Exception {
		return "modules/manage/category/categoryList";
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping(value = "m/e")
	public String edit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return edit(null, request, response);
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping(value = "m/e/{id}")
	public String edit(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(!StringUtils.isEmpty(id)) {
			Category categoryInfo= categoryService.getById(id);
			request.setAttribute("categoryInfo", categoryInfo);
		}
		
		return "modules/manage/category/categoryEdit";
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value = "s")
	public String save(Category categoryInfo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(categoryInfo != null) {
			if(StringUtils.isEmpty(categoryInfo.getId())) {
				categoryInfo.setUserId("123");
				categoryService.add(categoryInfo);
			} else {
				categoryService.update(categoryInfo);
			}
		}
		
		return "redirect:/c/m/list";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "d/{id}")
	public String delete(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(!StringUtils.isEmpty(id)) {
			categoryService.deleteById(id);
		}
		
		return "redirect:/c/m/list";
	}
}