package service.front;


import dto.JobDto;
import entity.Job;
import utils.JqueryDto;
import utils.Pager;

import java.util.List;

public interface JobService {

    public boolean saveJob(Job job);

    public List<JobDto> findTen();

    public JobDto findByJobId(int id);

    public JqueryDto findJobList(Pager pager, Job job);

    public JqueryDto findHistoryJobList(Pager pager,Job job,int userId);

}
