package com.dao.curation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.curation.CurationDTO;

public class CurationDAO {
	public List<CurationDTO> selectList(SqlSession session, String genre) throws Exception {
		return session.selectList("com.config.CurationMapper.selectList", genre);
	}
}
