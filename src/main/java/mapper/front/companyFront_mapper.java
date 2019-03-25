package mapper.front;

import entity.company;
import entity.operator;
import mapper.Abase.Basic_mapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository("companyFront_mapper")
public interface companyFront_mapper extends Basic_mapper {

    @Insert("insert into company (userId,name,comType,description,empCount,address,email,comTel,manager,mTel,trade,businessLicense) values(#{userId},#{name},#{comType},#{description},#{empCount},#{address},#{email},#{comTel},#{manager},#{mTel},#{trade},#{businessLicense}) ")
    public void insert(company o);

    @Update("update company set name=#{name},status=#{status},phone=#{phone},card=#{card},comment=#{comment},account=#{account} where id= #{id} ")
    public void update(operator o);

    @Delete("delete from company where id=#{id}")
    public void delete(int id);

    @Select("select * from company where id=#{id}")
    public company getById(int id);

}
