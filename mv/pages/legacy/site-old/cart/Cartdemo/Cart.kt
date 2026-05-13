package com.ophelialabs.cart.model

import java.math.BigDecimal
import java.util.UUID

data class Cart(
    val id: UUID,
    val items: List<Item>
)

data class Item(
    val productId: String,
    val quantity: Int,
    val price: BigDecimal
)