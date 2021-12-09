package com.malcom.malang.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface FileService {

	public String fileUp(MultipartFile one_file) throws IOException;
	public List<String> filesUp(MultipartHttpServletRequest multi_file) throws IOException;
	
}
