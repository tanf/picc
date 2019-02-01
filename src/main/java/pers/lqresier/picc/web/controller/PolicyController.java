package pers.lqresier.picc.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.lqresier.picc.condition.PolicyCondition;
import pers.lqresier.picc.condition.ProductCondition;
import pers.lqresier.picc.entity.Insurer;
import pers.lqresier.picc.entity.Policy;
import pers.lqresier.picc.entity.Product;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.exception.NoDocumentException;
import pers.lqresier.picc.exception.OutOfCancelTimeException;
import pers.lqresier.picc.exception.WebsiteCodeException;
import pers.lqresier.picc.exception.WebsiteNotFoundException;
import pers.lqresier.picc.service.PolicyService;
import pers.lqresier.picc.service.ProductService;
import pers.lqresier.picc.vo.PolicyVO;
import pers.lqresier.picc.vo.UserSaleVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/system/policy")
@Controller
public class PolicyController {
    private Logger logger = LoggerFactory.getLogger(PolicyController.class);
    @Autowired
    PolicyService policyService;
    @Autowired
    ProductService productService;

    /**
     * 出单
     *
     * @param custnum   人数
     * @param productId 产品id
     * @param cardTypes 证件类型集合
     * @param cardNums  证件号集合
     * @param names     姓名集合
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("addPolicy")
    public List<PolicyVO> addPolicy(@RequestParam("custnum") int custnum, @RequestParam("productId") String productId, @RequestParam("cardType") String cardTypes, @RequestParam("cardNum") String cardNums, @RequestParam("name") String names, HttpServletRequest request) {
        String[] cardTypeArr = cardTypes.split(",");
        String[] cardNumArr = cardNums.split(",");
        String[] nameArr = names.split(",");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //String tip = "未知错误";
        List<PolicyVO> voList = new ArrayList<PolicyVO>();
        for (int i = 0; i < custnum; i++) {
            Insurer insurer = new Insurer();
            insurer.setName(nameArr[i]);
            insurer.setCardType(cardTypeArr[i]);
            insurer.setCardCode(cardNumArr[i]);
            Policy policy = new Policy();
            policy.setUser(user);
            policy.setPolicyNum(custnum);
            Product product = new Product();
            product.setId(Integer.parseInt(productId));
            policy.setProduct(product);
            PolicyVO policyVo = new PolicyVO();
            try {
                policyVo = policyService.addPolicy(policy, insurer);
            } catch (WebsiteNotFoundException e) {
                logger.debug(nameArr[i] + "网点信息不全");
                logger.error(nameArr[i] + "网点信息不全");
                //tip = nameArr[i]+"网点信息不全,请联系管理员";
                policyVo.setTip("第" + (i + 1) + "位客户插入失败，原因：网点信息不全,请联系管理员");
            } catch (WebsiteCodeException e) {
                logger.debug(nameArr[i] + "网点地区号错误");
                logger.error(nameArr[i] + "网点地区号错误");
                //tip =nameArr[i]+"网点地区号错误,请联系管理员";
                policyVo.setTip("第" + (i + 1) + "位客户插入失败，原因：网点地区号错误,请联系管理员");
            } catch (NoDocumentException e) {
                logger.debug(nameArr[i] + "无单证可用");
                logger.error(nameArr[i] + "无单证可用");
//				tip =nameArr[i]+"无单证可用";
                policyVo.setTip("第" + (i + 1) + "位客户插入失败，原因：无单证可用,请联系管理员");
            } catch (Exception e) {
                logger.debug(nameArr[i] + "数据库繁忙");
                logger.error(nameArr[i] + "数据库繁忙");
//				tip =nameArr[i]+"数据库繁忙,请联系管理员";
                policyVo.setTip("第" + (i + 1) + "位客户插入失败，原因：数据库繁忙,请联系管理员");
            } finally {
                voList.add(policyVo);
            }
        }
        return voList;
    }

    /**
     * 退保985
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("cancelPolicy")
    public String cancelPolicy(@RequestParam("policyId") int id, HttpServletResponse response) {
        Policy policy = new Policy();
        policy.setId(id);
        boolean isSuccess = false;
        String tip = "";
        try {
            isSuccess = policyService.cancelPolicy(policy);
        } catch (OutOfCancelTimeException e) {
            isSuccess = false;
            tip = "已过退保时间，无法退保";
        } catch (Exception e1) {
            isSuccess = false;
            tip = "退保失败";
        }
        if (isSuccess) {
            return "{\"result\":true,\"tip\":\"" + tip + "\"}";
        } else {
            return "{\"result\":false,\"tip\":\"" + tip + "\"}";
        }
    }

    /**
     * 条件查询保单
     *
     * @param documentNo 单证流水号
     * @param policyNo   保单号
     * @param status     状态
     * @param startTime  起始时间
     * @param endTime    结束时间
     * @param request
     * @return
     */
    @RequestMapping("queryPolicyByCondition")
    public String queryPolicyByCondition(@RequestParam(value = "documentNo", required = false) String documentNo, @RequestParam(value = "policyNo", required = false) String policyNo,
                                         @RequestParam(value = "status", required = false) String status, @RequestParam(value = "start", required = false) String startTime,
                                         @RequestParam(value = "end", required = false) String endTime, HttpServletRequest request) {
        PolicyCondition policyCondition = new PolicyCondition();
        if (documentNo != null && !"".equals(documentNo)) {
            policyCondition.setDocumentNum(documentNo.trim());
        }
        if (policyNo != null && !"".equals(policyNo)) {
            policyCondition.setPolicyCode(policyNo.trim());
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        if (startTime != null && !"".equals(startTime.trim())) {
            Date date = null;
            try {
                date = sdf.parse(startTime.trim());
                policyCondition.setBeginTime(new Timestamp(date.getTime()));
            } catch (ParseException e) {
                logger.debug("PolicyCommand条件查询号段：字符串转日期错误");
                logger.error("PolicyCommand条件查询号段：字符串转日期错误");
            }
        }
        if (endTime != null && !"".equals(endTime.trim())) {
            Date date = null;
            try {
                date = sdf.parse(endTime.trim());
                policyCondition.setEndTime(new Timestamp(date.getTime()));
            } catch (ParseException e) {
                logger.debug("PolicyCommand条件查询号段：字符串转日期错误");
                logger.error("PolicyCommand条件查询号段：字符串转日期错误");
            }
        }
        if (status != null && !"".equals(status)) {
            policyCondition.setStatus(Integer.parseInt(status));
        }
        List<Policy> policys = null;
        try {
            policys = policyService.queryPolicyByPolicyCondition(policyCondition);
        } catch (Exception e) {
            logger.debug("条件查询保单失败");
            logger.error("条件查询保单失败");
        }
        request.setAttribute("policys", policys);
        return "system/policy/policy_tb.html";
    }

    /**
     * 添加数据到个人出单界面
     *
     * @param request
     * @return
     */
    @RequestMapping("toindividualPolicy")
    public String toindividualPolicy(HttpServletRequest request) {
        List<Product> products = null;
        try {
            products = productService.queryProductByProductCondition(new ProductCondition());
        } catch (Exception e) {
            logger.debug("添加数据到个人出单界面失败");
            logger.error("添加数据到个人出单界面失败");
        }
        request.setAttribute("products", products);
        return "";

    }

    /**
     * 添加保费数据到报表界面
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("get30Sales")
    public List<Double> get30Sales() {
        List<Double> saleList = null;
        try {
            saleList = policyService.get30Sales();
        } catch (Exception e) {
            logger.debug("获取30天的保费数据失败");
            logger.error("获取30天的保费数据失败");
        }
        return saleList;
    }

    /**
     * 获得各用户销售数
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("getUserSaleVOs")
    public List<UserSaleVO> getUserSaleVOs() {
        List<UserSaleVO> userSaleVOList = null;
        try {
            userSaleVOList = policyService.getUserSaleVOs();
        } catch (Exception e) {
            logger.debug("获得各用户销售数失败");
            logger.error("获得各用户销售数失败");
        }
        return userSaleVOList;
    }
}
