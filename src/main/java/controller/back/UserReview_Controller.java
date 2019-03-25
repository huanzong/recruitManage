package controller.back;

import controller.Abase.Basic_controller;
import entity.user;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import serviceImpl.back.userReview_serviceImpl;
import utils.JsonList;
import utils.Search;
import utils.Values;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("userReview")
public class UserReview_Controller extends Basic_controller<user> {

    @Resource(name = "userReview_serviceImpl")
    userReview_serviceImpl service;

    /**
     * 后台获取用户者（求职者/招聘者）列表及查询操作
     *
     * @param info
     * @param req
     * @return
     */
    @Override
    public @ResponseBody JsonList index(Search info, HttpServletRequest req) {
        String txt = req.getParameter("txt");
        String type = req.getParameter("type");
        StringBuilder sqlWhere = new StringBuilder();
        if (txt != null && txt != "") {
            sqlWhere.append(" where user.account like '%" + txt + "%' ");
        }
        if (type != null && type != "") {
            sqlWhere.append(" AND user.type = " + type + "");
        }
        if (txt != ""&&txt!=null || type != ""&&type!=null) {
            info.setWhere(sqlWhere.toString());
        }
        JsonList JsonList = super.index(info, req);
        return JsonList;
    }

    /**
     * 使用者账户启动禁用操作
     *
     * @param id
     * @param req
     * @return
     */
    @RequestMapping("ban")
    public @ResponseBody
    JsonList ban(int id, HttpServletRequest req) {
        user user = service.getById(id);
        if (user.getStatus() == 0) {
            user.setStatus(1);
        } else {
            user.setStatus(0);
        }
        service.update(user);
        return index(new Search(), req);
    }


    @RequestMapping("typelist")
    public @ResponseBody
    String[][] typelist() {
        return Values.user_type;
    }

    @RequestMapping("statuslist")
    public @ResponseBody
    String[][] statuslist() {
        return Values.user_status;
    }


}
