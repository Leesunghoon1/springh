package com.myweb.www.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.www.service.boardService;

import lombok.extern.slf4j.Slf4j;


@RequestMapping("/board/*")
@Controller
@Slf4j
public class BoardController {
		// 폴더명 : board / mapping : board
		//mapping => /board/register
		//목적지 -> /board/register
	
	@Inject
	private boardService bsv;
	//서비스 연결 하기
	
	@GetMapping("/register")
	public String register() {
		return "/board/register/";
	}

}
