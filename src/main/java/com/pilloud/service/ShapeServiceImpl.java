package com.pilloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pilloud.mapper.ShapeMapper;
import com.pilloud.model.PillVO;
import com.pilloud.model.ShapeVO;

@Service
public class ShapeServiceImpl implements ShapeService{

	@Autowired
	ShapeMapper shapemapper;
	
	/* 모양 리스트 */
    @Override
    public List<String> selectShape() throws Exception {
        
        return shapemapper.selectShape();
    }
    
    /* 제형 리스트 */
    @Override
    public List<String> selectChartn() throws Exception {
        
        return shapemapper.selectChartn();
    }
    
    /* 색상 리스트 */
    @Override
    public List<String> selectColor() throws Exception {
        
        return shapemapper.selectColor();
    }
    
    /* 약뮬 검색리스트 */
    @Override
    public List<PillVO> searchPill(PillVO searchVo) throws Exception {
        
        return shapemapper.searchPill(searchVo);
    }
}

