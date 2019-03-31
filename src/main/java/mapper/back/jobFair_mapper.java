package mapper.back;

import entity.jobFair;
import entity.news;
import mapper.Abase.Basic_mapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("jobFair_mapper")
public interface jobFair_mapper extends Basic_mapper {
    @Select("select * from job_fair ${where} ${sort} ${limit} ")
    public List<jobFair> getByWhere(Search info);

    @Select("Select count(1) from job_fair ${where}")
    public long getByWhereSize(Search info);

    @Insert("insert into job_fair (title,postion,startTime,endTime,companyCount,comment) values(#{title},#{postion},#{startTime},#{endTime},#{companyCount},#{comment}) ")
    public void insert(jobFair o);

    @Update("update job_fair set title=#{title},postion=#{postion},startTime=#{startTime},endTime=#{endTime},companyCount=#{companyCount},comment=#{comment} where id= #{id} ")
    public void update(jobFair o);

    @Delete("delete from job_fair where id=#{id}")
    public void delete(int id);

    @Select("select * from job_fair where id=#{id}")
    public jobFair getById(int id);

}
