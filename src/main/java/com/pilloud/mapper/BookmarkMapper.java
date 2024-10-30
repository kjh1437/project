package com.pilloud.mapper;

import java.util.List;

import com.pilloud.model.PillVO;
import com.pilloud.model.UserVO;

public interface BookmarkMapper {

    /* 북마크 추가 */
	public void insertBookmark(PillVO searchVo) throws Exception;
    
	/* 북마크 출력 */
	public List<PillVO> selectBookmark(String id) throws Exception;
	
	/* 북마크 출력(영양제) */
	public List<PillVO> selectBookmarkSupplement(String id) throws Exception;
	
	/* 북마크 삭제 */
	public void deleteBookmark(PillVO vo) throws Exception;
	
	/* 약 알람 설정 업데이트  */
	public int updateBookmarkAlarm(PillVO vo) throws Exception;
	
}
