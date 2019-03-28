package controller.back;

import controller.Abase.Basic_controller;
import entity.Company;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import serviceImpl.back.companyBack_serviceImpl;
import utils.JsonList;
import utils.Search;
import utils.Values;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("company")
public class companyBack_Controller extends Basic_controller<Company> {

    @Resource(name = "companyBack_serviceImpl")
    companyBack_serviceImpl service;

    /**
     * 后台获取用户者（求职者/招聘者）列表及查询操作
     *
     * @param info
     * @param req
     * @return
     */
    @Override
    public @ResponseBody
    JsonList index(Search info, HttpServletRequest req) {
        String txt = req.getParameter("txt");
        StringBuilder sqlWhere = new StringBuilder();
        if (txt != null && txt != "") {
            sqlWhere.append(" where company.name like '%" + txt + "%' ");
            info.setWhere(sqlWhere.toString());
        }
        return super.index(info, req);
    }

    /**
     * 使用者账户启动禁用操作
     *
     * @param id
     * @param req
     * @return
     */
    @RequestMapping("check")
    public @ResponseBody
    JsonList check(int id, int status, int checkStatus, HttpServletRequest req) {
        if (id == 0) {
            return null;
        }
        Company company = service.getById(id);
        if (status == 0 && checkStatus == 1 || checkStatus == 2) {
//            company.setStatus(checkStatus);
        }
        service.update(company);
        return index(new Search(), req);
    }



}
