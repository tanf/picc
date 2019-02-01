package pers.lqresier.picc.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.lqresier.picc.condition.DocumentSegCondition;
import pers.lqresier.picc.condition.UserCondition;
import pers.lqresier.picc.entity.DocumentSeg;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.exception.DocumentSegIsExistException;
import pers.lqresier.picc.service.DocumentSegService;
import pers.lqresier.picc.service.LogService;
import pers.lqresier.picc.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RequestMapping("/system/documentSeg")
@Controller
public class DocumentSegController {
    private Logger logger = LoggerFactory.getLogger(DocumentSegController.class);
    @Autowired
    private DocumentSegService documentSegService;
    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;

    /**
     * 添加领取号段
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("addSeg")
    public String addSeg(@RequestParam("prodocu.proStart") String startNum, @RequestParam("prodocu.proEnd") String endNum, @RequestParam("documentCode") String documentCode, HttpSession session) {
        DocumentSeg documentSeg = new DocumentSeg();
        documentSeg.setBeginNum(startNum);
        documentSeg.setEndNum(endNum);
        documentSeg.setDocumentCode(documentCode);
        User allocator = (User) session.getAttribute("user");
        boolean isSuccess = false;
        String tip = "";
        try {
            isSuccess = documentSegService.addDocumentSeg(documentSeg, allocator);
        } catch (DocumentSegIsExistException e1) {
            tip = "号段重复，请确认后添加";
            isSuccess = false;
        } catch (Exception e) {
            logger.debug("添加领取号段失败");
            logger.error("添加领取号段失败");
            tip = "添加领取号段失败";
            isSuccess = false;
        }
        if (isSuccess) {
            try {
                logService.addLog((User) session.getAttribute("user"), "单证号段管理", "add", "添加单证号段[" + startNum + "-" + endNum + "]");
            } catch (Exception e) {
                logger.debug("添加领取号段：添加日志失败");
                logger.error("添加领取号段：添加日志失败");
            }
            return "{\"result\":true,\"tip\":\"\"}";
        } else {
            return "{\"result\":false,\"tip\":\"" + tip + "\"}";
        }
    }

    /**
     * 发放号段
     *
     * @return
     */
    @RequestMapping("provideSeg")
    public String provideSeg(@RequestParam("segId") int segId, @RequestParam("userId") int userId, @RequestParam("docugrant.docuStart") String startNum, @RequestParam("endNum") String endNum, HttpServletRequest request, HttpSession session) {
        User user = new User();//出单员
        user.setId(userId);
        User allocator = (User) session.getAttribute("user");
        boolean isSuccess;
        try {
            isSuccess = documentSegService.privodeDocument(segId, endNum, user, allocator);
        } catch (Exception e) {
            logger.debug("发放号段失败");
            logger.error("发放号段失败");
            isSuccess = false;
        }
        if (isSuccess) {
            try {
                logService.addLog((User) request.getSession().getAttribute("user"), "单证号段管理", "add", "发放号段[" + startNum + "-" + endNum + "]");
            } catch (Exception e) {
                logger.debug("发放号段：添加日志失败");
                logger.error("发放号段：添加日志失败");
            }
            request.setAttribute("tip", "发放成功");
        } else {
            request.setAttribute("tip", "发放失败");
        }
        return "/system/documentSeg/toAddDocument";
    }

    /**
     * 条件查询领取号段
     *
     * @return
     */
    @RequestMapping("querySegByCondition")
    public String querySegByCondition(@RequestParam(value = "beginTime",required = false) String beginTime, @RequestParam(value = "endTime",required = false) String endTime, @RequestParam(value = "status",required = false) String status, HttpServletRequest request) {
        DocumentSegCondition documentSegCondition = new DocumentSegCondition();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        if (beginTime != null && !"".equals(beginTime)) {
            Date date = null;
            try {
                date = sdf.parse(beginTime);
            } catch (ParseException e) {
                logger.debug("DocumentSegCommand条件查询号段：字符串转日期错误");
                logger.error("DocumentSegCommand条件查询号段：字符串转日期错误");
            }
            documentSegCondition.setBeginTime(new Timestamp(date.getTime()));
        }
        if (endTime != null && !"".equals(endTime)) {
            Date date = null;
            try {
                date = sdf.parse(endTime);
            } catch (ParseException e) {
                logger.debug("DocumentSegCommand条件查询号段：字符串转日期错误");
                logger.error("DocumentSegCommand条件查询号段：字符串转日期错误");
            }
            documentSegCondition.setEndTime(new Timestamp(date.getTime()));
        }
        if (status != null && !"".equals(status)) {
            documentSegCondition.setStatus(Integer.parseInt(status));
        }
        List<DocumentSeg> documentSegList = null;
        try {
            documentSegList = documentSegService.queryDocumentSegByDocumentSegCondition(documentSegCondition);
        } catch (Exception e) {
            logger.debug("条件查询领取号段失败");
            logger.error("条件查询领取号段失败");
        }
        request.setAttribute("documentSegList", documentSegList);
        return "system/documag/prodocutb";
    }

    /**
     * 通过id查询单证号段
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("queryDocumentSegById")
    public DocumentSeg queryDocumentSegById(@RequestParam("segId") int segId) {
        DocumentSeg documentSeg = null;
        try {
            documentSeg = documentSegService.querDocumentSegyById(segId);
        } catch (Exception e) {
            logger.debug("通过id查询单证号段失败");
            logger.error("通过id查询单证号段失败");
        }
        return documentSeg;
    }

    /**
     * 准备数据到【单证号段发放】界面
     *
     * @return
     */
    @RequestMapping("toAddDocument")
    public String toAddDocument(HttpServletRequest request) {
        // 查询出未使用完的号段
        DocumentSegCondition documentSegCondition = new DocumentSegCondition();
        documentSegCondition.setStatus(0);
        List<DocumentSeg> documentSegList =null;
        try{
            documentSegList = documentSegService.queryDocumentSegByDocumentSegCondition(documentSegCondition);
        }catch (Exception e){
            logger.debug("准备单证号段发放数据：查询单证号段失败");
            logger.error("准备单证号段发放数据：查询单证号段失败");
        }

        // 查询所有启用中的出单员
        UserCondition userCondition = new UserCondition();
        userCondition.setRole(0);
        userCondition.setStatus(1);
        List<User> userList =null;
        try{
            userList=userService.queryUserByUserCondition(userCondition);
        }catch (Exception e){
            logger.debug("准备单证号段发放数据：查询发放员失败");
            logger.error("准备单证号段发放数据：查询发放员失败");
        }
        if (documentSegList != null && documentSegList.size() != 0) {
            request.setAttribute("documentSegList", documentSegList);
        }
        if (userList != null && userList.size() != 0) {
            request.setAttribute("userList", userList);
        }
        String tip = request.getParameter("tip");
        if (tip != null) {
            request.setAttribute("tip", tip);
        }
        return "system/documag/adddocu.html";
    }
}
