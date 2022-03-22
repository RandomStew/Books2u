package com.service.curation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.curation.CurationDTO;

public interface CurationService {
	public List<CurationDTO> selectList(String genre) throws Exception;

}
