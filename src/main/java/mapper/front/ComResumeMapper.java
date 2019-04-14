package mapper.front;

import entity.ComResume;
import entity.Company;
import mapper.Abase.Basic_mapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("ComResumeMapper")
public interface ComResumeMapper extends Basic_mapper {


    @Insert("insert into com_resume (com_id, job_id, emp_id,resume_name, status, look)" +
            " values (#{comId}, #{jobId}, #{empId},#{resumeName}, #{status}, #{look})")
    public void insert(ComResume comResume);


    @Select("select * from com_resume ${where} ${sort} ${limit} ")
    public List<ComResume> getByWhere(Search info);
}
