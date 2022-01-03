package com.educative.ecommerce.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.educative.ecommerce.model.User;
import com.educative.ecommerce.model.WishList;
import com.educative.ecommerce.repository.WishListRepository;

@Service
public class WishListService {
	
    @Autowired
    private WishListRepository wishListRepository;

    public void createWishlist(WishList wishList) {
        wishListRepository.save(wishList);
    }

    public List<WishList> readWishList(User user) {
        return wishListRepository.findAllByUserOrderByCreatedDateDesc(user);
    }

}
