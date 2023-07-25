package com.proj.salad.review.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.proj.salad.review.vo.ReviewVO;

@Component("review_fileUtils")
public class FileUtils {
	
	public List<Map<String,Object>> parseInsertFileInfo(ReviewVO reviewVO, MultipartHttpServletRequest mRequest, String ReviewSeq, String filePath) throws Exception{
    	Iterator<String> iterator = mRequest.getFileNames();	//파일정보를 String타입으로 가져옴
    	
    	MultipartFile multipartFile = null;
    	String re_originalFileName = null;
    	String re_originalFileExtension = null;
    	String re_storedFileName = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();	//클라이언트에서 전송될 파일정보를 담아서 List로 반환
        Map<String, Object> listMap = null; 
        
        System.out.println("ReviewSeq: " + ReviewSeq);
        String re_articleNO = ReviewSeq;	//ServiceImpl에서 전달해준 map에서 신규생성되는 게시글 번호를 받아옴
        
        File file = new File(filePath);	//파일 저장경로에 해당폴더가 없을 경우 폴더 생성
        if(file.exists() == false){
        	file.mkdirs();
        }
        
        while(iterator.hasNext()){
        	multipartFile = mRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){	//파일이 있을 경우(이 코드가 없으면 파일 안 넣었을 때 오류 발생)
        		//파일 정보를 새로운 이름으로 변경
        		re_originalFileName = multipartFile.getOriginalFilename();	//파일 원본이름 가져옴
        		re_originalFileExtension = re_originalFileName.substring(re_originalFileName.lastIndexOf("."));	//해당 파일의 확장자 알아냄
        		re_storedFileName = CommonUtils.getRandomString() + re_originalFileExtension;	//getRandomString()메소드를 이용해 랜덤으로 32자리 파일이름 생성
        																															//원본파일의 확장자를 붙여줌
        		file = new File(filePath + re_storedFileName);	//서버에 실제파일 저장
        		multipartFile.transferTo(file);							//지정된 경로에 파일 생성
        		
        		//위에서 만든 정보를 list에 추가
        		listMap = new HashMap<String,Object>();
        		listMap.put("USERID", reviewVO.getUserId());
        		listMap.put("RE_ARTICLENO", re_articleNO);
        		listMap.put("RE_ORIGINALFILENAME", re_originalFileName);
        		listMap.put("RE_STOREDFILENAME", re_storedFileName);
        		listMap.put("RE_FILESIZE", multipartFile.getSize());
        		list.add(listMap);
        	}
        }
		return list;
	}
}
