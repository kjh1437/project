package com.pilloud.mapper;

import java.util.List;

import com.pilloud.model.PillVO;
import com.pilloud.model.ShapeVO;

public interface PillMapper {

    /* 의약품 검색 리스트 */
	public List<PillVO> searchPillNm(PillVO searchVo) throws Exception;
	
	/* 의약품 검색 리스트(키워드) */
	public List<PillVO> searchKeyword(PillVO searchVo) throws Exception;
    
	/* 의약품 주의사항검색 리스트 */
	public List<PillVO> searchPillWarn(String searchVo);
    
}
