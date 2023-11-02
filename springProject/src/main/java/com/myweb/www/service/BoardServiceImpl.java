package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.repository.BoardDAO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class BoardServiceImpl implements boardService{
	
	@Inject
	private BoardDAO bdao;

	@Override
	public int PostRegister(BoardVO bvo) {
		// TODO Auto-generated method stub
		return bdao.PostRegister(bvo);
	}


	@Transactional
	@Override
	public BoardVO getDetail(long bno) {
		// TODO Auto-generated method stub
		
		int isOK = bdao.readCount(bno);
		log.info("조회수 >> " + (isOK > 0 ? "UP" : "ERROR"));
		return bdao.getDetail(bno);
	}

	@Override
	public int postModify(BoardVO bvo) {
		// TODO Auto-generated method stub
		return bdao.postModify(bvo);
	}

	@Override
	public int remove(int bno) {
		// TODO Auto-generated method stub
		return bdao.remove(bno);
	}

	@Override
	public int getTotalCount(PagingVO pvo) {
		// TODO Auto-generated method stub
		return bdao.getTotalCount(pvo);
	}

	@Override
	public List<BoardVO> getList(PagingVO pvo) {
		// TODO Auto-generated method stub
				return bdao.getList(pvo);
	}


	
}
