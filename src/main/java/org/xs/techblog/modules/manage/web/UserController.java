package org.xs.techblog.modules.manage.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xs.techblog.common.persistence.Page;
import org.xs.techblog.common.utils.StringUtils;
import org.xs.techblog.modules.manage.entity.User;
import org.xs.techblog.modules.manage.service.UserService;

/**
 * 用户Controller
 */
@Controller
@RequestMapping("m/u")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 编辑列表
	 */
	@RequestMapping("list")
	public String mlist(HttpServletRequest request) throws Exception {
		return mlist(1, request);
	}
	
	/**
	 * 编辑列表
	 */
	@RequestMapping("list/{pageNo}")
	public String mlist(@PathVariable("pageNo") int pageNo, HttpServletRequest request) throws Exception {
		
		request.setAttribute("pageUserList", userService.getListPage(new Page<User>(pageNo), Order.desc("createDate")));
		return "modules/manage/user/userList";
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping("e")
	public String edit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return edit(null, request, response);
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping("e/{id}")
	public String edit(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(!StringUtils.isEmpty(id)) {
			User userInfo= userService.getById(id);
			request.setAttribute("userInfo", userInfo);
		}
		
		return "modules/manage/user/userEdit";
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("s")
	public String save(User userInfo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(userInfo != null) {
			if(StringUtils.isEmpty(userInfo.getId())) {
				userService.add(userInfo);
			} else {
				userService.update(userInfo);
			}
		}
		
		return "redirect:/m/u/list";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("d/{id}")
	public String delete(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(!StringUtils.isEmpty(id)) {
			userService.deleteById(id);
		}
		
		return "redirect:/m/u/list";
	}
	
	/**
	 * 登录页
	 */
	@RequestMapping("login")
	public String login() throws Exception {
		return "modules/manage/user/userLogin";
	}
	
	/**
	 * 登录验证
	 */
	@RequestMapping("auth")
	public String auth(String loginName, String loginPwd) throws Exception {
		
		SecurityUtils.getSecurityManager().logout(SecurityUtils.getSubject());
		
		User user = userService.getByLoginName(loginName);
		if(user == null || !user.getLoginPwd().equals(loginPwd)) {
			return "redirect:/m/u/login";
		}
		
		UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getLoginPwd());
		Subject subject = SecurityUtils.getSubject();  
        subject.login(token);
		
		return "redirect:/d/m/list";
	}
}
