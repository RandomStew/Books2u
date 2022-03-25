package com.service.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.cart.CartDAO;
import com.dto.cart.CartDTO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO dao;
	
	@Override
	public List<CartDTO> showCartList(String userId) throws Exception {
		return dao.showCartList(userId);
	}
	
	@Override
	public CartDTO showCartListByIsbn(Map<String, String> map) throws Exception {
		return dao.showCartListByIsbn(map);
	}

	@Override
	public int addToCart(CartDTO dto) throws Exception {
		return dao.addToCart(dto);
	}

	@Override
	public int countAllInCart(String userId) throws Exception {
		return dao.countAllInCart(userId);
	}

	@Override
	public int updateBookAmount(CartDTO dto) throws Exception {
		return dao.updateBookAmount(dto);
	}

	@Override
	public int delToCart(Map<String, String> map) throws Exception {
		return dao.delToCart(map);
	}

	@Override
	public int delToCartAll(String userId) throws Exception {
		return dao.delToCartAll(userId);
	}

	

	
}
