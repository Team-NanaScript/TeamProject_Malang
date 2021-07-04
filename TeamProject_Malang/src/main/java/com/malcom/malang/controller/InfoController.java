package com.malcom.malang.controller;

import org.springframework.stereotype.Controller;

import com.malcom.malang.service.QnaService;
import com.malcom.malang.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class InfoController {

	protected final QnaService qService;
	protected final ReviewService rService;
	
	public String home() {
		return null;
	}
}
