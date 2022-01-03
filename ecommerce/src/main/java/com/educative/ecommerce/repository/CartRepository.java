package com.educative.ecommerce.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.educative.ecommerce.model.Cart;
import com.educative.ecommerce.model.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {
	
	List<Cart> findAllByUserOrderByCreatedDateDesc(User user);

}
