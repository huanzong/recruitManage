package controller.front;

import dto.JobDto;
import entity.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.front.*;
import utils.BaseResponse;
import utils.JqueryDto;
import utils.Pager;
import utils.PagerUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/job")
public class JobController {

    @Resource
    JobService jobService;
    @Resource
    EmpService empService;
    @Resource
    ResumeService resumeService;
    @Resource
    InfoService infoService;
    @Resource
    CompanyService companyService;

    /**
     * 用于前台首页展示职位列表以及点击量
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findTen", method = RequestMethod.GET)
    public BaseResponse findTen() {
        BaseResponse baseResponse = new BaseResponse();
        baseResponse.setStatus(200);
        baseResponse.setContent(jobService.findTen());
        return baseResponse;
    }

    /**
     * 用于跳转职位详情页,展示职位详细信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/goJobDetail")
    public ModelAndView goJobDetail(int id) {
        if (id == 0) {
            return null;
        }
        JobDto job = jobService.findByJobId(id);
        ModelAndView view = new ModelAndView();
        view.addObject("job", job);
        view.setViewName("views/job/jobInfo");
        return view;
    }

    /**
     * 用于 跳转职位列表页
     *
     * @return
     */
    @RequestMapping(value = "/goJobList")
    public ModelAndView goJobList() {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/job/jobList");
        return view;
    }

    /**
     * 用于跳转求职列表页
     *
     * @return
     */
    @RequestMapping(value = "/goInfoList")
    public ModelAndView goInfoList() {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/info/listInfo");
        return view;
    }

    /**
     * 跳转发布招聘信息页面
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/goSaveJob")
    public ModelAndView goSaveJob(HttpServletRequest request) {
//        user user = (user) request.getSession().getAttribute("user");
//        if (user == null) {
//            return null;
//        }
        ModelAndView view = new ModelAndView();
        view.setViewName("views/job/jobRegister");
        return view;
    }

    /**
     * 进入招聘信息管理界面
     * @param request
     * @return
     */
    @RequestMapping(value = "/goComJobList")
    public ModelAndView goComJobList(HttpServletRequest request) {
        user user = (user) request.getSession().getAttribute("user");
        if (user == null) {

        }
        ModelAndView view = new ModelAndView();
        view.setViewName("views/job/jobManager");
        return view;
    }

    /**
     * 用于列表页查询职位列表
     *
     * @param request
     * @param response
     * @param jobName
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findJobList")
    public JqueryDto findJobList(HttpServletRequest request, HttpServletResponse response, String jobName) {
        Job job = new Job();
        job.setJobName(jobName);
        Pager pager = PagerUtils.getPager(request);
        return jobService.findJobList(pager, job);
    }


    /**
     * 用于查询求职列表
     *
     * @param request
     * @param response
     * @param status
     * @param isApply
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findInfoList", method = RequestMethod.POST)
    public JqueryDto findInfoList(HttpServletRequest request, HttpServletResponse response, int status, int isApply) {
        Pager pager = PagerUtils.getPager(request);
        return infoService.findInfoList(pager, 0, status, isApply);
    }


    /**
     * 用于求职者申请职位
     */
    @RequestMapping(value = "applyJob", method = RequestMethod.POST)
    public void applyJob(JobDto dto, HttpServletResponse response, HttpServletRequest request) {
        user user = (user) request.getSession().getAttribute("user");
        //校验用户是否登录
        if (user == null || user.getStatus() == 2) {
            response.setContentType("text/html;charset=utf-8");
            try {
                response.getWriter().print(2);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }
        try {
            //查询用户对应的简历是否存在
            Emp emp = empService.findByUserId(user.getId());
            if (emp == null || emp.getResume_name() == null || "".endsWith(emp.getResume_name())) {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(3);
                return;
            }
            ComResume cr = new ComResume();
            cr.setCom_id(dto.getComId());
            cr.setEmp_id(emp.getEmpId());
            cr.setJob_id(dto.getJobId());
            cr.setLook(0);
            cr.setResume_name(emp.getResume_name());
            cr.setStatus("0");
            //保存职位申请信息
            boolean f = resumeService.saveResume(cr);
            if (f) {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(1);
            } else {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=utf-8");
            try {
                response.getWriter().print(0);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }


    }

    /**
     * 保存招聘相关信息
     *
     * @return
     */
    @RequestMapping(value = "/saveJob", method = RequestMethod.POST)
    public void saveJob(Job job, HttpServletRequest request, HttpServletResponse response) {
        user user = (user) request.getSession().getAttribute("user");
        if (user == null) {
            try {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(2);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return;
        }
        Company com = companyService.findByUid(user.getId());
        boolean iscom;
        if (com == null) {
            iscom = false;
        } else {
            iscom = true;
        }
        try {
            if (iscom) {
                job.setComId(com.getComId());
                boolean flag = jobService.saveJob(job);
                if (flag) {
                    response.setContentType("text/html;charset=utf-8");
                    response.getWriter().print(1);
                }
            } else {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(3);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
