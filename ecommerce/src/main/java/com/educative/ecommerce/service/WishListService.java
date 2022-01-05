package com.educative.ecommerce.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.educative.ecommerce.model.WishList;
import com.educative.ecommerce.repository.WishListRepository;

@Service
@Transactional
public class WishListService {

    private final WishListRepository wishListRepository;

    public WishListService(WishListRepository wishListRepository) {
        this.wishListRepository = wishListRepository;
    }

    public void createWishlist(WishList wishList) {
        wishListRepository.save(wishList);
    }

    public List<WishList> readWishList(Integer userId) {
        return wishListRepository.findAllByUserIdOrderByCreatedDateDesc(userId);
    }
}