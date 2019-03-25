package controller.front;

import entity.Emp;
import entity.Job;
import entity.user;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import service.front.EmpService;
import service.front.JobService;
import service.front.PhotoService;
import utils.BaseResponse;
import utils.JqueryDto;
import utils.Pager;
import utils.PagerUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/emp")
public class EmpController {

    @Resource
    EmpService empService;
    @Resource
    PhotoService photoService;
    @Resource
    JobService jobService;

    /**
     * 跳转到简历页面
     *
     * @return
     */
    @RequestMapping(value = "/goEmpInfo")
    public ModelAndView goEmpInfo() {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/user/empInfo");
        return view;
    }

    /**
     * 获取此登录用户的简历信息
     *
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findEmpById")
    public BaseResponse findEmpById(HttpServletRequest request) {
        user user = (user) request.getSession().getAttribute("user");
        BaseResponse b = new BaseResponse();
        if (user == null) {
            b.setStatus(400);
        } else if (user.getStatus() == 2) {
            b.setStatus(500);
        } else {
            Emp emp = empService.findByUserId(user.getId());
            b.setStatus(200);
            b.setContent(emp);
        }
        return b;
    }


    /**
     * 保存个人简历信息
     *
     * @return
     */
    @RequestMapping(value = "/saveEmp")
    public void saveEmp(Emp emp, HttpServletRequest request, HttpServletResponse response) {
        user user = (user) request.getSession().getAttribute("user");
        emp.setUserId(user.getId());
        boolean flag = empService.saveEmp(emp);
        try {
            if (flag) {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(emp.getEmpId());
                return;
            }
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print(0);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 修改个人简历信息
     *
     * @param emp
     * @param request
     * @param response
     */
    @RequestMapping(value = "/updateEmp")
    public void updateEmp(Emp emp, HttpServletRequest request, HttpServletResponse response) {
        user user = (user) request.getSession().getAttribute("user");
        emp.setUserId(user.getId());
        boolean flag = empService.updateEmp(emp);
        try {
            if (flag) {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(emp.getEmpId());
            } else {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(0);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }


    }


    /**
     * 用于上传简历头像
     *
     * @param file
     * @param request
     * @param response
     * @param eid
     */
    @RequestMapping(value = "/uploadImage")
    public void upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response, Integer eid) {
        if (file == null || eid == null) {
            return;
        }
        boolean flag = photoService.saveDpersonImage(request, file, eid);
        try {
            if (flag) {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(1);
            } else {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(0);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @RequestMapping(value = "/goSuccess")
    public ModelAndView goSuccess(String flag) {
        ModelAndView view = new ModelAndView();
        if (flag.equals("1")) {
            // 允许注册
            view.setViewName("user/registerSuccess");
        } else {
            // 不允许注册
            view.setViewName("user/empInfoRegister");
        }

        return view;
    }


    @RequestMapping(value = "/goHistoryJobList")
    public ModelAndView goHistoryJobList() {
        ModelAndView view = new ModelAndView();
        view.setViewName("job/historyJobList");
        return view;
    }

    /**
     * 查看浏览职位的历史
     *
     * @param request
     * @param response
     * @param job
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findHistoryJobList")
    public JqueryDto findHistoryJobList(HttpServletRequest request, HttpServletResponse response, Job job) {
        //查询总数
        user user = (user) request.getSession().getAttribute("user");
        if (user == null || user.getStatus() == 2) {
            return null;
        }
        Pager pager = PagerUtils.getPager(request);
        return jobService.findHistoryJobList(pager, job, user.getId());
    }
}
