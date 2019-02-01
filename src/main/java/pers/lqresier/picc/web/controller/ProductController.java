package pers.lqresier.picc.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.lqresier.picc.condition.ProductCondition;
import pers.lqresier.picc.entity.Product;
import pers.lqresier.picc.entity.ProductType;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.service.LogService;
import pers.lqresier.picc.service.ProductService;
import pers.lqresier.picc.service.ProductTypeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

@RequestMapping("/system/product")
@Service
public class ProductController {

    private Logger logger = LoggerFactory.getLogger(ProductController.class);
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductTypeService productTypeService;
    @Autowired
    private LogService logService;

    /**
     * 添加产品
     *
     * @param name         产品
     * @param code         产品编码
     * @param documentCode 单证识别码
     * @param timeLimit    产品期限
     * @param coverage     保额（可以获额多少）
     * @param premium      保费
     * @param compensat1   赔付1
     * @param compensat2   赔付2
     * @param compensat3   赔付3
     * @param compensat4   赔付4
     * @param productType2 险种类型
     * @param request
     * @param response
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("addProduct")
    public String addProduct(@RequestParam("product.projectName") String name, @RequestParam("product.projectCode") String code, @RequestParam("product.docuDtg") String documentCode,
                             @RequestParam("product.productPeriod") String timeLimit, @RequestParam("product.totalCoverage") String coverage, @RequestParam("product.totalPremium") String premium,
                             @RequestParam("product.duty1") String compensat1, @RequestParam("product.duty2") String compensat2, @RequestParam("product.duty3") String compensat3,
                             @RequestParam("product.duty4") String compensat4, @RequestParam("product.insuranceId") String productType2, HttpServletRequest request, HttpServletResponse response,
                             HttpSession session) {
        ProductType productType = new ProductType();
        if (!"".equals(productType2) && productType2 != null) {
            productType.setId(Integer.parseInt(productType2));
        }
        // 设置相关属性的值
        Product product = new Product();
        product.setName(name);
        product.setCode(code);
        product.setDocumentCode(documentCode);
        //product.setInfo(info);
        if (!"".equals(timeLimit) && timeLimit != null) {
            product.setTimeLimit(Integer.parseInt(timeLimit));
        }
        if (!"".equals(coverage) && coverage != null) {
            product.setCoverage(Double.parseDouble(coverage));
        }
        if (!"".equals(premium) && premium != null) {
            product.setPremium(Double.parseDouble(premium));
        }
        if (!"".equals(compensat1) && compensat1 != null) {
            product.setCompensat1(Double.parseDouble(compensat1));
        }
        if (!"".equals(compensat2) && compensat2 != null) {
            product.setCompensat2(Double.parseDouble(compensat2));
        }
        if (!"".equals(compensat3) && compensat3 != null) {
            product.setCompensat3(Double.parseDouble(compensat3));
        }
        if (!"".equals(compensat4) && compensat4 != null) {
            product.setCompensat4(Double.parseDouble(compensat4));
        }
        product.setType(productType);

        // 添加产品
        boolean result = false;
        try {
            result = productService.addProduct(product);
        } catch (Exception e) {
            result = false;
            logger.debug("添加产品失败");
            logger.error("添加产品失败");
        }
        if (result) {
            try {
                logService.addLog((User) request.getSession().getAttribute("user"), "产品管理", "add", "添加产品[" + product.getName() + "]");
            } catch (Exception e) {
                logger.debug("添加产品：添加日志失败");
                logger.error("添加产品：添加日志失败");
            }
            return "{\"result\":true,\"tip\":\"添加成功\"}";
        } else {
            return "{\"result\":false,\"tip\":\"添加失败\"}";
        }
    }

    /**
     * 修改产品
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("updateProduct")
    public String updateProduct(@RequestParam("product.id") int id, @RequestParam("product.projectName") String name, @RequestParam("product.projectCode") String code,
                                @RequestParam("product.docuDtg") String documentCode, @RequestParam("product.productPeriod") String timeLimit, @RequestParam("product.totalCoverage") String coverage,
                                @RequestParam("product.totalPremium") String premium, @RequestParam("product.duty1") String compensat1, @RequestParam("product.duty2") String compensat2,
                                @RequestParam("product.duty3") String compensat3, @RequestParam("product.duty4") String compensat4, @RequestParam("product.insuranceId") String productType2, HttpServletRequest request) {
        ProductType productType = new ProductType();
        productType.setId(Integer.parseInt(productType2));

        // 设置相关属性的值
        Product product = new Product();
        product.setId(id);
        product.setName(name);
        product.setCode(code);
        product.setDocumentCode(documentCode);
        // product.setInfo(info);
        if (!"".equals(timeLimit) && timeLimit != null) {
            product.setTimeLimit(Integer.parseInt(timeLimit));
        }
        if (!"".equals(coverage) && coverage != null) {
            product.setCoverage(Double.parseDouble(coverage));
        }
        if (!"".equals(premium) && premium != null) {
            product.setPremium(Double.parseDouble(premium));
        }
        if (!"".equals(compensat1) && compensat1 != null) {
            product.setCompensat1(Double.parseDouble(compensat1));
        }
        if (!"".equals(compensat2) && compensat2 != null) {
            product.setCompensat2(Double.parseDouble(compensat2));
        }
        if (!"".equals(compensat3) && compensat3 != null) {
            product.setCompensat3(Double.parseDouble(compensat3));
        }
        if (!"".equals(compensat4) && compensat4 != null) {
            product.setCompensat4(Double.parseDouble(compensat4));
        }
        product.setType(productType);

        // 修改产品
        boolean result = false;
        try {
            result = productService.updateProduct(product);
        } catch (Exception e) {
            logger.debug("修改产品失败");
            logger.error("修改产品失败");
        }
        if (result) {
            try {
                logService.addLog((User) request.getSession().getAttribute("user"), "产品管理", "update", "修改产品[" + product.getName() + "]");
            } catch (Exception e) {
                logger.debug("修改产品：添加日志失败");
                logger.error("修改产品：添加日志失败");
            }
            return "{\"result\":true,\"tip\":\"修改成功\"}";
        } else {
            return "{\"result\":false,\"tip\":\"修改失败\"}";
        }
    }

    /**
     * 下架产品
     *
     * @return
     */
    @RequestMapping("deleteProduct")
    public String deleteProduct(Product product, HttpServletRequest request) {
        boolean isSuccess = false;
        try {
            isSuccess = productService.deleteProduct(product);
        } catch (Exception e) {
            isSuccess = false;
            logger.debug("下架产品失败");
            logger.error("下架产品失败");
        }
        if (isSuccess) {
            String name = null;
            try {
                name = URLDecoder.decode(request.getQueryString().split("&")[2].split("=")[1], "utf-8");
            } catch (UnsupportedEncodingException e) {
                logger.debug("ProductCommand解码错误");
                logger.error("ProductCommand解码错误");
            }
            try {
                logService.addLog((User) request.getSession().getAttribute("user"), "产品管理", "del", "下架产品[" + name + "]");
            } catch (Exception e) {
                logger.debug("下架产品：添加日志失败");
                logger.error("下架产品：添加日志失败");
            }
            request.setAttribute("tip", "下架成功");
        } else {
            request.setAttribute("tip", "下架失败");
        }
        return "/system/product/toQueryProduct";
    }

    /**
     * 重新上架产品
     *
     * @param request
     * @return
     */
    @RequestMapping("putAwayProduct")
    public String putAwayProduct(Product product, HttpServletRequest request) {
        boolean isSuccess = false;
        try {
            isSuccess = productService.putAwayProduct(product);
        } catch (Exception e) {
            isSuccess = false;
            logger.debug("重新上架产品失败");
            logger.error("重新上架产品失败");
        }
        if (isSuccess) {
            String name = null;
            try {
                name = URLDecoder.decode(request.getQueryString().split("&")[2].split("=")[1], "utf-8");
            } catch (UnsupportedEncodingException e) {
                logger.debug("ProductCommand解码错误");
                logger.error("ProductCommand解码错误");
            }
            try {
                logService.addLog((User) request.getSession().getAttribute("user"), "产品管理", "open", "上架产品[" + name + "]");
            } catch (Exception e) {
                logger.debug("重新上架产品：添加日志失败");
                logger.error("重新上架产品：添加日志失败");
            }
            request.setAttribute("tip", "上架成功");
        } else {
            request.setAttribute("tip", "上架失败");
        }
        return "/system/product/toQueryProduct";

    }

    /**
     * 条件查询产品
     *
     * @return
     */
    @RequestMapping("queryProductByCondition")
    public String queryProductByCondition(@RequestParam(value = "product.projectStatus", required = false) String status, @RequestParam(value = "product.projectName", required = false) String name,
                                          @RequestParam(value = "product.projectCode", required = false) String code, @RequestParam(value = "product.insurance.id", required = false) String typeID,
                                          @RequestParam(value = "product.totalPremium", required = false) String premium, @RequestParam(value = "product.productPeriod", required = false) String timeLimit,
                                          HttpServletRequest request) {
        ProductCondition productCondition = new ProductCondition();
        if (!"".equals(status) && status != null) {
            productCondition.setStatus(Integer.parseInt(status));
        }
        productCondition.setName(name);
        productCondition.setCode(code);
        if (!"".equals(typeID) && typeID != null) {
            productCondition.setTypeId(Integer.parseInt(typeID));
        }
        if (!"".equals(premium) && premium != null) {
            productCondition.setPremium(Double.parseDouble(premium));
        }
        if (!"".equals(timeLimit) && timeLimit != null) {
            productCondition.setTimeLimit(Integer.parseInt(timeLimit));
        }
        List<Product> productList = null;
        try {
            productList = productService.queryProductByProductCondition(productCondition);
        } catch (Exception e) {
            logger.debug("条件查询产品失败");
            logger.error("条件查询产品失败");
        }
        request.setAttribute("products", productList);
        return "system/manage/product/queryProduct.html";
    }

    /**
     * 查询单证识别码信息
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("queryDocumentCodeInfo")
    public List<Product> queryDocumentCodeInfo() {
        List<Product> infoList = null;
        try {
            infoList = productService.queryDocumentCodeInfo();
        } catch (Exception e) {
            logger.debug("查询单证识别码信息失败");
            logger.error("查询单证识别码信息失败");
        }
        return infoList;
    }

    /**
     * 查询所有产品Ajax
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("queryProductAjax")
    public List<Product> queryProductAjax() {
        ProductCondition productCondition = new ProductCondition();
        productCondition.setStatus(1);
        List<Product> productList = null;
        try {
            productList = productService.queryProductByProductCondition(productCondition);
        } catch (Exception e) {
            logger.debug("查询所有产品失败");
            logger.error("查询所有产品失败");
        }
        return productList;
    }

    /**
     * 准备数据到【添加产品】界面
     *
     * @return
     */
    @RequestMapping("toAddProduct")
    public String toAddProduct(HttpServletRequest request) {
        List<ProductType> productTypeList = null;
        try {
            productTypeList = productTypeService.queryAll();//查出所有险种
        } catch (Exception e) {
            logger.debug("准备数据到【添加产品】界面失败");
            logger.error("准备数据到【添加产品】界面失败");
        }
        request.setAttribute("productTypes", productTypeList);
        String tip = request.getParameter("tip");
        if (tip != null && "addSuccess".equals(tip)) {
            request.setAttribute("tip", "添加成功");
        } else {
            request.setAttribute("tip", tip);
        }
        return "system/manage/product/addProduct.html";
    }

    /**
     * 准备数据到【修改产品】界面
     *
     * @param request
     * @return
     */
    @RequestMapping("toUpdateProduct")
    public String toUpdateProduct(@RequestParam("id") int id, HttpServletRequest request) {
        Product product = null;
        List<ProductType> productTypeList = null;
        try {
            product = productService.queryProductByPk(id);
        } catch (Exception e) {
            logger.debug("准备数据到【修改产品】界面：主键查询产品失败");
            logger.error("准备数据到【修改产品】界面：主键查询产品失败");
        }
        try {
            productTypeList = productTypeService.queryAll();//查出所有险种
        } catch (Exception e) {
            logger.debug("准备数据到【修改产品】界面：查询所有险种失败");
            logger.error("准备数据到【修改产品】界面：查询所有险种失败");
        }
        request.setAttribute("productTypes", productTypeList);
        request.setAttribute("product", product);
        return "/system/manage/product/updateProduct.jsp";

    }

    /**
     * 准备数据到【查询产品】界面
     *
     * @return
     */
    @RequestMapping("toQueryProduct")
    public String toQueryProduct(HttpServletRequest request) {
        List<ProductType> productTypes = null;
        List<Product> products = null;
        try {
            productTypes = productTypeService.queryAll();
        } catch (Exception e) {
            logger.debug("准备数据到【查询产品】界面：查询所有产品类型失败");
            logger.error("准备数据到【查询产品】界面：查询所有产品类型失败");
        }
        try {
            products = productService.queryPremium();
        } catch (Exception e) {
            logger.debug("准备数据到【查询产品】界面：查询所有保费失败");
            logger.error("准备数据到【查询产品】界面：查询所有保费失败");
        }
        String tip = request.getParameter("tip");
        if (tip != null && !"".equals(tip)) {
            if ("updateSuccess".equals(tip)) {
                request.setAttribute("tip", "修改成功");
            }
        }
        request.setAttribute("productTypes", productTypes);
        request.setAttribute("products", products);
        return "system/manage/product/product.html";
    }

    /**
     * 验证产品名是否存在
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("isProductNameExist")
    public boolean isProductNameExist(@RequestParam("productName") String name, @RequestParam("id") int id) {
        Product product = new Product();
        product.setName(name);
        product.setId(id);
        boolean isExist = false;
        try {
            isExist = productService.isExist(product);
        } catch (Exception e) {
            isExist = true;
            logger.debug("验证产品名是否存在失败");
            logger.error("验证产品名是否存在失败");
        }
        return isExist;
    }

    /**
     * 验证产品编码是否存在
     *
     * @param code
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("isProductCodeExist")
    public boolean isProductCodeExist(@RequestParam("productCode") String code, @RequestParam("id") int id) {
        Product product = new Product();
        product.setCode(code);
        product.setId(id);
        boolean isExist = false;
        try {
            isExist = productService.isExist(product);
        } catch (Exception e) {
            isExist = true;
            logger.debug("验证产品编码是否存在失败");
            logger.error("验证产品编码是否存在失败");
        }
        return isExist;
    }

    /**
     * 验证单证识别码是否存在
     *
     * @param documentCode
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("isDocumentCodeExist")
    public boolean isDocumentCodeExist(@RequestParam("documentCode") String documentCode, @RequestParam("id") int id) {
        Product product = new Product();
        product.setDocumentCode(documentCode);
        product.setId(id);
        boolean isExist = false;
        try {
            isExist = productService.isExist(product);
        } catch (Exception e) {
            isExist = true;
            logger.debug("验证产品编码是否存在失败");
            logger.error("验证产品编码是否存在失败");
        }
        return isExist;
    }


}
