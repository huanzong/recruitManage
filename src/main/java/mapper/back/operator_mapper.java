package mapper.back;

import entity.operator;
import mapper.Abase.Basic_mapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("operator_mapper")
public interface operator_mapper extends Basic_mapper {
    @Select("select operator.* from operator ${where} ${sort} ${limit} ")
    public List<operator> getByWhere(Search info);

    @Select("Select count(1) from operator ${where}")
    public long getByWhereSize(Search info);

    @Insert("insert into operator (name,phone,status,card,comment,account,pass,type) values(#{name},#{phone},#{status},#{card},#{comment},#{account},#{pass},#{type}) ")
    public void insert(operator o);

    @Update("update operator set name=#{name},status=#{status},phone=#{phone},card=#{card},comment=#{comment},account=#{account} where id= #{id} ")
    public void update(operator o);

    @Delete("delete from operator where id=#{id}")
    public void delete(int id);

    @Select("select * from operator where id=#{id}")
    public operator getById(int id);

    @Select("select * from operator where status = 0 and account=#{account} and pass=#{pass}")
    public operator login(operator t);

    @Update("update  operator set pass=#{pass} where id=#{id}")
    public void updatepass(operator t);

}
