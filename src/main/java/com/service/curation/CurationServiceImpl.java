package com.service.curation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.dao.curation.CurationDAO;
import com.dto.curation.CurationDTO;

@Service("curationService")
public class CurationServiceImpl implements CurationService {

	@Autowired
	CurationDAO dao;
	
	@Override
	public List<CurationDTO> selectList(String genre) throws Exception {
		return dao.selectList(genre);
	}

}
