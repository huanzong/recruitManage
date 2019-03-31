package controller.back;

import controller.Abase.Basic_controller;
import entity.jobFair;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.back.jobFair_service;
import utils.JsonData;
import utils.JsonList;
import utils.Search;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;

@Controller
@RequestMapping("jobFair")
public class jobFair_controller extends Basic_controller<jobFair> {
    @Resource(name = "jobFair_serviceImpl")
    jobFair_service service;

    /**
     * 获取招聘会列表及查询操作
     *
     * @param info
     * @param req
     * @return
     */
    @Override
    @ResponseBody
    public JsonList index(Search info, HttpServletRequest req) {
        String txt = req.getParameter("txt");
        if (txt != null && txt.length() > 0) info.setWhere(" where job_fair.title like '%" + txt + "%' ");
        JsonList list = super.index(info, req);
        return list;
    }

}
