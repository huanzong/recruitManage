package serviceImpl.front;

import entity.Company;
import mapper.front.CompanyMapper;
import org.springframework.stereotype.Service;
import service.front.CompanyService;

import javax.annotation.Resource;
import java.util.List;


@Service
public class CompanyServiceImpl implements CompanyService {

    @Resource
    CompanyMapper companyMapper;


    /**
     * 根据用户名查找用户
     *
     * @param username
     * @return
     */
    public Company findByCompanyname(String username) {
        return companyMapper.getByCompanyName(username);
    }

    public boolean saveCompany(Company com) {
        try {
            companyMapper.insert(com);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public Company findByUid(int uid) {
//        CompanyCriteria cc = new CompanyCriteria();
//        cc.createCriteria().andUserIdEqualTo(uid);
//        List<Company> list = companyMapper.selectByExample(cc);
//        if (list != null && list.size() > 0) {
//            return list.get(0);
//        }
        return null;
    }

    public boolean updateCompany(Company company) {
        try {
            companyMapper.update(company);
        } catch (Exception e) {
            return false;
        }
        return true;
    }


}
