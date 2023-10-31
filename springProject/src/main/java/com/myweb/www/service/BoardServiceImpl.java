package com.myweb.www.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.repository.BoardDAO;



@Service
public class BoardServiceImpl implements boardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public int PostRegister(BoardVO bvo) {
		// TODO Auto-generated method stub
		return bdao.PostRegister(bvo);
	}
	
}
