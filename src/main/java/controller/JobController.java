package controller;

import dto.JobItemDTO;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.JobService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author yan
 * @date 2018/11/24 12:13
 * @descripition
 */
@Controller
public class JobController {
    private static final Logger logger = LogManager.getLogger(JobController.class);
    private JobService jobService;

    @Autowired
    public void setJobService(JobService jobService) {
        this.jobService = jobService;
    }

    @RequestMapping(value = "joblist", method = RequestMethod.GET)
    public String jobList() {
        return "joblist";
    }

    @ResponseBody
    @RequestMapping(value = "joblist", method = RequestMethod.POST)
    public List<JobItemDTO> jobList(@RequestParam int studentid,@RequestParam int page, @RequestParam(defaultValue = "") String keyword) {
        return jobService.findJobListById(1, page, keyword);
    }

    @RequestMapping("job")
    public String job(Model model, int jobId, HttpSession session) {
        model.addAttribute("job", jobService.findJobById(jobId));
        model.addAttribute("jobId",jobId);
        return "job";
    }

    @ResponseBody
    @RequestMapping("countjob")
    public int countJob(int studentid,@RequestParam(defaultValue = "") String keyword) {
        return jobService.countJob(1,keyword);
    }

    @RequestMapping(value = "addjob", method = RequestMethod.GET)
    public String addJob(int jobId) {
        return "job";
    }
    @ResponseBody
    @RequestMapping(value = "deleteJob", method = RequestMethod.POST)
    public void deleteJob(int jobId) {
        jobService.deleteJob(jobId);
    }
    @RequestMapping(value = "updatejob", method = RequestMethod.GET)
    public String updateJob(int jobId) {
        return "job";
    }

}
