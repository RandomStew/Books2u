package com.dao.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.order.OrderDTO;

public class OrderDAO {

	public int orderDone(SqlSession session, List<OrderDTO> orderList) throws Exception {
		return session.insert("com.config.OrderMapper.orderDone", orderList);
	}

	public List<OrderDTO> orderList(SqlSession session, String userId) throws Exception {
		return session.selectList("com.config.OrderMapper.orderList", userId);
	}

}
