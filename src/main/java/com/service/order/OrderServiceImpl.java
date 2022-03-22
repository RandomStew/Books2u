package com.service.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.order.OrderDAO;
import com.dto.order.OrderDTO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO dao;
	
	@Override
	public int orderDone(List<OrderDTO> orderList) throws Exception {
		return dao.orderDone(orderList);
	}

	@Override
	public List<OrderDTO> orderList(String userId) throws Exception {
		return dao.orderList(userId);
	}

}
