package serviceImpl.back;

import entity.jobskill;
import mapper.back.jobskill_mapper;
import org.springframework.stereotype.Repository;
import service.back.jobskill_service;
import serviceImpl.Abase.Basic_serviceImpl;

import javax.annotation.Resource;

@Repository("jobskill_serviceImpl")
public class jobskill_serviceImpl extends Basic_serviceImpl<jobskill> implements jobskill_service {
    @Resource(name = "jobskill_mapper")
    jobskill_mapper mapper;

}
