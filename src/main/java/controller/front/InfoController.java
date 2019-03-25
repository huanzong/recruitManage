package controller.front;

import dto.InfoDto;
import entity.Info;
import entity.user;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.front.InfoService;
import utils.DateUtil;
import utils.JqueryDto;
import utils.Pager;
import utils.PagerUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/info")
public class InfoController {

    @Resource
    InfoService infoService;

    /**
     * 跳转求职信息发布页面
     *
     * @return
     */
    @RequestMapping(value = "/goAddInfo")
    public ModelAndView goAddInfo() {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/info/saveInfo");
        return view;
    }

    /**
     * 跳转我的求职信息页面
     *
     * @return
     */
    @RequestMapping(value = "/goMyInfo")
    public ModelAndView goMyInfo() {
        ModelAndView view = new ModelAndView();
        view.setViewName("views/info/myInfo");
        return view;
    }

    /**
     * 保存需要的求职信息
     *
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
    public void saveInfo(Info Info, HttpServletRequest request, HttpServletResponse response) throws IOException {
        user user = (user) request.getSession().getAttribute("user");
        if (user == null) {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("登入之后才能发布信息");
        }
        Info.setUserId(user.getId());
        Info.setIsapply(0);
        Info.setStatus(user.getStatus());
        Info.setCreatedate(DateUtil.currDay());
        boolean flag = infoService.saveInfo(Info);
        try {
            if (flag) {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print(1);
            } else {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().print("发布失败");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @ResponseBody
    @RequestMapping(value = "findMyInfoList", method = RequestMethod.POST)
    public JqueryDto findMyInfoList(HttpServletRequest request) {
        user user = (user) request.getSession().getAttribute("user");
        if (user == null) {
            return null;
        }
        Pager pager = PagerUtils.getPager(request);
        return infoService.findMyInfoList(pager, user.getId());
    }
}
