package controller.back;

import controller.Abase.Basic_controller;
import entity.operator;
import entity.user;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.back.operator_service;
import utils.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("operator")
public class operator_controller extends Basic_controller<operator> {
    @Resource(name = "operator_serviceImpl")
    operator_service service;

    /**
     * 获取管理员列表及查询操作
     * @param info
     * @param req
     * @return
     */
    @Override
    public JsonList index(Search info, HttpServletRequest req) {
        String txt = req.getParameter("txt");
        if (txt != null && txt.length() > 0) info.setWhere(" where operator.name like '%" + txt + "%' ");
        return super.index(info, req);
    }

    /**
     * 管理员登录
     * @param t
     * @param code
     * @param req
     * @return
     */
    @RequestMapping("login")
    public String login(operator t, String code, HttpServletRequest req) {
        String r = req.getSession().getAttribute("randomCode").toString();
        if (!code.equalsIgnoreCase(r)) return "redirect:../login.jsp";
        t.setPass(MD5Util.MD5(t.getPass()));
        operator info = service.login(t);
        if (info == null) return "redirect:../login.jsp";
        req.getSession().setMaxInactiveInterval(500000);
        req.getSession().setAttribute("user", info);
        return "redirect:../main.jsp";
    }

    /**
     * 管理员退出登录
     * @param m
     * @param req
     * @return
     */
    @RequestMapping("out")
    public String out(ModelMap m, HttpServletRequest req) {
        req.getSession().removeAttribute("user");
        return "redirect:../login.jsp";
    }

    /**
     * 管理员新增，初始密码为admin,登录后自行修改
     * @param operator
     * @param req
     * @return
     */
    @Override
    public JsonData insert(operator operator, HttpServletRequest req) {
        operator.setPass(MD5Util.MD5("admin"));
        return super.insert(operator, req);
    }

    /**
     * 修改密码操作
     * @param id
     * @param old
     * @param new1
     * @param new2
     * @param req
     * @return
     */
    @RequestMapping("updatepass")
    public @ResponseBody
    JsonData updatepass(int id, String old, String new1, String new2, HttpServletRequest req) {
        JsonData jj = new JsonData();
        operator info = service.getById(id);
        if (info.getPass().equalsIgnoreCase(MD5Util.MD5(old))) {
            if (new1.length() > 0 && new1.equalsIgnoreCase(new2)) {
                service.updatepass(new operator(id, MD5Util.MD5(new1)));
                jj.setStatus(1);
                return jj;
            } else {
                jj.setStatus(0);
                return jj;
            }
        } else {
            jj.setStatus(0);
            return jj;
        }
    }

    /**
     * 重置密码操作
     * @param id
     * @param req
     * @return
     */
    @RequestMapping("resetpass")
    public @ResponseBody
    JsonData resetpass(int id, HttpServletRequest req) {
        JsonData jj = new JsonData();
        operator info = service.getById(id);
        if (info.getPass() != null) {
            service.updatepass(new operator(id, MD5Util.MD5("123")));
            jj.setStatus(1);
            return jj;
        }
        jj.setStatus(0);
        return jj;
    }

    /**
     * 根据管理员id获取管理员信息
     * @param operatorid
     * @param req
     * @return
     */
    @RequestMapping("getOperator")
    public @ResponseBody operator getPower(int operatorid, HttpServletRequest req) {
        operator info = service.getById(operatorid);
        return info;
    }

    /**
     * 管理员账户启动禁用操作
     *
     * @param id
     * @param req
     * @return
     */
    @RequestMapping("ban")
    public @ResponseBody
    JsonList ban(int id, HttpServletRequest req) {
        operator user = service.getById(id);
        if (user.getStatus() == 0) {
            user.setStatus(1);
        } else {
            user.setStatus(0);
        }
        service.update(user);
        return index(new Search(), req);
    }


    @RequestMapping("statuslist")
    public @ResponseBody
    String[][] statuslist() {
        return Values.currency_status;
    }




}
