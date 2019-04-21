package serviceImpl.front;

import dto.JobDto;
import entity.ComResume;
import entity.Emp;
import entity.Job;
import entity.TopJob;
import mapper.front.ComResumeMapper;
import mapper.front.JobDao;
import org.springframework.stereotype.Service;
import service.front.EmpService;
import service.front.JobService;
import utils.JqueryDto;
import utils.Pager;
import utils.Search;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Service
public class JobServiceImpl implements JobService {

    @Resource
    JobDao jobDao;
    @Resource
    ComResumeMapper comResumeMapper;
    @Resource
    EmpService empService;

    public boolean saveJob(Job job) {
        try {
            jobDao.insert(job);
            TopJob tj = new TopJob();
            tj.setCount(0);
            tj.setJobId(job.getJobId());
            tj.setJobName(job.getJobName());
            jobDao.insertTopJob(tj);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public List<JobDto> findTen() {
        return jobDao.findTopTen();
    }

    public JobDto findByJobId(int id) {
        saveTopJob(id);
        return jobDao.findByJobId(id);
    }
    public JobDto findByJob(int id) {
        return jobDao.findByJobId(id);
    }

    public boolean saveTopJob(int jobId) {
        int i = jobDao.updateTopJob(jobId);
        if (i > 0) {
            return true;
        }
        return false;
    }

    public JqueryDto findJobList(Pager pager, Job job) {
        String selectSqlCount = "";
        Search info = new Search();
        if (job != null && job.getJobName() != "" && job.getJobName() != null) {
            selectSqlCount = " AND ( j.job_name LIKE  " + job.getJobName() + " or j.address like " + job.getJobName() + "  or c.fullname like " + job.getJobName() + " or j.job_status LIKE " + job.getJobName() + " or j.description like " + job.getJobName() + ") ";
            info.setWhere(selectSqlCount);
        }
        //查询总数
        int total = jobDao.findJobListCount(info);
        int start = Integer.parseInt(pager.getPage()) - 1;
        info.setPage(start);
        info.setRows(Integer.parseInt(pager.getRows()));
        List<JobDto> list = jobDao.findJobList(info);
        JqueryDto dto = new JqueryDto();
        dto.setTotal(total);
        pager.setObj(list);
        dto.setRows(list);
        return dto;
    }

    public JqueryDto findHistoryJobList(Pager pager, int userId) {
        JqueryDto dto = new JqueryDto();
        Emp emp = empService.findByUserId(userId);
        if (emp == null) {
            return null;
        }
        int empId = emp.getEmpId();
        Search info = new Search();
        info.setPage(Integer.parseInt(pager.getPage()) - 1);
        info.setRows(Integer.parseInt(pager.getRows()));
        info.setWhere(" where com_resume.emp_id =" + empId);
        List<ComResume> comResumeList = comResumeMapper.getByWhere(info);
        if (comResumeList == null) {
            return dto;
        }
        List list = new ArrayList();
        for (int i = 0; i < comResumeList.size(); i++) {
            ComResume comResume = comResumeList.get(i);
            int comId = comResume.getCom_id();
            int jobId = comResume.getJob_id();
            if(comId == 0 || jobId == 0){
                continue;
            }
            JobDto jobDto = jobDao.findByJobId(jobId);
            list.add(jobDto);
        }
        dto.setTotal(list.size());
        dto.setRows(list);
        return dto;
    }


}
