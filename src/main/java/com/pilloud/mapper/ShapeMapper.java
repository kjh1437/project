package com.pilloud.mapper;

import java.util.List;

import com.pilloud.model.PillVO;
import com.pilloud.model.ShapeVO;

public interface ShapeMapper {

	/* 모양 리스트 */
    public List<String> selectShape() throws Exception;
    
    /* 제형 리스트 */
    public List<String> selectChartn() throws Exception;
    
    /* 색상 리스트 */
    public List<String> selectColor() throws Exception;
    
    /* 약뮬 검색리스트 */
    public List<PillVO> searchPill(PillVO searchVo) throws Exception;
    
}
