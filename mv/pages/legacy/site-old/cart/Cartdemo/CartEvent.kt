package com.ophelialabs.cart.kafka

import java.util.UUID

data class CartEvent(
    val eventType: String,
    val cartId: UUID
)