package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface boardService {

	int PostRegister(BoardVO bvo);

	List<BoardVO> getList(PagingVO pvo);

	BoardVO getDetail(long bno);

	int postModify(BoardVO bvo);

	int remove(int bno);

	int getTotalCount(PagingVO pvo);
}
