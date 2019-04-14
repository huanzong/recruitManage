package mapper.back;

import entity.Company;
import mapper.Abase.Basic_mapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import utils.Search;

import java.util.List;

@Repository("companyBack_mapper")
public interface companyBack_mapper extends Basic_mapper {
    @Select("select * from company ${where} ${sort} ${limit} ")
    public List<Company> getByWhere(Search info);

    @Select("Select count(1) from company ${where}")
    public long getByWhereSize(Search info);

    @Delete("delete from company where id=#{id}")
    public void delete(int id);

    @Select("select * from company where comId=#{id}")
    public Company getById(int id);

    @Update("update company set fullname=#{fullname},username=#{username},comtype=#{comtype},description=#{description},empcount=#{empcount},address=#{address},email=#{email},tel=#{tel},manager=#{manager},mTel=#{mTel},status=#{status} where comId= #{comId} ")
    public void update(Company o);

}
