package service;

import dto.JobFilePrefix;
import entity.QiniuEntity;
import org.springframework.web.multipart.MultipartFile;
import vo.FileVO;
import vo.FileVOs;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author yan
 * @date 2018/12/5 17:28
 * @descripition
 */
public interface FileService {
    String getUploadToken(int courseId);

    List<FileVO> getFileList(int courseId, int jobId, int studentId);

    List<FileVO> getAllPublicFile(int courseId);

    FileVOs getPublicFiles(int courseId, int page);

    String queryDomain(int courseId);

    int deleteFile(int courseId, String key, int jobId);

    JobFilePrefix findFilePrefixByJobId(int jobId);

    List<FileVO> getAllFile(int courseId, int jobId);

    FileVO getResource(int courseId, String path);

    int deleteResource(int courseId, String path);

    String getPublicUrl(String remoteSrcUrl, String key);
    int  uploadMDimages(String key, MultipartFile file) throws IOException;
    String queryMDimagesDomain();
}
