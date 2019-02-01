package pers.lqresier.picc.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.lqresier.picc.entity.Organization;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.entity.Website;
import pers.lqresier.picc.service.LogService;
import pers.lqresier.picc.service.OrganizationService;
import pers.lqresier.picc.service.WebsiteService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@RequestMapping("/system/website")
@Controller
public class WebsiteController {
	private Logger logger = LoggerFactory.getLogger(WebsiteController.class);
	@Autowired
	private WebsiteService websiteService;
	@Autowired
	private OrganizationService organizationService;
	@Autowired
	private LogService logService;

	/**
	 * 修改网点信息
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("updateWebsite")
	public String updateWebsite(@RequestParam(value = "area.id",required = false)String websiteId, @RequestParam(value = "area.areaName",required = false)String websiteName, @RequestParam(value = "area.areaCode",required = false)String websiteCode,
								@RequestParam(value = "area.saleCode",required = false)String marketingChannelCode, @RequestParam(value = "area.belongtoUser",required = false)String salemanName, @RequestParam(value = "area.userTel",required = false)String salemanPhone,
								@RequestParam(value = "area.belongtoCode",required = false)String organizationId, HttpSession session) {
		Website website = new Website();
		Organization organization = new Organization();
		if (websiteName != null && !"".equals(websiteName)) {
			website.setName(websiteName);
		}
		if (websiteCode != null && !"".equals(websiteCode)) {
			website.setCode(websiteCode);
		}
		if (marketingChannelCode != null && !"".equals(marketingChannelCode)) {
			website.setMarketingChannelCode(marketingChannelCode);
		}
		if (salemanName != null && !"".equals(salemanName)) {
			website.setSalemanName(salemanName);
		}
		if (salemanPhone != null && !"".equals(salemanPhone)) {
			website.setSalemanPhone(salemanPhone);
		}
		if (organizationId != null && !"".equals(organizationId)) {
			organization.setId(Integer.parseInt(organizationId));
			website.setOrganization(organization);
		}
		boolean isSuccess=false;
		try{
			if (websiteId == null || "".equals(websiteId)) {
				// 没有网点信息，执行添加操作
				isSuccess=websiteService.addWebsiteInfo(website);
			} else {
				//执行更新操作
				website.setId(Integer.parseInt(websiteId));
				isSuccess=websiteService.updateWebsiteInfo(website);
			}
		}catch (Exception e){
			isSuccess=false;
			e.printStackTrace();
			logger.debug("修改网点信息失败");
			logger.error("修改网点信息失败");
		}
		if(isSuccess) {
			try{
				logService.addLog((User)session.getAttribute("user"), "网点管理", "update", "修改网点");
			}catch (Exception e){
				logger.debug("修改网点信息：添加日志失败");
				logger.error("修改网点信息：添加日志失败");
			}
			return "{\"result\":true,\"tip\":\"\"}";
		}else {
			return "{\"result\":false,\"tip\":\"修改失败\"}";
		}
	}

	/**
	 * 查询网点信息
	 * 
	 * @return
	 */
	@RequestMapping("queryWebsite")
	public String queryWebsite(HttpServletRequest request) {
		Website website =null;
		try{
			website = websiteService.queryWebsiteInfo();
		}catch (Exception e){
			logger.debug("查询网点信息失败");
			logger.error("查询网点信息失败");
		}
		String tip=request.getParameter("tip");
		if(tip!=null&&"updateSuccess".equals(tip)) {
			request.setAttribute("tip", "修改成功");
		}else {
			request.setAttribute("tip", tip);
		}
		request.setAttribute("website", website);
		if(tip!=null) {
			return "system/manage/area/showArea.html";
		}else {
			return "system/manage/area/showArea.html";
		}
	}

	/**
	 * 准备数据到【修改网点】页面
	 * 
	 * @return
	 */
	@RequestMapping("toUpdateWebsite")
	public String toUpdateWebsite(HttpServletRequest request) {
		String websiteId = request.getParameter("id");
		if (websiteId != null && !"".equals(websiteId)) {
			Website website =null;
			try{
				website = websiteService.queryWebsiteInfo();
			}catch (Exception e){
				logger.debug("准备数据到【修改网点】页面：查询网点信息失败");
				logger.error("准备数据到【修改网点】页面：查询网点信息失败");
			}
			request.setAttribute("website", website);
		}
		List<Organization> organizationList = organizationService.queryAll();
		if (organizationList != null) {
			request.setAttribute("organizationList", organizationList);
		}
		return "system/manage/area/updateArea.html";
	}
}
