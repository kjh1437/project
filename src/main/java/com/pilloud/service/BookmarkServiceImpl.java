package com.pilloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pilloud.mapper.BookmarkMapper;
import com.pilloud.mapper.PillMapper;
import com.pilloud.mapper.ShapeMapper;
import com.pilloud.model.PillVO;
import com.pilloud.model.ShapeVO;
import com.pilloud.model.UserVO;

@Service
public class BookmarkServiceImpl implements BookmarkService{

	@Autowired
	BookmarkMapper bookmarkmapper;
    
    /* 북마크 추가*/
    @Override
	public void insertBookmark(PillVO searchVo) throws Exception {
		
		bookmarkmapper.insertBookmark(searchVo);
		
	}
    
    /* 북마크 출력*/
    @Override
	public List<PillVO> selectBookmark(String id) throws Exception {
		
    	return bookmarkmapper.selectBookmark(id);
		
	}
    
    /* 북마크 출력(영양제)*/
    @Override
	public List<PillVO> selectBookmarkSupplement(String id) throws Exception {
		
    	return bookmarkmapper.selectBookmarkSupplement(id);
		
	}
    
    /* 북마크 삭제 */
    @Override
	public void deleteBookmark(PillVO vo) throws Exception {
		
    	bookmarkmapper.deleteBookmark(vo);
		
	}
    
    /* 약 알람 설정 업데이트 */
    @Override
	public int updateBookmarkAlarm(PillVO vo) throws Exception {
		
		return bookmarkmapper.updateBookmarkAlarm(vo);
	}
    
}

