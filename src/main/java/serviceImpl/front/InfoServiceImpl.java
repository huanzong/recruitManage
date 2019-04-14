package serviceImpl.front;


import dto.InfoDto;
import entity.Info;
import mapper.front.InfoMapper;
import org.springframework.stereotype.Service;
import service.front.InfoService;
import utils.JqueryDto;
import utils.Pager;
import utils.Search;

import javax.annotation.Resource;
import java.util.List;

@Service
public class InfoServiceImpl implements InfoService {

    @Resource
    InfoMapper infoMapper;


    public JqueryDto findInfoList(Pager pager, int userId, int status, int isApply) {
        String selectInfo = "";
        if (userId != 0) {
            selectInfo += " and i.user_id= " + userId;
        }
        if (status != 0) {
            selectInfo += "and i.status= " + status;
        }
        if (isApply != 0) {
            selectInfo += "and i.isApply= " + isApply;
        }
        Search search = new Search();
        search.setWhere(selectInfo);
        search.setPage(Integer.parseInt(pager.getPage()) - 1);
        search.setRows(Integer.parseInt(pager.getRows()));
        //查询总数
        int total = infoMapper.findInfoCount(search);
        List<InfoDto> list = infoMapper.findInfoList(search);
        JqueryDto dto = new JqueryDto();
        dto.setTotal(total);
        pager.setObj(list);
        dto.setRows(list);
        return dto;
    }

    public boolean saveInfo(Info user) {
        int i = infoMapper.insert(user);
        if (i > 0) {
            return true;
        }
        return false;
    }

    public JqueryDto findMyInfoList(Pager pager, int userId) {
        Search search = new Search();
        search.setPage(Integer.parseInt(pager.getPage()) - 1);
        search.setRows(Integer.parseInt(pager.getRows()));
        search.setWhere(" and i.user_id= " + userId);
        int total = infoMapper.findMyInfoCount(userId);
        List<InfoDto> list = infoMapper.findMyInfoList(search);
        JqueryDto dto = new JqueryDto();
        dto.setTotal(total);
        pager.setObj(list);
        dto.setRows(list);
        return dto;
    }

    public Info findById(int id) {
        return infoMapper.findById(id);
    }
}
