package pers.lqresier.picc.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pers.lqresier.picc.condition.LogCondition;
import pers.lqresier.picc.entity.Log;
import pers.lqresier.picc.service.LogService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("/system/log")
@Controller
public class LogController{
	private Logger logger= LoggerFactory.getLogger(LogController.class);
	@Autowired
	private LogService logService;

	@RequestMapping("queryLogByCondition")
	public String queryLogByCondition(HttpServletRequest request) {
		List<Log> logList =null;
		try{
			logList = logService.queryLogByLogCondition(new LogCondition());
		}catch (Exception e){
			logger.debug("查询日志失败");
			logger.error("查询日志失败");
		}
		request.setAttribute("logList", logList);
		return "system/manage/loger/loger_tb.html";//WIFI:17136410917
	}
}
