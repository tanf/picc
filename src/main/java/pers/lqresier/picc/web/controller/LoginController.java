package pers.lqresier.picc.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.service.LogService;
import pers.lqresier.picc.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController{
	private Logger logger= LoggerFactory.getLogger(LoginController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private LogService logService;
	
	/**
	 * 登录
	 * 登录成功，把user放入session中
	 * @return
	 */
	@RequestMapping("login")
	public String login(@RequestParam("user.username")String username,@RequestParam("user.password")String password,HttpServletRequest request,HttpSession session) {
		User user=(User) session.getAttribute("user");
		if(user==null) {
			try{
				user=userService.login(username, password);
			}catch(Exception e){
				logger.debug("登录查询失败");
				logger.error("登录查询失败");
			}
			if(user==null) {
				//用户名或密码错误
				String errorMessage="用户名或密码错误,请重新登录";
				request.setAttribute("errorMessage", errorMessage);
				return "login.html";
			}
			session.setAttribute("user", user);
			try{
				logService.addLog(user, "登录模块", "login", null);
			}catch (Exception e){
				logger.debug("登录：添加日志失败");
				logger.error("登录：添加日志失败");
			}
		}
		if(user.getRole()==0) {
			//出单人员
			//跳转到前台页面
			return "system/individual.html";
		}else if(user.getRole()==1) {
			//保险公司管理员
			//跳转到后台页面
			return "system/main";
		}else {
			//景区管理人员
			//跳转到后台页面
			return "system/main.html";
		}
	}
	
	/**
	 * 登出
	 * 将session销毁
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		//将session销毁
		session.invalidate();
		//跳转到登录界面
		return "/";
	}
}
