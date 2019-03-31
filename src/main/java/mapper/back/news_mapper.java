package mapper.back;

import entity.news;
import entity.operator;
import mapper.Abase.Basic_mapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("news_mapper")
public interface news_mapper extends Basic_mapper {
    @Select("select * from news ${where} ${sort} ${limit} ")
    public List<news> getByWhere(Search info);

    @Select("Select count(1) from news ${where}")
    public long getByWhereSize(Search info);

    @Insert("insert into news (title,content,createTime,picUrl,newsArea,newsStar) values(#{title},#{content},#{createTime},#{picUrl},#{newsArea},#{newsStar}) ")
    public void insert(news o);

    @Update("update news set title=#{title},content=#{content},picUrl=#{picUrl},newsArea=#{newsArea},newsStar=#{newsStar} where id= #{id} ")
    public void update(news o);

    @Delete("delete from news where id=#{id}")
    public void delete(int id);

    @Select("select * from news where id=#{id}")
    public news getById(int id);

    @Update("update news set picUrl=#{picUrl} where id=#{id}")
    public void updateNewsPic(news o);

}
