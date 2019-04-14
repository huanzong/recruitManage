package controller.front;


import entity.Company;
import entity.user;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.front.CompanyService;
import utils.BaseResponse;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

import static utils.Values.*;


@Controller
@RequestMapping("/com")
public class CompanyController {

    @Resource
    CompanyService companyService;

    /**
     * 用于保存公司信息
     *
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/saveCompany")
    public ModelAndView saveUser(Company company, HttpServletRequest request) throws UnsupportedEncodingException {
        ModelAndView view = new ModelAndView();
        user user = (user) request.getSession().getAttribute("user");
        if (user == null) {
            view.setViewName("views/user/comInfoRegister");
            return null;
        }
        company.setUserId(user.getId());
        boolean flag = companyService.saveCompany(company);
        if (flag == true) {
            view.setViewName("views/user/registerSuccess");
        } else {
            view.setViewName("views/user/comInfoRegister");
        }
        return view;
    }


    /**
     * 根据公司名称获取公司信息，用于前台公司信息维护时校验是否已存在此公司
     *
     * @param fullname
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/checkCompanyname")
    public String checkCompanyname(String fullname) {
        if (fullname == null || fullname == "") {
            return "0";
        }
        Company company = companyService.findByCompanyname(fullname);
        if (company != null) {
            return "0";
        } else {
            return "1";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/findCompanyById")
    public BaseResponse findCompanyById(HttpServletRequest request) {
        //Company company=companyService.findByCompanyname(fullname);
        user user = (user) request.getSession().getAttribute("user");
        BaseResponse b = new BaseResponse();

        if (user == null) {
            b.setStatus(400);
        } else if (user.getType() != RECRUITER_STATUS) {
            b.setStatus(500);
        } else {
            Company company = companyService.findByUid(user.getId());
            b.setStatus(200);
            b.setContent(company);
        }
        return b;
    }


    @RequestMapping(value = "/goAllCompany")
    public ModelAndView goAllCompany(HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/companys/famouseCompanys");
        return view;
    }

    @RequestMapping(value = "/goCompanyInfo")
    public ModelAndView goCompanyInfo(HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/user/comInfo");
        return view;
    }

    /**
     * 修改公司信息
     *
     * @param com
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateCompanyInfo")
    public String updateCompanyInfo(Company com, HttpServletRequest request) {
        user user = (user) request.getSession().getAttribute("user");
        if (user == null) {
            return "2";
        }
        if (user.getType() == JOB_SEEKER_STATUS) {
            return "3";
        }
        com.setStatus(USER_STATUS_NOChECK);
        com.setUserId(user.getId());
        com.setUsername(user.getAccount());
        boolean flag;
        if (null != com.getComId() && 0 != com.getComId()) {
            flag = companyService.updateCompany(com);
        } else {
            flag = companyService.saveCompany(com);
        }
        if (flag) {
            return "1";
        }
        return "0";
    }


}
