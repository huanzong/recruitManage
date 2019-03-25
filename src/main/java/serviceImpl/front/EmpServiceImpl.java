package serviceImpl.front;

import entity.Emp;
import mapper.front.EmpMapper;
import org.springframework.stereotype.Service;
import service.front.EmpService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    @Resource
    EmpMapper empMapper;

    public boolean saveEmp(Emp emp) {
        int i = empMapper.insert(emp);
        if (i > 0) {
            return true;
        }
        return false;
    }


    public Emp findByUserId(Integer id) {

        return empMapper.findByUserId(id);
    }

    public boolean updateEmp(Emp dp) {
        try {
            empMapper.updateEmp(dp);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean updateEmpImg(Emp dp){
        try {
            empMapper.updateEmpImg(dp);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
