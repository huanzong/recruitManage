package mapper.front;

import entity.Emp;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository("EmpMapper")
public interface EmpMapper {


    @Insert("insert into emp (realname, sex, birthday, marry, degree, tel, email, description, address, jobtype, salary, jobstatus, image, resume_name, user_id, country, qq, hj, waddress, study, work, family, experience, language)" +
            "values (#{realname,jdbcType=VARCHAR}, #{sex,jdbcType=VARCHAR}, #{birthday,jdbcType=VARCHAR}," +
            " #{marry,jdbcType=VARCHAR}, #{degree,jdbcType=VARCHAR}, #{tel,jdbcType=VARCHAR}," +
            " #{email,jdbcType=VARCHAR}, #{description,jdbcType=VARCHAR}, #{address,jdbcType=VARCHAR}," +
            " #{jobtype,jdbcType=VARCHAR}, #{salary,jdbcType=VARCHAR}, #{jobstatus,jdbcType=VARCHAR}," +
            " #{image,jdbcType=VARCHAR}, #{resumeName,jdbcType=VARCHAR}, #{userId,jdbcType=INTEGER}," +
            "#{country,jdbcType=VARCHAR}, #{qq,jdbcType=VARCHAR}, #{hj,jdbcType=VARCHAR}, #{waddress,jdbcType=VARCHAR}," +
            "#{study,jdbcType=VARCHAR}, #{work,jdbcType=VARCHAR}, #{family,jdbcType=VARCHAR}," +
            " #{experience,jdbcType=VARCHAR}, #{language,jdbcType=VARCHAR})")
    public int insert(Emp record);


    @Select("select *,e.emp_id as empId from emp e where e.user_id =#{id} limit 0,1 ")
    public Emp findByUserId(int id);

    @Update("update emp set " +
            " realname = #{realname},sex = #{sex}," +
            " birthday = #{birthday},marry = #{marry}," +
            " degree = #{degree},tel = #{tel}," +
            " email = #{email},description = #{description}," +
            " address = #{address},jobtype = #{jobtype}," +
            " salary = #{salary},jobstatus = #{jobstatus}," +
            " image = #{image},resume_name = #{resumeName}," +
            " user_id = #{userId},country = #{country}," +
            " qq = #{qq},hj = #{hj}," +
            " waddress = #{waddress},study = #{study}," +
            " work = #{work},family = #{family}," +
            " experience = #{experience},language = #{language} where emp_id = #{empId}")
    public void updateEmp(Emp dp);

    @Update("update emp set image=#{image} where emp_id = #{empId}")
    public void updateEmpImg(Emp dp);

}
