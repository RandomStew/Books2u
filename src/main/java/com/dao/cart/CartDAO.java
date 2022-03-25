package com.dao.cart;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.cart.CartDTO;

@Repository("cartDAO")
public class CartDAO {
	
	@Autowired
	SqlSession session;
	
	public List<CartDTO> showCartList(String userId) throws Exception{
		return session.selectList("com.config.CartMapper.showCartList", userId);
	}
	public CartDTO showCartListByIsbn(Map<String,String> map) throws Exception{
		return session.selectOne("com.config.CartMapper.showCartListByIsbn", map);
	}
	
	
	public int addToCart(CartDTO dto) throws Exception{
		return session.insert("com.config.CartMapper.addToCart", dto);
	}
	
	public int countAllInCart(String userId) throws Exception{
		return session.selectOne("com.config.CartMapper.countAllInCart", userId);
	}
	
	public int updateBookAmount(CartDTO dto) throws Exception{
		return session.update("com.config.CartMapper.updateBookAmount", dto);
	}
	
	public int delToCart(Map<String, String> map) throws Exception{
		return session.insert("com.config.CartMapper.delToCart", map);
	}
	
	public int delToCartAll(String userId) throws Exception{
		return session.insert("com.config.CartMapper.delToCartAll", userId);
	}
}
