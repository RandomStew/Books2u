package com.service.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.order.OrderDAO;
import com.dto.order.OrderDTO;

public class OrderServiceImpl implements OrderService {

	@Override
	public int orderDone(List<OrderDTO> orderList) throws Exception {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			OrderDAO dao = new OrderDAO();
			num = dao.orderDone(session, orderList);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	@Override
	public List<OrderDTO> orderList(String userId) throws Exception {
		List<OrderDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			OrderDAO dao = new OrderDAO();
			list = dao.orderList(session, userId);
		} finally {
			session.close();
		}
		return list;
	}

}
