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

    @Insert("insert into company (userId,name,comType,description,empCount,address,email,comTel,manager,mTel,trade,businessLicense) values(#{userId},#{name},#{comType},#{description},#{empCount},#{address},#{email},#{comTel},#{manager},#{mTel},#{trade},#{businessLicense}) ")
    public void insert(Company o);

    @Update("update company set fullname=#{fullname},username=#{username},comtype=#{comtype},description=#{description},empcount=#{empcount},address=#{address},email=#{email},tel=#{tel},manager=#{manager},mTel=#{mTel} where userId= #{userId} ")
    public void update(Company o);

    @Delete("delete from company where id=#{id}")
    public void delete(int id);

    @Select("select * from company where id=#{id}")
    public Company getById(int id);

    @Select("select * from company where fullname=#{fullname}")
    public Company getByCompanyName(String fullname);

}
