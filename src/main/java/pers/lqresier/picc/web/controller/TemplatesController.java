package pers.lqresier.picc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("view")
@Controller
public class TemplatesController {

    @RequestMapping("system/main")
    public String systemMain(){
        return "system/main.html";
    }

    @RequestMapping("system/include/header")
    public String systemIncludeHeader(){
        return "system/include/header.html";
    }

    @RequestMapping("system/include/slider")
    public String systemIncludeSlider(){
        return "system/include/slider.html";
    }

    @RequestMapping("system/welcome")
    public String systemWelcome(){
        return "system/welcome.html";
    }

    @RequestMapping("system/policy/policy")
    public String systemPolicyPolicy(){
        return "system/policy/policy.html";
    }

    @RequestMapping("system/policy/policy_tb")
    public String systemPolicyPolicy_tb(){
        return "system/policy/policy_tb.html";
    }

    @RequestMapping("system/documag/docu")
    public String systemDocumagDocu(){
        return "system/documag/docu.html";
    }

    @RequestMapping("system/documag/addProdocu")
    public String systemDocumagAddProdocu(){
        return "system/documag/addProdocu.html";
    }

    @RequestMapping("system/documag/prodocu")
    public String systemDocumagProdocu(){
        return "system/documag/prodocu.html";
    }

    @RequestMapping("system/policy/report")
    public String systemPolicyReport(){
        return "system/policy/report.html";
    }

    @RequestMapping("system/documag/docucount/docucount")
    public String systemDocumagDocucountDocucount(){
        return "system/documag/docucount/docucount.html";
    }

    @RequestMapping("system/manage/user/user")
    public String systemManageUserUser(){
        return "system/manage/user/user.html";
    }

    @RequestMapping("system/manage/loger/loger")
    public String systemManageLogerLoger(){
        return "system/manage/loger/loger.html";
    }
}
