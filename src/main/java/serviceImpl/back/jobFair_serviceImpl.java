package serviceImpl.back;

import entity.jobFair;
import mapper.back.jobFair_mapper;
import org.springframework.stereotype.Repository;
import service.back.jobFair_service;
import serviceImpl.Abase.Basic_serviceImpl;

import javax.annotation.Resource;

@Repository("jobFair_serviceImpl")
public class jobFair_serviceImpl extends Basic_serviceImpl<jobFair> implements jobFair_service {
    @Resource(name = "jobFair_mapper")
    jobFair_mapper mapper;


}
