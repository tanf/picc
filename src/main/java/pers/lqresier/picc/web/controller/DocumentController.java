package pers.lqresier.picc.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.lqresier.picc.condition.DocumentCondition;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.service.DocumentService;
import pers.lqresier.picc.service.LogService;
import pers.lqresier.picc.vo.DocumentSegVO;
import pers.lqresier.picc.vo.DocumentUseVO;
import pers.lqresier.picc.vo.DocumentVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Date;
import java.util.List;

@RequestMapping("/system/document")
@Controller
public class DocumentController {
    private Logger logger = LoggerFactory.getLogger(DocumentController.class);
    @Autowired
    private DocumentService documentService;
    @Autowired
    private LogService logService;

    /**
     * 修改单证
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("updateDocument")
    public String updateDocument(@RequestParam("doculost.lostStart") String beginNum, @RequestParam("doculost.lostEnd") String endNum, @RequestParam("doculost.status") int status, HttpSession session) {
        boolean isSuccess;
        try {
            isSuccess = documentService.updateBatchDocument(beginNum, endNum, status);
        } catch (Exception e) {
            logger.debug("批量修改单证失败");
            logger.error("批量修改单证失败");
            return "{\"result\":false,\"tip\":\"修改失败\"}";
        }
        if (isSuccess) {
            String statusStr = null;
            if (status == 2) {
                statusStr = "停用";
            } else if (status == 3) {
                statusStr = "作废";
            } else {
                statusStr = "丢弃";
            }
            try {
                if (beginNum == endNum) {
                    logService.addLog((User) session.getAttribute("user"), "单证管理", "update", "修改单证[" + beginNum + "]为" + statusStr);
                } else {
                    logService.addLog((User) session.getAttribute("user"), "单证管理", "update", "修改单证[" + beginNum + "-" + endNum + "]为" + statusStr);
                }
            } catch (Exception e) {
                logger.debug("批量修改单证:添加日志失败");
                logger.error("批量修改单证:添加日志失败");
            }
            return "{\"result\":true,\"tip\":\"修改成功\"}";
        } else {
            return "{\"result\":false,\"tip\":\"修改失败\"}";
        }
    }

    /**
     * 条件查询单证
     *
     * @return
     */
    @RequestMapping("queryDocumentVOByCondition")
    public String queryDocumentVOByCondition(DocumentCondition documentCondition, HttpServletRequest request) {
        List<DocumentVO> documentVOList = null;
        try {
            documentVOList = documentService.queryDocumentVoByDocumentCondition(documentCondition);
        } catch (Exception e) {
            logger.debug("单证条件查询失败");
            logger.error("单证条件查询失败");
        }
        request.setAttribute("documentVOList", documentVOList);
        return "system/documag/docutb.html";
    }

    /**
     * 查询异常号段
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("queryDocumentSegVO")
    public List<DocumentSegVO> queryDocumentSegVO(@RequestParam("beginNum") String beginNum, @RequestParam("endNum") String endNum, @RequestParam("status") int status) {
        List<DocumentSegVO> segVOList = null;
        try {
            segVOList = documentService.queryDocumentSegVO(beginNum, endNum, status);
        } catch (Exception e) {
            logger.debug("查询异常号段失败");
            logger.error("查询异常号段失败");
        }
        return segVOList;
    }

    /**
     * 将数据转到修改页面
     *
     * @param request
     * @return
     */
    @RequestMapping("toUpdate")
    public String toUpdate(HttpServletRequest request) {
        String queryString = request.getQueryString();
        String allocatorName = queryString.split("&")[1].split("=")[1];
        String userName = queryString.split("&")[2].split("=")[1];
        String beginNum = queryString.split("&")[3].split("=")[1];
        String endNum = queryString.split("&")[4].split("=")[1];
        String nextNum = queryString.split("&")[5].split("=")[1];
        String allotTime = queryString.split("&")[6].split("=")[1];
        try {
            request.setAttribute("allocatorName", URLDecoder.decode(allocatorName, "utf-8"));
            request.setAttribute("userName", URLDecoder.decode(userName, "utf-8"));
            request.setAttribute("beginNum", URLDecoder.decode(beginNum, "utf-8"));
            request.setAttribute("endNum", URLDecoder.decode(endNum, "utf-8"));
            request.setAttribute("nextNum", URLDecoder.decode(nextNum, "utf-8"));
            request.setAttribute("allotTime", URLDecoder.decode(allotTime, "utf-8"));
        } catch (UnsupportedEncodingException e) {
            logger.debug("DocumentCommand解码错误");
            logger.error("DocumentCommand解码错误");
        }
        return "/system/documag/update.jsp";
    }


    /**
     * 单证按日期查询使用情况
     *
     * @param request
     * @return
     */
    @RequestMapping("queryUseDate")
    public String queryUseDate(HttpServletRequest request) {
        String date = request.getParameter("date");
        List<DocumentUseVO> day = null;
        List<DocumentUseVO> month = null;
        List<DocumentUseVO> year = null;
        try {
            if (date != null && !"".equals(date)) {
                day = documentService.queryData("%Y%m%d", date);
            } else {
                month = documentService.queryData("%Y%m", new Date(System.currentTimeMillis()).toString());
                year = documentService.queryData("%Y", new Date(System.currentTimeMillis()).toString());
            }
        } catch (Exception e) {
            logger.debug("单证按日期查询使用情况失败");
            logger.error("单证按日期查询使用情况失败");
        }
        if (date != null && !"".equals(date)) {
            request.setAttribute("day", day);
        } else {
            request.setAttribute("month", month);
            request.setAttribute("year", year);
        }
        return "system/documag/docucount/docuCounttb.html";
    }
}
