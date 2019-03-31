package mapper.back;

import entity.jobskill;
import mapper.Abase.Basic_mapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("jobskill_mapper")
public interface jobskill_mapper extends Basic_mapper {
    @Select("select * from jobskill ${where} ${sort} ${limit} ")
    public List<jobskill> getByWhere(Search info);

    @Select("Select count(1) from jobskill ${where}")
    public long getByWhereSize(Search info);

    @Insert("insert into jobskill (title,content,createTime,isHot,status) values(#{title},#{content},#{createTime},#{isHot},#{status}) ")
    public void insert(jobskill o);

    @Update("update jobskill set title=#{title},content=#{content},isHot=#{isHot},status=#{status} where id= #{id} ")
    public void update(jobskill o);

    @Delete("delete from jobskill where id=#{id}")
    public void delete(int id);

    @Select("select * from jobskill where id=#{id}")
    public jobskill getById(int id);


}
