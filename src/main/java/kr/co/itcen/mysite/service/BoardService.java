package kr.co.itcen.mysite.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.mysite.repository.BoardDao;
import kr.co.itcen.mysite.vo.BoardVo;
import kr.co.itcen.mysite.vo.GuestbookVo;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;
	
	public List<BoardVo> getList() {
		return boardDao.getList();
		
	}
	
	public void insert(BoardVo vo) {
		boardDao.insert(vo);
		
	}

	public void update(Long no) {
		boardDao.update(no);
		
	}

	public void commentInsert(BoardVo vo) {
		boardDao.commentInsert(vo);
		
	}

	public void update(String gNo, String oNo) {
		boardDao.update(Integer.parseInt(gNo),Integer.parseInt(oNo));
	}
}
