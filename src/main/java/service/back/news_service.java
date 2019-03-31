package service.back;

import entity.news;
import service.Abase.Basic_Service;

public interface news_service extends Basic_Service<news> {

    public boolean updateEmp(news dp);

}
