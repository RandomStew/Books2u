package com.service.order;

import java.util.List;

import com.dto.order.OrderDTO;

public interface OrderService {

	public int orderDone(List<OrderDTO> orderList) throws Exception;

	public List<OrderDTO> orderList(String userId) throws Exception;

}
