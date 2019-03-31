package controller.back;

import controller.Abase.Basic_controller;
import entity.jobskill;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.back.jobskill_service;
import utils.JsonData;
import utils.JsonList;
import utils.Search;
import utils.Values;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("jobskill")
public class jobskill_controller extends Basic_controller<jobskill> {
    @Resource(name = "jobskill_serviceImpl")
    jobskill_service service;


    @RequestMapping(value = "/goBlog")
    public ModelAndView goAllBlog(HttpServletRequest request) {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/jobskill/blogs");
        return view;
    }

    /**
     * 获取求职技巧列表及查询操作
     *
     * @param info
     * @param req
     * @return
     */
    @Override
    @ResponseBody
    public JsonList index(Search info, HttpServletRequest req) {
        String txt = req.getParameter("txt");
        if (txt != null && txt.length() > 0) info.setWhere(" where jobskill.title like '%" + txt + "%' ");
        JsonList list = super.index(info, req);
        return list;
    }

    @RequestMapping("insert")
    public @ResponseBody
    JsonData insert(jobskill t, HttpServletRequest req) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        t.setCreateTime(sdf.format(new Date()));
        service.insert(t);
        return new JsonData(1);
    }

    @RequestMapping("statuslist")
    public @ResponseBody
    String[][] statuslist() {
        return Values.fabu_status;
    }

    @RequestMapping("hotlist")
    public @ResponseBody
    String[][] hotlist() {
        return Values.hot_status;
    }
}
