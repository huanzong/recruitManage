package serviceImpl.back;

import entity.Emp;
import entity.news;
import mapper.back.news_mapper;
import org.springframework.stereotype.Repository;
import service.back.news_service;
import serviceImpl.Abase.Basic_serviceImpl;

import javax.annotation.Resource;

@Repository("news_serviceImpl")
public class news_serviceImpl extends Basic_serviceImpl<news> implements news_service {
    @Resource(name = "news_mapper")
    news_mapper mapper;

    public boolean updateEmp(news dp) {
        try {
            mapper.updateNewsPic(dp);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
