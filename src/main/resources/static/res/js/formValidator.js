/**
* @file            formValidator.js
* @description     jQuery表单验证插件
* @author blog     http://www.cnblogs.com/know/
* @date            2011-10-15
**/
(function ($) {
    //验证initConfig配置对象数组
    var _jQuery_formValidator_initConfig_Array = null;
    //验证jQuery对象数组
    var _jQuery_formValidator_validJqObj_Array = null;
    //#region 验证对象
    $.formValidator =
    {
        //各种验证方式支持的标签类型
        sustainType: function (elem, setting) {
            var srcTag = elem.tagName;
            var stype = elem.type;
            switch (setting.validatetype) {
                case _validTypeEnum.InitValidator:
                    return true;
                case _validTypeEnum.InputValidator:
                    if (srcTag == _validTagEnum.INPUT || srcTag == _validTagEnum.TEXTAREA || srcTag == _validTagEnum.SELECT) {
                        return true;
                    } else {
                        return false;
                    }
                case _validTypeEnum.CompareValidator:
                    if (srcTag == _validTagEnum.INPUT || srcTag == _validTagEnum.TEXTAREA) {
                        if (stype == _validTagTypeEnum.checkbox || stype == _validTagTypeEnum.radio) {
                            return false;
                        } else {
                            return true;
                        }
                    }
                    return false;
                case _validTypeEnum.AjaxValidator:
                    if (stype == _validTagTypeEnum.text || stype == _validTagTypeEnum.textarea || stype == _validTagTypeEnum.file || stype == _validTagTypeEnum.password || stype == _validTagTypeEnum.select_one) {
                        return true;
                    } else {
                        return false;
                    }
                case _validTypeEnum.RegexValidator:
                    if (srcTag == _validTagEnum.INPUT || srcTag == _validTagEnum.TEXTAREA) {
                        if (stype == _validTagTypeEnum.checkbox || stype == _validTagTypeEnum.radio) {
                            return false;
                        } else {
                            return true;
                        }
                    }
                    return false;
                case _validTypeEnum.FunctionValidator:
                    return true;
            }
        },

        initConfig: function (controlOptions) {
            var settings =
		    {
		        debug: false,//是否是调试模式
		        validatorgroup: "1",//验证组
		        alertmessage: false,//是否直接弹出验证提示
		        validobjectids: "",//验证对象集合
		        focusvalid: false,
		        onsuccess: function () { return true; }, //验证成功后的处理方法,返回true|false(可追加表单验证或阻止表单提交等)
		        onerror: function () { },
		        filterInputStrFun: function (str) { return FilterInputOper.FilterInputStr(str); }, //过虑输入字符串的方法[可设置]
		        isformpost: false, //是否是表单提交(默认：false——非表单提交,一般为ajax提交,true——表单提交)
		        submitonce: false,//是否验证通过后，表单立刻提交
		        submitbutton: null,//提交按钮id或对象
		        getformdata: null, //function (formdata) { } (验证通过后)获得输入的表单值——只有isformpost=false时，此方法才会被调用
		        //验证提示显示设置(default:默认根据设置)
		        tipshow: "default",
		        formid: "", //验证表单的id或对象
		        tidymode: false, //精简模式
		        errorfocus: true,
		        wideword: true,
		        //验证提示样式设置(全局)
		        tipcss:
		        {
		            //(ajax)加载处理
		            loadCss: "",
		            //获得焦点时的样式
		            focusCss: "",
		            //提示
		            noticeCss: "",
		            //成功
		            successCss: "",
		            //失败
		            errorCss: "",
		            //默认状态
		            defaultCss: ""
		        }
		    };
            controlOptions = controlOptions || {};
            controlOptions.tipcss = controlOptions.tipcss || {};
            //合并整个配置(深度拷贝)
            $.extend(true, settings, controlOptions);
            if (!settings.isformpost) {
                if (!settings.submitbutton) {
                    alert("submitbutton不能为空！");
                    return;
                }
                _GetJqObj(settings.submitbutton).click(function () {
                    var pageIsValid = $.formValidator.pageIsValid(settings.validatorgroup);
                    if (pageIsValid && _IsFunction(settings.getformdata)) {
                        var formData = _GetFormData(settings.filterInputStrFun);
                        settings.getformdata(formData);
                    }
                });
            }
            settings.tipshow = settings.tipshow || "default";
            //如果是精简模式，发生错误的时候，第一个错误的控件就不获得焦点
            if (settings.tidymode) {
                settings.errorfocus = false;
            }
            if (settings.formid) {
                _GetNodeById(settings.formid).submit(function () {
                    //如果不是表单提交，则阻止表单提交
                    return settings.isformpost ? $.formValidator.pageIsValid(settings.validatorgroup) : false;
                });
            }
            if (_jQuery_formValidator_initConfig_Array == null) {
                _jQuery_formValidator_initConfig_Array = new Array();
            }
            _jQuery_formValidator_initConfig_Array.push(settings);
        },
        //给指定的element对象的validator属性追加要进行的验证
        appendValid: function (eleObj, setting) {
            //如果是各种验证不支持的类型，就不追加到。返回-1表示没有追加成功
            if (!$.formValidator.sustainType(eleObj, setting))
                return -1;

            //初始化
            if (setting.validatetype == _validTypeEnum.InitValidator || eleObj.settings == undefined) {
                eleObj.settings = new Array();
            }
            var len = eleObj.settings.push(setting);
            var newIndex = len - 1;
            newIndex = newIndex >= 0 ? newIndex : 0;
            eleObj.settings[newIndex].index = newIndex;
            //返回新 追加验证对象的索引
            return newIndex;
        },
        //根据 validatorgroup 获得对应的 验证初始化配置对象initConfig
        getInitConfig: function (validatorgroup) {
            if (_jQuery_formValidator_initConfig_Array != null) {
                for (i = 0; i < _jQuery_formValidator_initConfig_Array.length; i++) {
                    if (validatorgroup == _jQuery_formValidator_initConfig_Array[i].validatorgroup) {
                        return _jQuery_formValidator_initConfig_Array[i];
                    }
                }
            }
            return null;
        },

        //触发每个控件上的各种验证
        triggerValidate: function (returnObj) {
            switch (returnObj.setting.validatetype) {
                case _validTypeEnum.InputValidator:
                    $.formValidator.inputValid(returnObj);
                    break;
                case _validTypeEnum.CompareValidator:
                    $.formValidator.compareValid(returnObj);
                    break;
                case _validTypeEnum.AjaxValidator:
                    $.formValidator.ajaxValid(returnObj);
                    break;
                case _validTypeEnum.RegexValidator:
                    $.formValidator.regexValid(returnObj);
                    break;
                case _validTypeEnum.FunctionValidator:
                    $.formValidator.functionValid(returnObj);
                    break;
                default: break;
            }
        },

        //设置提示信息
        setTipState: function (elem, showCssEnum, showmsg) {
            var setting0 = elem.settings[0];
            var initConfig = $.formValidator.getInitConfig(setting0.validatorgroup);
            if (initConfig.alertmessage && showmsg) {
                alert(showmsg);
                return
            }
            var jq_tipObj = setting0.tipJqObj;
            var tip_IsNull = Object.isNull(jq_tipObj);
            if (!tip_IsNull) {
                showmsg = showmsg || "";
                if (initConfig.tidymode) {
                    //保存提示信息
                    elem.Tooltip = showmsg;
                    if (showCssEnum != _tipCssEnum.errorCss && showCssEnum != _tipCssEnum.noticeCss)
                        jq_tipObj.hide();
                }
                jq_tipObj.removeClass();
                //设置提示样式
                var showClass = setting0.tipcss[showCssEnum];
                //如果 noticeCss未设置，则使用 errorCss
                if (String.isNullOrEmpty(showClass) && showCssEnum == _tipCssEnum.noticeCss) {
                    showCssEnum = _tipCssEnum.errorCss;
                    showClass = setting0.tipcss[showCssEnum];
                }
                if (!String.isNullOrEmpty(showClass)) {
                    //保存 当前提示标签 显示的样式(枚举值)
                    elem.showcssenum = showCssEnum;
                    jq_tipObj.addClass(showClass);
                }
                jq_tipObj.html(showmsg);
            }
        },

        //重置提示信息
        resetTipState: function (validatorgroup) {
            var initConfig = $.formValidator.getInitConfig(validatorgroup);
            $(initConfig.validobjectids).each(function () {
                $.formValidator.setTipState(this, _tipCssEnum.defaultCss, this.settings[0].onshow);
            });
        },

        //根据单个对象——显示提示信息和提示状态,正确:正确提示,错误:错误提示
        showMessage: function (returnObj) {
            var id = returnObj.id;
            var jqObj = _GetNodeById(id);
            var elem = _GetDomObj(jqObj);
            var setting = returnObj.setting; //正确:setting[0],错误:对应的setting[i]
            var isvalid = setting.isvalid;
            var showmsg = "", showCssEnum = "";
            if (!isvalid) {
                var settings = elem.settings;
                var intiConfig = $.formValidator.getInitConfig(settings[0].validatorgroup);

                showCssEnum = _tipCssEnum.errorCss;
                if (setting.validatetype == _validTypeEnum.AjaxValidator) {
                    if (setting.lastValid == "") {
                        showCssEnum = _tipCssEnum.loadCss;
                        showmsg = setting.onwait;
                    }
                    else {
                        showmsg = setting.onerror;
                    }
                }
                else {
                    showmsg = (String.isNullOrEmpty(returnObj.errormsg) ? setting.onerror : returnObj.errormsg);
                    //如果是 InputValidator,提示样式默认为：noticeCss
                    showCssEnum = setting.validatetype == _validTypeEnum.InputValidator ? _tipCssEnum.noticeCss : showCssEnum;
                }
                if (intiConfig.alertmessage) {
                    var isShowMeg = elem.validoldvalue == undefined;
                    isShowMeg = !isShowMeg ? (elem.validoldvalue != $(elem).val()) : isShowMeg;
                    if (isShowMeg)
                        alert(showmsg);
                }
                else {
                    $.formValidator.setTipState(elem, showCssEnum, showmsg);
                }
            }
            else {
                //验证成功后,如果没有设置成功提示信息,则给出默认提示,否则给出自定义提示;允许为空,值为空的提示
                showmsg = $.formValidator.isEmpty(jqObj) ? setting.onempty : setting.oncorrect;
                $.formValidator.setTipState(elem, _tipCssEnum.successCss, showmsg);
            }
            return showmsg;
        },

        //显示ajax验证提示信息
        showAjaxMessage: function (returnObj) {
            var elem = _GetNodeById(returnObj.id, true);
            //如果 验证标签的 值发生改变，则再次ajax验证
            var isdoAjaxValid = elem.validoldvalue == undefined;
            isdoAjaxValid = !isdoAjaxValid ? (elem.validoldvalue != $(elem).val()) : isdoAjaxValid;
            if (isdoAjaxValid) {
                $.formValidator.ajaxValid(returnObj);
            }
            else {
                var setting = returnObj.setting;
                if (setting.isvalid != undefined && !setting.isvalid) {
                    elem.lastshowcssenum = _tipCssEnum.errorCss;
                    elem.lastshowmsg = setting.onerror;
                }
                $.formValidator.setTipState(elem, elem.lastshowcssenum, elem.lastshowmsg);
            }
        },

        //获取指定字符串的长度
        getLength: function (jqObj) {
            var elem = _GetDomObj(jqObj);
            var sType = elem.type;
            var len = 0;
            switch (sType) {
                case _validTagTypeEnum.text:
                case _validTagTypeEnum.hidden:
                case _validTagTypeEnum.password:
                case _validTagTypeEnum.textarea:
                case _validTagTypeEnum.file:
                    var val = jqObj.val();
                    var initConfig = $.formValidator.getInitConfig(elem.settings[0].validatorgroup);
                    len = initConfig.wideword ? String.getCharLength(val) : val.length;
                    break;
                case _validTagTypeEnum.checkbox:
                case _validTagTypeEnum.radio:
                    len = $("input[type='" + sType + "'][name='" + jqObj.attr("name") + "']:checked").length;
                    break;
                case _validTagTypeEnum.select_one:
                case _validTagTypeEnum.select_multiple:
                    len = jqObj.children(":selected").length;
                    break;
            }
            return len;
        },

        //结合empty这个属性，判断仅仅是否为空的验证情况。
        isEmpty: function (jqObj) {
            if (_GetDomObj(jqObj).settings[0].empty && $.formValidator.getLength(jqObj) == 0) {
                return true;
            } else {
                return false;
            }
        },

        //对外调用：判断单个表单元素是否验证通过，不带回调函数
        isOneValid: function (id) {
            var domObj = _GetNodeById(id, true);
            var validObj = $.formValidator.oneIsValid(domObj, 1);
            return validObj == null ? false : validObj.isvalid;
        },

        //判断单个验证标签对象是否验证通过,正确返回settings[0],错误返回对应的settings[i]
        oneIsValid: function (elem, index) {
            var returnObj = new Object();
            returnObj.id = elem.id;
            returnObj.ajax = -1; //ajax验证在settings中的索引
            returnObj.showCssEnum = "";
            returnObj.errormsg = ""; //自定义错误信息

            var settings = elem.settings;
            var settingslen = settings.length;
            //只有一个formValidator的时候不检验[settings[0]对应的是formValidator]
            if (settingslen == 1) {
                settings[0].bind = false;
            }
            if (!settings[0].bind) {
                return null;
            }

            if ($.formValidator.isEmpty($(elem))) {
                returnObj.setting = settings[0];
                returnObj.setting.isvalid = true;
            }
            else {
                var unvalidIndex = 0;
                for (var i = 1; i < settingslen; i++) {
                    returnObj.setting = settings[i];
                    if (settings[i].validatetype != _validTypeEnum.AjaxValidator) {
                        $.formValidator.triggerValidate(returnObj);
                    } else {
                        returnObj.ajax = i;
                    }
                    //如果验证不通过，则跳出
                    if (!settings[i].isvalid) {
                        unvalidIndex = i;
                        returnObj.setting = settings[i];
                        returnObj.setting.isvalid = false;
                        break;
                    }
                }
                if (unvalidIndex == 0) {
                    returnObj.setting = settings[0];
                    returnObj.setting.isvalid = true;
                }
            }
            return returnObj;
        },

        //验证所有需要验证的对象，并返回是否验证成功。
        pageIsValid: function (validatorgroup) {
            validatorgroup = validatorgroup ? validatorgroup.toString() : "1";
            var isvalid = true;
            var thefirstid = "", thefirsterrmsg = "";
            var returnObj;

            var initConfig = $.formValidator.getInitConfig(validatorgroup);
            var jqObjs = $(initConfig.validobjectids);
            jqObjs.each(function (i, elem) {
                //如果验证对象bind=true :需要验证
                if (elem.settings[0].bind) {
                    returnObj = $.formValidator.oneIsValid(elem, 1);
                    if (returnObj) {
                        //验证失败,获取第一个发生错误的信息和ID
                        if (!returnObj.setting.isvalid) {
                            isvalid = false;
                            if (thefirstid == "") {
                                thefirstid = returnObj.id;
                                thefirsterrmsg = (returnObj.errormsg == "" ? returnObj.setting.onerror : returnObj.errormsg)
                            }
                        }
                        //显示验证提示
                        if (!initConfig.alertmessage) {
                            $.formValidator.showMessage(returnObj);
                        }
                    }
                }
            });
            //成功或失败后，进行回调函数的处理，以及成功后的禁用提交按钮的功能
            if (isvalid) {
                isvalid = initConfig.onsuccess();
                //如果只提交一次，则 提交时 禁用提交按钮
                if (initConfig.submitonce) {
                    var btnObj = (initConfig.submitbutton && initConfig.submitbutton.length > 0) ? initConfig.submitbutton :
                    $("form" + (initConfig.formid == "" ? "" : "#" + initConfig.formid)).find("input[type='submit']");
                    if (!Object.isNull(btnObj))
                        btnObj.attr("disabled", true);
                }
            }
            else {
                var obj = _GetNodeById(thefirstid, true);
                //执行initConfig.onerror 方法
                initConfig.onerror(thefirsterrmsg, obj);
                if (thefirstid != "" && initConfig.errorfocus) {
                    _GetNodeById(thefirstid).focus();
                }
            }
            return !initConfig.debug && isvalid;
        },

        //ajax验证
        ajaxValid: function (returnObj) {
            var id = returnObj.id;
            var srcjo = _GetNodeById(id);
            var elem = _GetDomObj(srcjo);
            var settings = elem.settings;
            var setting = settings[returnObj.ajax];
            if (srcjo.size() == 0 && settings[0].empty) {
                returnObj.setting = settings[0];
                $.formValidator.showMessage(returnObj);
                setting.isvalid = true;
                return;
            }

            setting.data = Object.isNull(setting.data) ? {} : setting.data;
            //添加要验证的表单元素 参数信息
            setting.data[id] = encodeURIComponent(srcjo.val());
            var paramsData = $.param(setting.data);
            $.ajax(
		    {
		        type: setting.type,
		        url: setting.url,
		        cache: setting.cache,
		        data: paramsData,
		        async: setting.async,
		        dataType: setting.datatype,
		        success: function (data) {
		            if (setting.success(data)) {
		                $.formValidator.setTipState(elem, _tipCssEnum.successCss, settings[0].oncorrect);
		                setting.isvalid = true;
		            }
		            else {
		                $.formValidator.setTipState(elem, _tipCssEnum.errorCss, setting.onerror);
		                setting.isvalid = false;
		            }
		        },
		        complete: function () {
		            if (setting.buttons && setting.buttons.length > 0) {
		                _GetJqObj(setting.buttons).attr({ "disabled": false });
		            }
		            _InvokeFun([setting.complete]);
		        },
		        beforeSend: function (xhr) {
		            //再服务器没有返回数据之前，先禁用提交按钮
		            if (setting.buttons && setting.buttons.length > 0) {
		                _GetJqObj(setting.buttons).attr({ "disabled": true });
		            }
		            var isvalid = setting.beforesend(xhr);
		            if (isvalid) {
		                setting.isvalid = false;
		                $.formValidator.setTipState(elem, _tipCssEnum.loadCss, setting.onwait);
		            }
		            setting.lastValid = "-1";
		            return isvalid;
		        },
		        error: function () {
		            $.formValidator.setTipState(elem, _tipCssEnum.errorCss, setting.onerror);
		            setting.isvalid = false;
		            _InvokeFun([setting.error]);
		        },
		        processData: setting.processdata
		    });
        },

        //对正则表达式进行验证（目前只针对input和textarea）
        regexValid: function (returnObj) {
            var id = returnObj.id;
            var setting = returnObj.setting;
            var jqObj = _GetNodeById(id);
            var elem = _GetDomObj(jqObj);
            var srcTag = elem.tagName;
            var elemVal = jqObj.val();
            if (elem.settings[0].empty && elemVal == "") {
                setting.isvalid = true;
            }
            else {
                var regexpress = setting.regexp;
                if (setting.datatype == "enum") { regexpress = eval("regexEnum." + regexpress); }
                //如果 regexpress为空，则不验证
                if (String.isNullOrEmpty(regexpress)) {
                    setting.isvalid = true;
                    return;
                }
                setting.isvalid = (new RegExp(regexpress, setting.param)).test(elemVal);
            }
        },

        //函数验证。返回true/false表示验证是否成功;返回字符串表示错误信息，验证失败;如果没有返回值表示处理函数，验证成功
        functionValid: function (returnObj) {
            var id = returnObj.id;
            var setting = returnObj.setting;
            var srcjo = _GetNodeById(id);
            var lb_ret = setting.fun(srcjo.val(), _GetDomObj(srcjo));
            if (lb_ret != undefined) {
                if (typeof lb_ret == "string") {
                    setting.isvalid = false;
                    returnObj.errormsg = lb_ret;
                } else {
                    setting.isvalid = lb_ret;
                }
            }
        },

        //对input和select类型控件进行验证
        inputValid: function (returnObj) {
            var id = returnObj.id;
            var setting = returnObj.setting;
            var srcjo = _GetNodeById(id);
            var elem = _GetDomObj(srcjo);
            var val = srcjo.val();
            var sType = elem.type;
            var len = $.formValidator.getLength(srcjo);
            var empty = setting.empty;
            var emptyerror = false, ischeckempty = false;
            switch (sType) {
                case sType:
                    {
                        ischeckempty = !Object.isNull(empty);
                        if (ischeckempty && empty.emptyvalue != null) {
                            if (empty.emptyvalue == val) {
                                setting.isvalid = false;
                                returnObj.errormsg = empty.emptyerror;
                                _GetInputValidErrorMes(returnObj);
                                break;
                            }
                        }
                    }
                case _validTagTypeEnum.text:
                case _validTagTypeEnum.hidden:
                case _validTagTypeEnum.password:
                case _validTagTypeEnum.textarea:
                case _validTagTypeEnum.file:
                    {
                        //检查 文本输入标签的 输入是否为空
                        if (setting.type == "size") {
                            if (ischeckempty) {
                                if (!empty.leftempty) {
                                    emptyerror = (val.replace(/^[ \s]+/, '').length != val.length);
                                }
                                if (!emptyerror && !empty.rightempty) {
                                    emptyerror = (val.replace(/[ \s]+$/, '').length != val.length);
                                }
                            }
                        }
                    }
                case _validTagTypeEnum.checkbox:
                case _validTagTypeEnum.select_one:
                case _validTagTypeEnum.select_multiple:
                case _validTagTypeEnum.radio:
                    {
                        var lb_go_on = false;
                        if (sType == _validTagTypeEnum.select_one || sType == _validTagTypeEnum.select_multiple) {
                            setting.type = "size";
                        }
                        var type = setting.type;
                        if (type == "size") {		//获得输入的字符长度，并进行验证
                            if (!emptyerror) { lb_go_on = true; }
                            if (lb_go_on) { val = len; }
                        }
                        else if (type == "date" || type == "datetime") {
                            var isok = false;
                            if (type == "date") {
                                lb_go_on = _IsDate(val);
                            }
                            else {
                                lb_go_on = _IsDateTime(val);
                            }
                            if (lb_go_on) {
                                val = new Date(val);
                                setting.min = new Date(setting.min);
                                setting.max = new Date(setting.max);
                            }
                        }
                        else {
                            var stype = (typeof setting.min);
                            if (stype == "number") {
                                val = (new Number(val)).valueOf();
                                if (!isNaN(val)) {
                                    lb_go_on = true;
                                }
                            }
                            else if (stype == "string") {
                                lb_go_on = true;
                            }
                        }

                        setting.isvalid = false;
                        if (lb_go_on) {
                            if (val < setting.min || val > setting.max) {
                                if (val < setting.min && setting.onerrormin) {
                                    returnObj.errormsg = setting.onerrormin;
                                }
                                else if (val > setting.max && setting.onerrormax) {
                                    returnObj.errormsg = setting.onerrormax;
                                }
                            }
                            else {
                                setting.isvalid = true;
                            }
                        }
                        _GetInputValidErrorMes(returnObj);
                        break;
                    }
            }
        },

        //比较验证
        compareValid: function (returnObj) {
            var id = returnObj.id;
            var setting = returnObj.setting;
            var srcjo = _GetNodeById(id);
            var desjo = _GetNodeById(setting.desid);
            var ls_datatype = setting.datatype;
            setting.isvalid = false;
            var curvalue = srcjo.val();
            var ls_data = desjo.val();
            if (ls_datatype == "number") {
                if (!isNaN(curvalue) && !isNaN(ls_data)) {
                    curvalue = parseFloat(curvalue);
                    ls_data = parseFloat(ls_data);
                }
                else {
                    return;
                }
            }
            else if (ls_datatype == "date" || ls_datatype == "datetime") {
                var isok = false;
                if (ls_datatype == "date") {
                    isok = (_IsDate(curvalue) && _IsDate(ls_data));
                }
                else {
                    isok = (_IsDateTime(curvalue) && _IsDateTime(ls_data));
                }
                if (isok) {
                    curvalue = new Date(curvalue);
                    ls_data = new Date(ls_data)
                }
                else {
                    return;
                }
            }

            switch (setting.operateor) {
                case "=":
                    setting.isvalid = (curvalue == ls_data);
                    break;
                case "!=":
                    setting.isvalid = (curvalue != ls_data);
                    break;
                case ">":
                    setting.isvalid = (curvalue > ls_data);
                    break;
                case ">=":
                    setting.isvalid = (curvalue >= ls_data);
                    break;
                case "<":
                    setting.isvalid = (curvalue < ls_data);
                    break;
                case "<=":
                    setting.isvalid = (curvalue <= ls_data);
                    break;
                default: return;
            }
        },

        //释放资源
        dispose: function () {
            _jQuery_formValidator_initConfig_Array = null;
            _jQuery_formValidator_validJqObj_Array = null;
        }
    };
    //#endregion

    //#region 验证方法
    //每个验证控件必须初始化的
    $.fn.formValidator = function (option) {
        var setting =
	    {
	        tipid: "", //提示标签id或对象
	        validatorgroup: "1",
	        empty: false,
	        automodify: false,
	        onshow: "",
	        onfocus: "",
	        oncorrect: "",
	        onempty: "",
	        defaultvalue: null,
	        bind: true,
	        //此对象中的属性继承(extend)其对应的initConfig.tipcss的属性
	        tipcss:
		    {
		        //(ajax)加载处理
		        loadCss: "",
		        //获得焦点时的样式
		        focusCss: "",
		        //提示
		        noticeCss: "",
		        //成功
		        successCss: "",
		        //失败
		        errorCss: "",
		        //默认状态
		        defaultCss: ""
		    },
	        triggerevent: "blur",
	        focusvalid: false  //是否验证失败，(强制)验证标签获得焦点
	    };
        option = option || {};
        option.tipcss = option.tipcss || {};
        option.validatorgroup = option.validatorgroup || "1";
        //获取该验证组的全局配置信息
        var initConfig = $.formValidator.getInitConfig(option.validatorgroup);

        //#region 先合并整个配置(深度拷贝)
        var clone_initConfig_tipcss = {};
        $.extend(true, clone_initConfig_tipcss, initConfig.tipcss);
        $.extend(true, clone_initConfig_tipcss, option.tipcss);
        option.tipcss = clone_initConfig_tipcss;
        $.extend(true, setting, option);
        //#endregion
        //设置验证类型
        setting.validatetype = _validTypeEnum.InitValidator;
        var validJqObj = this;
        if (!initConfig.alertmessage && initConfig.tipshow == "default" && !setting.tipid) {
            alert("【selector:" + validJqObj.selector + "】的tipid设置为空或错误！");
            return;
        }
        //#region 将验证对象添加到全局对象中
        //将验证对象添加到_jQuery_formValidator_validJqObj_Array数组中
        !_jQuery_formValidator_validJqObj_Array && (_jQuery_formValidator_validJqObj_Array = new Array());
        _jQuery_formValidator_validJqObj_Array.push(validJqObj);
        //#endregion

        return validJqObj.each(function (e) {
            var jqobj = $(this);
            //如果验证标签id为空，则自动生成id
            if (String.isNullOrEmpty(this.id)) {
                this.id = _GetElemAutoId();
            }
            var tipjq = _GetTipJqObj(initConfig.tipshow, setting.tipid, validJqObj);
            setting.tipJqObj = tipjq;
            //每个控件都要保存这个配置信息
            if ($.formValidator.appendValid(this, setting) == -1) {
                return;
            }
            //保存控件ID
            var validobjectids = initConfig.validobjectids;
            //如果控件ID已存在，则 重命名id
            if (validobjectids.indexOf(("#" + this.id + ",")) > -1) {
                this.id = _GetElemAutoId();
            }
            initConfig.validobjectids = (validobjectids == "" ? ("#" + this.id + ",") : validobjectids + ("#" + this.id + ","));

            //初始化显示信息
            $.formValidator.setTipState(this, _tipCssEnum.defaultCss, setting.onshow);

            var srcTag = this.tagName.toUpperCase();
            var stype = this.type;
            var defaultval = setting.defaultvalue;
            //设置默认值
            if (defaultval) {
                jqobj.val(defaultval);
            }

            if (srcTag == _validTagEnum.INPUT || srcTag == _validTagEnum.TEXTAREA) {
                //注册获得焦点的事件。改变提示对象的文字和样式，保存原值
                if (setting.onfocus !== false && setting.triggerevent.toLowerCase() != "focus") {
                    jqobj.focus(function () {
                        if (!initConfig.alertmessage) {
                            //保存原来的状态
                            this.lastshowcssenum = this.showcssenum;
                            this.lastshowmsg = tipjq.html();
                            $.formValidator.setTipState(this, _tipCssEnum.focusCss, setting.onfocus);
                        }
                        if (stype == _validTagTypeEnum.password || stype == _validTagTypeEnum.text || stype == _validTagTypeEnum.textarea || stype == _validTagTypeEnum.file) {
                            this.validoldvalue = jqobj.val();
                        }
                    });
                }
                //注册 验证触发(默认为：失去焦点) 事件。进行验证，改变提示对象的文字和样式；出错就提示处理
                jqobj.bind(setting.triggerevent, function () {
                    if (this.type == _validTagTypeEnum.text || this.type == _validTagTypeEnum.textarea) {
                        //验证前 先 调用filterInputStrFun方法，过虑非法字符等处理
                        this.value = _IsFunction(initConfig.filterInputStrFun) ? initConfig.filterInputStrFun(this.value) : this.value;
                    }
                    var returnObj = $.formValidator.oneIsValid(this, 1);
                    if (returnObj == null) {
                        return;
                    }
                    //验证对象 的验证事件中存在Ajax验证，则显示ajax验证信息
                    if (returnObj.ajax >= 0) {
                        $.formValidator.showAjaxMessage(returnObj);
                    }
                    else {
                        var showmsg = $.formValidator.showMessage(returnObj);
                        if (!returnObj.setting.isvalid) {
                            //自动修正错误
                            var auto = setting.automodify && (this.type == _validTagTypeEnum.text || this.type == _validTagTypeEnum.textarea || this.type == _validTagTypeEnum.file);
                            if (auto) {
                                if (initConfig.alertmessage)
                                    alert(showmsg);
                                //$.formValidator.setTipState(this, _tipCssEnum.defaultCss, setting.onshow);
                            }
                            else {
                                if (initConfig.focusvalid || setting.focusvalid) {
                                    this.focus();
                                }
                            }
                        }
                    }
                });
            }
            else if (srcTag == _validTagEnum.SELECT) {
                //获得焦点
                jqobj.bind("focus", function () {
                    if (!initConfig.alertmessage) {
                        $.formValidator.setTipState(this, _tipCssEnum.focusCss, setting.onfocus);
                    }
                });
                //失去焦点
                jqobj.bind("blur", function () { jqobj.trigger("change") });
                //选择项目后触发
                jqobj.bind("change", function () {
                    var returnObj = $.formValidator.oneIsValid(this, 1);
                    if (returnObj == null) { return; }
                    if (returnObj.ajax >= 0) {
                        $.formValidator.showAjaxMessage(returnObj);
                    } else {
                        $.formValidator.showMessage(returnObj);
                    }
                });
            }
        });
    };

    //输入验证
    $.fn.inputValidator = function (controlOptions) {
        var settings =
	    {
	        isvalid: false,
	        min: 0,
	        max: 99999999999999,
	        //type属性可取的值：size|value|date|datetime
	        type: "size",
	        onerror: "",
	        empty: { leftempty: true, rightempty: true, emptyvalue: null, emptyerror: null },
	        onerrormin: null,
	        onerrormax: null,
	        wideword: true
	    };
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        //设置验证类型
        settings.validatetype = _validTypeEnum.InputValidator;
        return this.each(function () {
            $.formValidator.appendValid(this, settings);
        });
    };

    //比较验证
    $.fn.compareValidator = function (controlOptions) {
        var settings =
	    {
	        isvalid: false,
	        desid: "",
	        operateor: "=",
	        onerror: "输入错误"
	    };
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        //设置验证类型
        settings.validatetype = _validTypeEnum.CompareValidator;
        return this.each(function () {
            $.formValidator.appendValid(this, settings);
        });
    };

    //正则表达式验证
    $.fn.regexValidator = function (controlOptions) {
        var settings =
	    {
	        isvalid: false,
	        regexp: "",
	        param: "i",
	        datatype: "string", //可取值:string|enum
	        onerror: "输入的格式不正确"
	    };
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        //设置验证类型
        settings.validatetype = _validTypeEnum.RegexValidator;
        return this.each(function () {
            $.formValidator.appendValid(this, settings);
        });
    };

    //扩展方法验证
    $.fn.functionValidator = function (controlOptions) {
        var settings =
	    {
	        isvalid: true,
	        fun: function () { this.isvalid = true; },
	        validatetype: _validTypeEnum.FunctionValidator,
	        onerror: "输入错误"
	    };
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        //设置验证类型
        settings.validatetype = _validTypeEnum.FunctionValidator;
        return this.each(function () {
            $.formValidator.appendValid(this, settings);
        });
    };

    //ajax验证
    $.fn.ajaxValidator = function (controlOptions) {
        var settings =
	    {
	        isvalid: false,
	        lastValid: "",
	        type: "GET",
	        url: "",
	        datatype: "html",
	        data: "",
	        async: true,
	        cache: false,
	        beforesend: function () { return true; },
	        success: function () { return true; },
	        complete: function () { },
	        processdata: false,
	        error: function () { },
	        buttons: null, //需要禁用的按钮的id或jq对象
	        onerror: "服务器验证没有通过",
	        onwait: "正在等待服务器返回数据"
	    };
        controlOptions = controlOptions || {};
        $.extend(true, settings, controlOptions);
        //设置验证类型
        settings.validatetype = _validTypeEnum.AjaxValidator;
        return this.each(function () {
            $.formValidator.appendValid(this, settings);
        });
    };

    //设置验证对象默认通过验证的方法
    $.fn.defaultPassed = function (onshow) {
        return this.each(function () {
            var settings = this.settings, ls_style;
            for (var i = 1, len = settings.length; i < len; i++) {
                settings[i].isvalid = true;
                if (!$.formValidator.getInitConfig(settings[0].validatorgroup).alertmessage) {
                    ls_style = onshow ? _tipCssEnum.defaultCss : _tipCssEnum.successCss;
                    $.formValidator.setTipState(this, ls_style, settings[0].oncorrect);
                }
            }
        });
    };

    //设置验证对象是否通过验证的方法
    $.fn.unFormValidator = function (unbind) {
        return this.each(function () {
            this.settings[0].bind = !unbind;
            var tipJq = this.settings[0].tipJqObj;
            if (!Object.isNull(tipJq)) {
                tipJq.css("display", unbind ? "none" : "block");
            }
        });
    };
    //#endregion

    //#region 获得表单项值的相关方法
    function _GetFormData(filterStrFun) {
        var formDataObj = {};
        if (_jQuery_formValidator_validJqObj_Array != null) {
            var elemJqObj = null;
            filterStrFun = _IsFunction(filterStrFun) ? filterStrFun : false;
            for (var i = 0, length = _jQuery_formValidator_validJqObj_Array.length; i < length; i++) {
                elemJqObj = _jQuery_formValidator_validJqObj_Array[i];
                _GetElemVal(formDataObj, elemJqObj, filterStrFun);
            }
        }
        return formDataObj;
    }

    function _GetElemVal(formDataObj, jqObj, filterStrFun) {
        var elem = _GetDomObj(jqObj);
        var sTag = elem.tagName;
        var stype = elem.type;
        var key = "", val;
        switch (sTag) {
            case _validTagEnum.TEXTAREA:
                val = filterStrFun ? filterStrFun(jqObj.val()) : jqObj.val(); break;
            case _validTagEnum.INPUT:
                if (stype == _validTagTypeEnum.checkbox) {
                    var ckVal = new Array();
                    jqObj.each(function () {
                        if (this.checked)
                            ckVal.push(this.value);
                    });
                    key = jqObj.attr("name");
                    val = ckVal.join(",");
                }
                else if (stype == _validTagTypeEnum.radio) {
                    key = jqObj.attr("name");
                    val = jqObj.filter(":checked").val();
                    val = _GetValue(val);
                }
                else if (stype == _validTagTypeEnum.text || stype == _validTagTypeEnum.textarea || stype == _validTagTypeEnum.hidden) {
                    val = filterStrFun ? filterStrFun(jqObj.val()) : jqObj.val();
                }
                else {
                    val = jqObj.val();
                }
                break;
            case _validTagEnum.SELECT:
                val = jqObj.val().toString();
                val = _GetValue(val);
                break;
            default: break;
        }
        key = key == "" ? jqObj.attr("id") : key;
        if (key != "")
            formDataObj[key] = val;
    }

    //返回值(null或undefined的值，返回空字符串)
    function _GetValue(val) {
        if (val == null || val == undefined || val == "null" || val == "undefined")
            return "";
        return val;
    }
    //#endregion

    //#region 枚举对象
    //提示样式枚举
    var _tipCssEnum =
    {
        //(ajax)加载处理
        loadCss: "loadCss",
        //获得焦点时的样式
        focusCss: "focusCss",
        //提示[用于 为空提示] ---如果此项未设置，则使用errorCss
        noticeCss: "noticeCss",
        //失败or错误[用于格式错误，正则表达式验证]---必须设置
        errorCss: "errorCss",
        //成功---必须设置
        successCss: "successCss",
        //默认状态 ---必须设置
        defaultCss: "defaultCss"
    };

    //验证类型枚举
    var _validTypeEnum = {
        InitValidator: "InitValidator",
        InputValidator: "InputValidator",
        CompareValidator: "CompareValidator",
        AjaxValidator: "AjaxValidator",
        RegexValidator: "RegexValidator",
        FunctionValidator: "FunctionValidator"
    };

    //(支持)验证标签枚举
    var _validTagEnum = {
        INPUT: "INPUT",
        TEXTAREA: "TEXTAREA",
        SELECT: "SELECT"
    };

    //(支持)验证标签类型枚举
    var _validTagTypeEnum = {
        text: "text",
        hidden: "hidden",
        password: "password",
        textarea: "textarea",
        file: "file",
        checkbox: "checkbox",
        radio: "radio",
        select_one: "select-one",
        select_multiple: "select-multiple"
    };
    //#endregion

    //#region 辅助方法
    //获得验证对象的提示标签对象
    function _GetTipJqObj(tipshow, tipId, validJqObj) {
        switch (tipshow) {
                //根据tipId获得验证对象的提示标签对象 
            case "default": return _GetNodeById(tipId);
                //根据validJqObj获得验证对象的next
            case "next": return validJqObj.next();
                //自定义(标签筛选)方法
            default: return eval(validJqObj + "." + tipshow);
        }
    }

    //判断是否是短日期，形如 (2003-12-05)
    function _IsDate(str) {
        var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
        if (r == null)
            return false;
        var d = new Date(r[1], r[3] - 1, r[4]);
        return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4]);
    }

    //判断是否是长时间，形如 (2003-12-05 13:04:06)
    function _IsDateTime(str) {
        var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
        var r = str.match(reg);
        if (r == null) return false;
        var d = new Date(r[1], r[3] - 1, r[4], r[5], r[6], r[7]);
        return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4] && d.getHours() == r[5] && d.getMinutes() == r[6] && d.getSeconds() == r[7]);
    }

    //判断对象是否是方法
    function _IsFunction(funObj) {
        return $.isFunction(funObj);
    }

    //执行方法对象的方法
    function _InvokeFun(funObj, paramsArray) {
        if (_IsFunction(funObj)) {
            return funObj.apply(funObj, paramsArray);
        }
        return false;
    }

    //返回验证对象的错误提示信息
    function _GetInputValidErrorMes(returnObj) {
        returnObj.errormsg = returnObj.errormsg ? returnObj.errormsg : (returnObj.onerror ? returnObj.onerror : "");
    }

    function _GetNodeById(id, isGetDomObj) {
        var jqObj = _GetJqObj(id);
        return isGetDomObj ? jqObj.get(0) : jqObj;
    }

    function _GetDomObj(obj) {
        if (obj instanceof jQuery) {
            return obj.get(0);
        }
        return obj;
    }

    function _GetJqObj(obj) {
        return (typeof (obj) === "string") ? $("#" + obj) : $(obj);
    }

    function _GetElemAutoId() {
        return "auto_" + (new Date()).getTime();
    }

    String.getCharLength = function (val) {
        var len = 0;
        for (var i = 0; i < val.length; i++) {
            if (val.charCodeAt(i) >= 0x4e00 && val.charCodeAt(i) <= 0x9fa5) {
                len += 2;
            } else {
                len++;
            }
        }
        return len;
    }

    String.isNullOrEmpty = function (str) {
        return !(typeof (str) === "string" && $.trim(str) != "");
    }

    Object.isNull = function (obj) {
        return !(typeof (obj) === "object" && obj != null);
    }
    //#endregion
})(jQuery);

/**
* 输入过滤操作对象
**/
var FilterInputOper = {
    /**
    * 过滤特殊字符
    * @public
    * @param s:要过滤特殊字符的原始字符串
    * @return string 处理后的字符串
    **/
    DeleteScript: function (s) {
        var pattern = new RegExp("[<>\"']"); //[]内为需要过滤的字符，有些需要转义，比如"
        var rs = "";
        for (var i = 0; i < s.length; i++) {
            rs = rs + s.substr(i, 1).replace(pattern, '');
        }
        return rs;
    },
    /**
    * 将传进来的字符串去掉首尾空格和所有的全角空格
    * @public
    * @param str:要处理的字符串
    * @return string 处理后的字符串
    **/
    TrimStartAndEnd: function (str) {
        return str.replace(/(^\s*)|(　)|(\s*$)/g, '');
    },
    /**
    * 将传进来的字符串去掉换行符
    * @public
    * @param str:要处理的字符串
    * @return string 处理后的字符串
    **/
    TrimBr: function (str) {
        return str.replace(/[\r\n]/g, "");
    },
    /**
    * 过虑输入文本字符串[过虑脚本、空格、换行]
    * @public
    * @param str:要处理的字符串
    * @return string 处理后的字符串
    **/
    FilterInputStr: function (elmVal) {
        elmVal = FilterInputOper.DeleteScript(elmVal);
        elmVal = FilterInputOper.TrimStartAndEnd(elmVal);
        elmVal = FilterInputOper.TrimBr(elmVal);
        return elmVal;
    }
};