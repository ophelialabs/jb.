package com.ophelialabs.cart.controller

import com.ophelialabs.cart.model.Cart
import com.ophelialabs.cart.service.CartService
import io.micronaut.http.HttpResponse
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get
import io.micronaut.http.annotation.Post
import io.micronaut.http.annotation.Body
import java.util.UUID

@Controller("/cart")
class CartController(private val cartService: CartService) {

    @Get("/{id}")
    fun getCart(id: UUID): HttpResponse<Cart> {
        val cart = cartService.findById(id)
        return cart?.let { HttpResponse.ok(it) } ?: HttpResponse.notFound()
    }

    @Post
    fun createCart(@Body cart: Cart): HttpResponse<Cart> {
        return HttpResponse.created(cartService.create(cart))
    }
}