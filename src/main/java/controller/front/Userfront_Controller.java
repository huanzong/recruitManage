package controller.front;

import controller.Abase.Basic_controller;
import entity.user;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.front.UserService;
import utils.BaseResponse;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import static utils.Values.JOB_SEEKER_STATUS;

@Controller
@RequestMapping("/userSave")
public class Userfront_Controller extends Basic_controller<user> {

    @Resource
    UserService userService;

    /**
     * 前台进入用户登录页面
     *
     * @return
     */
    @RequestMapping(value = "/goLogin")
    public ModelAndView enterPage() {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/login");
        return view;
    }

    /**
     * 前台跳转用户注册页面
     *
     * @return
     */
    @RequestMapping(value = "/goCompany")
    public ModelAndView goCompany() {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/user/comRegister");
        return view;
    }

    /**
     * 进入首页
     *
     * @return
     */
    @RequestMapping(value = "/goMain")
    public ModelAndView goMain() {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/index");
        return view;
    }

    /**
     * 前台进入个人中心界面
     *
     * @return
     */
    @RequestMapping(value = "/goUserInfo")
    public ModelAndView goUserInfo() {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/user/userInfo");
        return view;
    }


    /**
     * 前台用户登录
     *
     * @param username
     * @param pwd
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public BaseResponse getbyid(String username, String pwd, HttpServletRequest req) {
        BaseResponse baseResponse = new BaseResponse();
        if (username == null || username == "" || pwd == null || pwd == "") {
            return BaseResponse.STATUS_500;
        }
        try {
            user user = userService.loginByFront(username, pwd);
            if (user != null) {
                req.getSession().setMaxInactiveInterval(500000);
                req.getSession().setAttribute("user", user);
                baseResponse.setStatus(200);
                baseResponse.setContent(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
            return BaseResponse.STATUS_500;
        }
        return baseResponse;
    }

    /**
     * 前台用户退出登录
     *
     * @return
     */
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest req) {
        req.getSession().removeAttribute("user");
        ModelAndView view = new ModelAndView();
        view.setViewName("views/index");
        return view;
    }

    /**
     * 前台用户修改密码
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateUserInfo")
    public String updateUserPass(String username, String oldpwd, String password1, String password2, HttpServletRequest req) {
        user user = (user) req.getSession().getAttribute("user");
        if (user == null) {
            return "0";
        }
        if (username == null || username == "" || !username.equals(user.getAccount())) {
            return "0";
        }
        if (oldpwd == null || oldpwd == "" || !oldpwd.equals(user.getPass())) {
            return "0";
        }
        if (password1 == null || password1 == "" || password2 == null || password2 == "") {
            return "0";
        }
        if (!password1.equals(password2)) {
            return "0";
        }
        user.setPass(password1);
        boolean flag = userService.updateUserPass(user);
        if (flag) {
            req.getSession().setAttribute("user", user);
            return "1";
        } else {
            return "0";
        }
    }

    public ModelAndView saveUser(user user, HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        if (null == user) {
            return null;
        }
        entity.user userInfo = userService.getUserByAccount(user.getAccount());
        if (userInfo != null && userInfo.getAccount() != "") {
            view.setViewName("user/comRegister");//不允许注册
            return view;
        }
        userService.insert(user);
        request.getSession().setAttribute("user", user);
        if (user.getStatus() == JOB_SEEKER_STATUS) {
            view.setViewName("user/empInfoRegister");
        } else {
            view.setViewName("user/comInfoRegister");
        }
        return view;
    }


}
