package com.pilloud.service;

import java.util.List;

import com.pilloud.model.PillVO;
import com.pilloud.model.ShapeVO;
import com.pilloud.model.UserVO;

public interface PillService {

    /* 의약품 검색리스트 */
	public List<PillVO> searchPillNm(PillVO searchVo) throws Exception;
	
	/* 의약품 검색리스트(키워트로 검색) */
	public List<PillVO> searchKeyword(PillVO searchVo) throws Exception;

	public List<PillVO> searchPillWarn(List<String> seqList);
    
}
