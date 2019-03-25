package mapper.back;

import entity.user;
import mapper.Abase.Basic_mapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("userReview_mapper")
public interface userReview_mapper extends Basic_mapper<user> {

    @Select("select user.* from user ${where} ${sort} ${limit} ")
    public List<user> getByWhere(Search info);

    @Select("select count(1) from user ${where}")
    public long getByWhereSize(Search info);

    @Insert("insert into user (account,pass,question,answer,type,status) values(#{account},#{pass},#{question},#{answer},#{type},#{status}) ")
    public void insert(user o);

    @Update("update user set account=#{account},pass=#{pass},question=#{question},answer=#{answer},type=#{type},status=#{status} where id=#{id} ")
    public void update(user o);

    @Delete("delete from user where id=#{id}")
    public void delete(int id);

    @Select("select * from user where id=#{id}")
    public user getById(int id);

}
