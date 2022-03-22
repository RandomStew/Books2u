package com.service.cart;

import java.util.List;
import java.util.Map;

import com.dto.cart.CartDTO;

public interface CartService {
	// 카트 조회
	public List<CartDTO> showCartList(String userId) throws Exception;
	
	// 카트에 담기
	public int addToCart(CartDTO dto) throws Exception;
	
	// 카트 수량 업데이트
	public int updateBookAmount(CartDTO dto) throws Exception;
	
	// 카트에서 책 제거(userId, isbn)
	public int delToCart(Map<String, String> map) throws Exception;
	
	// 카트 비우기(userId)
	public int delToCartAll(String userId) throws Exception;

}
