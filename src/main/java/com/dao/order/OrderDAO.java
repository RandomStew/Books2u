package com.dao.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.order.OrderDTO;

@Repository("orderDAO")
public class OrderDAO {

	@Autowired
	SqlSession session;
	
	public int orderDone(List<OrderDTO> orderList) throws Exception {
		return session.insert("com.config.OrderMapper.orderDone", orderList);
	}

	public List<OrderDTO> orderList(String userId) throws Exception {
		return session.selectList("com.config.OrderMapper.orderList", userId);
	}

}
