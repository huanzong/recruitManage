package mapper.front;

import entity.ComResume;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository("ComResumeMapper")
public interface ComResumeMapper {


    @Insert("insert into com_resume (com_id, job_id, emp_id,resume_name, status, look)"+
    " `values (#{comId,jdbcType=INTEGER}, #{jobId,jdbcType=INTEGER}, #{empId,jdbcType=INTEGER},"+
            "#{resumeName,jdbcType=VARCHAR}, #{status,jdbcType=VARCHAR}, #{look,jdbcType=INTEGER})")
    public int insert(ComResume comResume);
}
