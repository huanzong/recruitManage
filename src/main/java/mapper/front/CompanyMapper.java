package mapper.front;

import entity.Company;
import entity.operator;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository("CompanyMapper")
public interface CompanyMapper {

    @Insert("insert into company (fullname,username,userId,comtype,description,empcount,address,email,tel,manager,mTel,status) values(#{fullname},#{username},#{userId},#{comType},#{description},#{empcount},#{address},#{email},#{tel},#{manager},#{mTel},#{status}) ")
    public void insert(Company o);

    @Update("update company set fullname=#{fullname},username=#{username},comtype=#{comtype},description=#{description},empcount=#{empcount},address=#{address},email=#{email},tel=#{tel},manager=#{manager},mTel=#{mTel},status=#{status} where comId= #{comId} ")
    public void update(Company o);

    @Delete("delete from company where comId=#{id}")
    public void delete(int id);

    @Select("select * from company where comId=#{id}")
    public Company getById(int id);

    @Select("select * from company where fullname=#{fullname}")
    public Company getByCompanyName(String fullname);

    @Select("select * from company where userId = #{userId} limit 1")
    public Company findByUid(int userId);

}
