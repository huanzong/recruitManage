package mapper.front;

import entity.operator;
import entity.user;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository("UserMapper")
public interface UserMapper {

    @Insert("insert into " + user.TABLE_NAME + " (account,pass,question,answer,type,status) values(#{account},#{pass},#{question},#{answer},#{type},#{status}) ")
    public void insert(user o);

    @Select("select * from " + user.TABLE_NAME + " where account=#{account}")
    public user getUserByAccount(String account);

    @Select("select * from " + user.TABLE_NAME + " where status = 1 and account=#{account} and pass=#{pass}")
    public user login(user t);

    @Update("update  user set pass=#{pass} where id=#{id}")
    public void updateUserPass(user t);


}