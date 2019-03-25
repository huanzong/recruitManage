package service.front;


import entity.Info;
import utils.JqueryDto;
import utils.Pager;

public interface InfoService {

    JqueryDto findInfoList(Pager pager, int userId, int status, int isApply);

    public boolean saveInfo(Info info);

    public JqueryDto findMyInfoList(Pager pager, int userId);

}
