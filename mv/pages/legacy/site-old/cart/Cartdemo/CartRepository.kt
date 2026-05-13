package com.ophelialabs.cart.repository

import com.ophelialabs.cart.model.Cart
import jakarta.inject.Singleton
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

@Singleton
class CartRepository {
    private val carts = ConcurrentHashMap<UUID, Cart>()
    fun findById(id: UUID): Cart? = carts[id]
    fun save(cart: Cart): Cart = carts.put(cart.id, cart).let { cart }
}