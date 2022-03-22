package com.dao.curation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.curation.CurationDTO;

@Repository("curationDAO")
public class CurationDAO {
	
	@Autowired
	SqlSession session;
	
	public List<CurationDTO> selectList(String genre) throws Exception {
		return session.selectList("com.config.CurationMapper.selectList", genre);
	}
}
