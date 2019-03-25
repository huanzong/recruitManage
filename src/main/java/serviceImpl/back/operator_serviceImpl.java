package serviceImpl.back;

import entity.operator;
import mapper.back.operator_mapper;
import org.springframework.stereotype.Repository;
import service.back.operator_service;
import serviceImpl.Abase.Basic_serviceImpl;

import javax.annotation.Resource;

@Repository("operator_serviceImpl")
public class operator_serviceImpl extends Basic_serviceImpl<operator> implements operator_service {
    @Resource(name = "operator_mapper")
    operator_mapper mapper;

    public operator login(operator t) {
        return mapper.login(t);
    }

    public void updatepass(operator t) {
        mapper.updatepass(t);
    }

}
