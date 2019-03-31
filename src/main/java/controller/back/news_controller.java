package controller.back;

import controller.Abase.Basic_controller;
import entity.news;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.back.news_service;
import service.front.PhotoService;
import utils.JsonData;
import utils.JsonList;
import utils.Search;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("news")
public class news_controller extends Basic_controller<news> {
    @Resource(name = "news_serviceImpl")
    news_service service;
    @Resource
    PhotoService photoService;

    /**
     * 获取新闻列表及查询操作
     *
     * @param info
     * @param req
     * @return
     */
    @Override
    @ResponseBody
    public JsonList index(Search info, HttpServletRequest req) {
        String txt = req.getParameter("txt");
        if (txt != null && txt.length() > 0) info.setWhere(" where news.title like '%" + txt + "%' ");
        JsonList list = super.index(info, req);
        return list;
    }

    @Override
    @RequestMapping("insert")
    public @ResponseBody
    JsonData insert(news t, HttpServletRequest req) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        t.setCreateTime(sdf.format(new Date()));
        service.insert(t);
        return new JsonData(1);
    }

    /**
     * 根据新闻id获取新闻信息
     *
     * @param newsId
     * @param req
     * @return
     */
    @RequestMapping("getnews")
    public @ResponseBody
    news getPower(int newsId, HttpServletRequest req) {
        news info = service.getById(newsId);
        return info;
    }


    /**
     * 用于上传新闻图片
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
        boolean flag = photoService.saveNewsImage(request, file, eid);
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


}
