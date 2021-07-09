package com.malcom.malang.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.malcom.malang.model.ItemVO;

public interface insertService {

	public int insert(ItemVO itVO, MultipartFile file, MultipartHttpServletRequest files) throws IOException;

	public String test(MultipartFile file) throws IOException;

}
