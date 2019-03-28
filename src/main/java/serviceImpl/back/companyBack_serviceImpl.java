package serviceImpl.back;

import entity.Company;
import mapper.back.companyBack_mapper;
import org.springframework.stereotype.Service;
import service.back.companyBack_service;
import serviceImpl.Abase.Basic_serviceImpl;

import javax.annotation.Resource;

@Service("companyBack_serviceImpl")
public class companyBack_serviceImpl extends Basic_serviceImpl<Company> implements companyBack_service {
    @Resource(name = "companyBack_mapper")
    companyBack_mapper mapper;

}
