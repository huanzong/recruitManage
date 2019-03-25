package serviceImpl.front;

import dto.JobDto;
import entity.Job;
import mapper.front.JobDao;
import org.springframework.stereotype.Service;
import service.front.JobService;
import utils.JqueryDto;
import utils.Pager;
import utils.Search;

import javax.annotation.Resource;
import java.util.List;


@Service
public class JobServiceImpl implements JobService {

    @Resource
    JobDao jobDao;


    public List<JobDto> findTen() {
        return jobDao.findTopTen();
    }

    public JobDto findByJobId(int id) {
        saveTopJob(id);
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

    public JqueryDto findHistoryJobList(Pager pager, Job job, int userId) {
        //查询总数
//        int total=jobDao.findHistoryJobListcount(job.getJobName(),userId);
//        int start =Integer.parseInt(pager.getPage())-1;
//        List<JobDto> list=jobDao.findHistoryJobList(job.getJobName(), userId,start, Integer.parseInt(pager.getRows()));
//        JqueryDto dto=new JqueryDto();
//        dto.setTotal(total);
//        pager.setObj(list);
////				String json = net.sf.json.JSONArray.fromObject(pager.getObj()).toString();
//        dto.setRows(list);
        //查询分页条数
//        return dto;
        return null;
    }


}
