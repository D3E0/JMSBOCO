package service;

import dto.JobItemDTO;
import dto.JobSubmitRecordDTO;
import dto.JobSubmitRecordNumber;
import entity.JobEntity;
import entity.UserEntity;
import entity.UserType;
import mapper.JobMapper;
import mapper.JobSubmitItemMapper;
import mapper.UserMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author yan
 * @date 2018/11/24 11:32
 * @descripition
 */
@Service
public class JobServiceImpl implements JobService {
    private static final Logger logger = LogManager.getLogger(JobServiceImpl.class);
    private final UserMapper userMapper;
    private JobMapper jobMapper;
    private JobSubmitItemMapper jobSubmitItemMapper;
    @Autowired
    public void setJobSubmitItemMapper(JobSubmitItemMapper jobSubmitItemMapper) {
        this.jobSubmitItemMapper = jobSubmitItemMapper;
    }

    @Autowired
    public JobServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Autowired
    public void setJobMapper(JobMapper jobMapper) {
        this.jobMapper = jobMapper;
    }

    public List<JobItemDTO> findJobListById(int userId, int page, String keyword) {
        UserEntity userEntity=userMapper.selectOne(userId);
        if (userEntity.getType()== UserType.STUDENT) {
            return jobMapper.findJobListForStudent(userId,(page-1)*10, keyword);
        }
        else {
            return jobMapper.findJobListForTeacher(userId,(page-1)*10, keyword);
        }
    }

    public JobItemDTO findJobById(int jobId) {
        return jobMapper.findJobById(jobId);
    }

    public void jobItemSubmit(int jobId, int userId, String fileName) {
        if (jobSubmitItemMapper.isSameFile(jobId,fileName,userId)==0) {
            jobSubmitItemMapper.jobItemSubmit(jobId,fileName,userId);
        }
    }

    public int countJob(int userId, String keyword) {
        UserEntity userEntity=userMapper.selectOne(userId);
        if (userEntity.getType()== UserType.STUDENT) {
            return jobMapper.countJobForStudent(userId, keyword);
        }
        else {
            return jobMapper.countJobForTeacher(userId, keyword);
        }
    }

    public int deleteJob(int jobId) {
        return jobMapper.delete(jobId);
    }

    public int updateJob(JobEntity jobEntity) {
        return jobMapper.update(jobEntity);
    }

    public int addJob(JobEntity jobEntity) {
        return jobMapper.save(jobEntity);
    }

    public List<JobSubmitRecordDTO> getJobSubmitRecord(int jobId,int cur,String keyword,int limit) {
        return jobSubmitItemMapper.getJobSubmitRecord(jobId, (cur-1)*limit, keyword,limit);
    }

    public int countJobSubmitRecord(int jobId, String keyword) {
        return jobSubmitItemMapper.countJobSubmitRecord(jobId,keyword);
    }

    public JobSubmitRecordNumber countJobSubmitRecordNum(int jobId) {
        return jobSubmitItemMapper.countJobSubmitRecordNum(jobId);
    }

}
