package com.malcom.malang.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.malcom.malang.dao.FileDao;
import com.malcom.malang.service.FileService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class FileServiceImplV1 implements FileService{
	
	protected final String winPath;

	// 리소스를 읽어오는 기능 제공 인터페이스
	@Autowired
	private ResourceLoader resLoader;
	
	@Autowired
	public void create_table(FileDao fDao) {
		
		Map<String, String> maps = new HashMap<String, String>();
		fDao.create_table(maps);
		
	}
	
	@Override
	public String fileUp(MultipartFile one_file) throws IOException {
		// TODO Auto-generated method stub
		
		String originalFileName = one_file.getOriginalFilename();
		
		if(originalFileName.isEmpty() || originalFileName == null) {
			
			return null;
		}
		
		String fileUploadPath = this.winPath;
		
		
//		Resource res = resLoader.getResource("/images/");
//		String fileUri_path = res.getURI().getPath();
		
		String strUUID = UUID.randomUUID().toString();
		strUUID += originalFileName;
		
		File upload = new File(fileUploadPath, strUUID);
		
		// Byte 형태로 되어있는 데이터를
		// File 객체를 이용하여 선언한 upload 변수에
		// 설정된 주소 (fileUri_path + strUUID) 로 전송 
		one_file.transferTo(upload); 
		 
		log.debug("파일 {}",strUUID);
		
		return strUUID;
	}

	@Override
	public List<String> filesUp(MultipartHttpServletRequest multi_file) throws IOException {
		// TODO Auto-generated method stub
		
		List<String> fileNames = new ArrayList<String>();
		String tagName = "multi_file";
		
		List<MultipartFile> fileList = multi_file.getFiles(tagName);
		for(int i = 0 ; i < fileList.size() ; i++) {
			
			MultipartFile file = fileList.get(i);
			String fileName = this.fileUp(file);
			fileNames.add(fileName);
			
			
		}
		
		
		return fileNames;
	}

	
	
}
