package org.xs.techblog.modules.manage.security;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xs.techblog.common.utils.ContextUtils;
import org.xs.techblog.modules.manage.entity.User;
import org.xs.techblog.modules.manage.service.UserService;

/**
 * 安全认证实现类
 */
@Service
public class UserRealm extends AuthorizingRealm {

	/**
	 * 获取授权信息
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		//String currentUsername = (String) getAvailablePrincipal(principals);
		
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		info.addStringPermission("admin");
		
		return info;
	}

	/**
	 * 获取认证信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		
		UserService userService = ContextUtils.getBean(UserService.class);
		
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		
		String username = token.getUsername();  
        if (username != null && !"".equals(username)) {  
            User user = userService.getByLoginName(username);  
            if (user != null) {  
                return new SimpleAuthenticationInfo(user.getLoginName(), user.getLoginPwd(), getName());  
            }
        }
		return null;
	}
}
