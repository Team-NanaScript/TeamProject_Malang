package com.malcom.malang.service;

import java.io.IOException;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.SelectOptionVO;

public interface insertService {

	public int insert(ItemVO itVO, SelectOptionVO soVO, 
				MultipartFile file, MultipartHttpServletRequest files, Model model) throws IOException;


}
