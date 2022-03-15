package com.service.curation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.curation.CurationDAO;
import com.dto.curation.CurationDTO;

public class CurationServiceImpl implements CurationService {

	@Override
	public List<CurationDTO> selectList(String genre) throws Exception {
		List<CurationDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			CurationDAO dao = new CurationDAO();
			list = dao.selectList(session, genre);
		} finally {
			session.close();
		}
		return list;
	}

}
