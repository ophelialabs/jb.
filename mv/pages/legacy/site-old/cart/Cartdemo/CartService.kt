package com.ophelialabs.cart.service

import com.ophelialabs.cart.kafka.CartEvent
import com.ophelialabs.cart.kafka.CartEventProducer
import com.ophelialabs.cart.model.Cart
import com.ophelialabs.cart.repository.CartRepository
import jakarta.inject.Singleton
import java.util.UUID

@Singleton
class CartService(
    private val cartRepository: CartRepository,
    private val cartEventProducer: CartEventProducer
) {
    fun findById(id: UUID): Cart? = cartRepository.findById(id)

    fun create(cart: Cart): Cart {
        val newCart = cartRepository.save(cart)
        cartEventProducer.sendCartEvent(newCart.id, CartEvent("CART_CREATED", newCart.id))
        return newCart
    }
}