package mapper.front;

import dto.JobDto;
import entity.Job;
import entity.TopJob;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("jobDao")
public interface JobDao {


    @Insert("insert into job (com_id, job_name, job_PersonCount,degree, language, grade,address, salary, job_status,start_date, end_date, description) " +
            "values (#{comId,jdbcType=INTEGER}, #{jobName,jdbcType=VARCHAR}, #{jobPersoncount,jdbcType=INTEGER}," +
            " #{degree,jdbcType=VARCHAR}, #{language,jdbcType=VARCHAR}, #{grade,jdbcType=VARCHAR}," +
            "#{address,jdbcType=VARCHAR}, #{salary,jdbcType=VARCHAR}, #{jobStatus,jdbcType=VARCHAR}," +
            "#{startDate,jdbcType=VARCHAR}, #{endDate,jdbcType=VARCHAR}, #{description,jdbcType=VARCHAR})")
    public int insert(Job job);

    @Select("select t.top_id as topId,t.job_id as jobId,t.job_name as jobName,t.count as count FROM top_job AS t order by count desc limit 0,10")
    public List<JobDto> findTopTen();

    @Select("SELECT j.job_id AS jobId,j.com_id AS comId," +
            "j.job_name AS jobName," +
            "j.job_PersonCount AS jobPersoncount," +
            "j.degree AS degree," +
            "j.language AS language," +
            "j.grade," +
            "j.address AS address," +
            "j.salary AS salary," +
            "j.job_status AS jobStatus," +
            "j.start_date AS startDate," +
            "j.end_date AS endDate," +
            "j.description AS description," +
            "c.fullname AS fullname," +
            "c.userId AS userId," +
            "c.comtype AS comtype," +
            "c.description AS comDescription," +
            "c.empcount AS empcount," +
            "c.address AS comAddress," +
            "c.email AS email," +
            "c.tel AS tel," +
            "c.manager AS manager," +
            "c.mTel AS mTel" +
            " FROM " +
            " job AS j" +
            " INNER JOIN company AS c ON j.com_id = c.comId where j.job_id=#{id}")
    public JobDto findByJobId(int id);

    @Update("update top_job t set t.count=t.count+1 where t.job_id=#{jobId,jdbcType=INTEGER}")
    public int updateTopJob(int jobId);

    @Select("SELECT COUNT(j.job_id) FROM job AS j INNER JOIN company AS c ON j.com_id = c.comId where 1=1 ${where}")
    public int findJobListCount(Search info);

    @Select("SELECT j.job_id AS jobId,j.com_id AS comId,j.job_name AS jobName,j.job_PersonCount AS jobPersoncount,j.degree AS degree,j.language AS language,j.grade,j.address AS address,j.salary AS salary,j.job_status AS jobStatus,j.start_date AS startDate,j.end_date AS endDate,j.description AS description,c.fullname AS fullname FROM job AS j INNER JOIN company AS c ON j.com_id = c.comId where 1=1 ${where} ${sort} ${limit}")
    public List<JobDto> findJobList(Search info);

    @Insert("insert into top_job (job_id, job_name, count) values (#{jobId,jdbcType=INTEGER}, #{jobName,jdbcType=VARCHAR}, #{count,jdbcType=INTEGER})")
    public void insertTopJob(TopJob tj);


}
