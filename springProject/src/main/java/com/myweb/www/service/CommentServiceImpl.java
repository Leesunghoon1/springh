package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.repository.CommentDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService{
	
	@Inject
	private CommentDAO cdao;

	@Override
	public int addComment(CommentVO cvo) {
		// TODO Auto-generated method stub
		return cdao.addComment(cvo);
	}

	@Override
	public List<CommentVO> getList(int bno) {
		// TODO Auto-generated method stub
		return cdao.getList(bno);
	}

}
