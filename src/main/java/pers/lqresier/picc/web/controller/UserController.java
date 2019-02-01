package pers.lqresier.picc.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.lqresier.picc.condition.UserCondition;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.service.LogService;
import pers.lqresier.picc.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.List;

@RequestMapping("/system/user")
@Controller
public class UserController{
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private LogService logService;

	/**
	 * 添加用户
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addUser")
	public String addUser(User user,HttpServletRequest request) {
		user.setCreateTime(new Timestamp(System.currentTimeMillis()));
		boolean isSuccess=false;
		try{
			isSuccess = userService.addUser(user);
		}catch (Exception e){
			isSuccess=false;
			logger.debug("添加用户失败");
			logger.error("添加用户失败");
		}
		if(isSuccess) {
			try{
				logService.addLog((User)request.getSession().getAttribute("user"), "用户管理", "add", "添加用户["+user.getName()+"]");
			}catch (Exception e){
				logger.debug("添加用户：添加日志失败");
				logger.error("添加用户：添加日志失败");
			}
			return "{\"result\":true,\"tip\":\"添加成功\"}";
		}else {
			return "{\"result\":false,\"tip\":\"添加失败\"}";
		}
	}

	/**
	 * 停用用户
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteUser")
	public String deleteUser(User user,HttpServletRequest request) {
		boolean isSuccess=false;
		try{
			isSuccess=userService.deleteUser(user);
		}catch (Exception e){
			isSuccess=false;
			logger.debug("停用用户失败");
			logger.error("停用用户失败");
		}
		if(!isSuccess) {
			request.setAttribute("tip", "停用失败");
		}else {
			String name=null;
			try {
				name= URLDecoder.decode(request.getQueryString().split("&")[2].split("=")[1],"utf-8");
			} catch (UnsupportedEncodingException e) {
				logger.debug("ProductCommand解码错误");
				logger.error("ProductCommand解码错误");
			}
			try{
				logService.addLog((User)request.getSession().getAttribute("user"), "用户管理", "del", "停用用户["+name+"]");
			}catch (Exception e){
				logger.debug("停用用户：添加日志失败");
				logger.error("停用用户：添加日志失败");
			}
			request.setAttribute("tip", "停用成功");
		}
		return "system/manage/user/user.html";// 返回一个指定的页面
	}
	
	/**
	 * 启用用户
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("openUser")
	public String openUser(User user,HttpServletRequest request) {
		boolean isSuccess=false;
		try{
			isSuccess=userService.openUser(user);
		}catch (Exception e){
			isSuccess=false;
			logger.debug("启用用户失败");
			logger.error("启用用户失败");
		}
		if(!isSuccess) {
			request.setAttribute("tip", "启用失败,请重试");
		}else {
			String name=null;
			try {
				name=URLDecoder.decode(request.getQueryString().split("&")[2].split("=")[1],"utf-8");
			} catch (UnsupportedEncodingException e) {
				logger.debug("ProductCommand解码错误");
				logger.error("ProductCommand解码错误");
			}
			try{
				logService.addLog((User)request.getSession().getAttribute("user"), "用户管理", "open", "启用用户["+name+"]");
			}catch (Exception e){
				logger.debug("启用用户：添加日志失败");
				logger.error("启用用户：添加日志失败");
			}
			request.setAttribute("tip", "启用成功");
		}
		return "system/manage/user/user.html";// 返回一个指定的页面
	}

	/**
	 * 修改用户
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updateUser")
	public String updateUser(User user,HttpServletRequest request) {
		boolean isSuccess=false;
		try{
			isSuccess=userService.updateUser(user);
		}catch (Exception e){
			isSuccess=false;
			logger.debug("修改用户失败");
			logger.error("修改用户失败");
		}
		if(isSuccess) {
			try{
				logService.addLog((User)request.getSession().getAttribute("user"), "用户管理", "update", "修改用户["+user.getName()+"]");
			}catch (Exception e){
				logger.debug("修改用户：添加日志失败");
				logger.error("修改用户：添加日志失败");
			}
			return "{\"result\":true,\"tip\":\"修改成功\"}";
		}else {
			return "{\"result\":false,\"tip\":\"修改失败\"}";
		}
	}

	/**
	 * 准备数据到【修改用户】界面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("toUpdateUser")
	public String toUpdateUser(@RequestParam()int userId, HttpServletRequest request) {
		User  user=null;
		try{
			user = userService.queryUserById(userId);
		}catch (Exception e){
			logger.debug("准备数据到【修改用户】界面失败");
			logger.error("准备数据到【修改用户】界面失败");
		}
		request.setAttribute("user", user);
		return "/system/manage/user/updateUser.jsp";
	}

	/**
	 * 条件查询用户
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("queryUserByCondition")
	public String queryUserByCondition(UserCondition userCondition,HttpServletRequest request) {
		// 按条件查询
		List<User> userList =null;
		try{
			userList = userService.queryUserByUserCondition(userCondition);
		}catch (Exception e){
			logger.debug("条件查询用户失败");
			logger.error("条件查询用户失败");
		}
		request.setAttribute("userList", userList);
		return "system/manage/user/queryUser.html";
	}

	/**
	 * 查询工号是否存在
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("isUsernameExist")
	public boolean isUsernameExist(HttpServletRequest request) {
		String username = request.getParameter("username");
		String id=request.getParameter("userId");
		boolean isExist = false;
		try{
			if (username != null && !"".equals(username.trim())) {
				if(id==null||"".equals(id)) {
					isExist = userService.isUsernameExist(username.trim(),null);
				}else {
					isExist = userService.isUsernameExist(username.trim(),Integer.parseInt(id));
				}
			}
		}catch (Exception e){
			isExist=true;
			logger.debug("查询工号是否存在失败");
			logger.error("查询工号是否存在失败");
		}
		return isExist;
	}
}
