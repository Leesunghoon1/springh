package com.myweb.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.repository.BoardDAO;



@Service
public class BoardServiceImpl implements boardService{
	
	@Inject
	private BoardDAO bdao;
	
}
