package mapper.front;

import dto.InfoDto;
import entity.Info;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("InfoMapper")
public interface InfoMapper {

    @Insert("insert into info (title, content, createDate,user_id, isApply, status)  values (#{title,jdbcType=VARCHAR}, #{content,jdbcType=VARCHAR}, #{createdate,jdbcType=VARCHAR},#{userId,jdbcType=INTEGER}, #{isapply,jdbcType=INTEGER}, #{status,jdbcType=INTEGER})")
    int insert(Info record);

    @Select("SELECT i.info_id AS infoId,i.title,i.content,i.createDate,i.status,i.isApply,i.user_id AS userId,u.account as username FROM info  i INNER JOIN user  u ON i.user_id = u.id where  1=1 ${where} ${sort} ${limit}")
    public List<InfoDto> findInfoList(Search search);

    @Select("SELECT COUNT(i.info_id) FROM info AS i INNER JOIN user AS u ON i.user_id = u.id where  1=1 ${where} ${sort} ${limit}")
    public int findInfoCount(Search search);

    @Select("SELECT COUNT(i.info_id) FROM info AS i INNER JOIN user AS u ON i.user_id = u.id where  1=1 and i.user_id=#{userId}")
    public int findMyInfoCount(int userId);

    @Select("SELECT i.info_id AS infoId,i.title,i.content,i.createDate,i.user_id AS userId,u.account as username FROM info  i INNER JOIN user  u ON i.user_id = u.id where  1=1")
    public List<InfoDto> findMyInfoList(Search search);

    @Select("SELECT * FROM info where info_id =#{id}")
    public Info findById(int id);

}