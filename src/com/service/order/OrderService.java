package com.service.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.order.OrderDTO;

public interface OrderService {
	public int orderDone(List<OrderDTO> orderList) throws Exception;

}
