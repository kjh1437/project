package com.pilloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pilloud.mapper.PillMapper;
import com.pilloud.mapper.ShapeMapper;
import com.pilloud.model.PillVO;
import com.pilloud.model.ShapeVO;

@Service
public class PillServiceImpl implements PillService{

	@Autowired
	PillMapper pillmapper;
    
    /* 의약품 검색리스트 */
    @Override
    public List<PillVO> searchPillNm(PillVO searchVo) throws Exception {
        
        return pillmapper.searchPillNm(searchVo);
    }
    
    /* 의약품 검색리스트(키워드) */
    @Override
    public List<PillVO> searchKeyword(PillVO searchVo) throws Exception {
        
        return pillmapper.searchKeyword(searchVo);
    }

	@Override
	public List<PillVO> searchPillWarn(List<String> seq) {
		// TODO Auto-generated method stub
		String seqList = "";
		for(int i =0;i<seq.size();i++) {
			if(i==(seq.size()-1)) {
				seqList+="'"+seq.get(i).toString()+"'";
			}else {
				seqList+="'"+seq.get(i).toString()+"',";
			}
		}
		return pillmapper.searchPillWarn(seqList);
	}
	
	
}

