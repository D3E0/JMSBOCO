import com.qiniu.util.Auth;
import com.sun.deploy.net.URLEncoder;
import config.RootConfig;
import dto.CourseItemDto;
import dto.JobItemDTO;
import entity.QiniuEntity;
import mapper.CourseMapper;
import mapper.JobMapper;
import mapper.QiniuMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @author yan
 * @date 2018/11/24 11:57
 * @descripition
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class MapperTest {
    private JobMapper jobMapper;
    private CourseMapper courseMapper;
    private QiniuMapper qiniuMapper;
    @Autowired
    public void setQiniuMapper(QiniuMapper qiniuMapper) {
        this.qiniuMapper = qiniuMapper;
    }

    @Autowired
    public void setCourseMapper(CourseMapper mapper) {
        this.courseMapper = mapper;
    }

    @Autowired
    public void setJobMapper(JobMapper jobMapper) {
        this.jobMapper = jobMapper;
    }

    @Test
    public void testJob() throws UnsupportedEncodingException {
        List<JobItemDTO> list=jobMapper.findJobListByIdAndKeyword(1,0,"");
        String fileName = "1/1/1/640.jpg";
        String domainOfBucket = "http://phptyenkh.bkt.clouddn.com";
        String encodedFileName = URLEncoder.encode(fileName, "utf-8");
        String publicUrl = String.format("%s/%s", domainOfBucket, encodedFileName);
        QiniuEntity qiniuEntity=qiniuMapper.getQiniuByCourseId(1);
        Auth auth = Auth.create(qiniuEntity.getAk(), qiniuEntity.getSk());
        System.out.println(auth.privateDownloadUrl(publicUrl));

    }
    @Test
    public void testCourse() {
        List<CourseItemDto> list=courseMapper.findCourseListById(1,1);
        System.out.println(list.get(0).toString());
    }
}
