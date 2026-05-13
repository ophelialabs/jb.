package com.ophelialabs.cart.kafka

import io.micronaut.configuration.kafka.annotation.KafkaClient
import io.micronaut.configuration.kafka.annotation.KafkaKey
import io.micronaut.configuration.kafka.annotation.Topic
import java.util.UUID

@KafkaClient
interface CartEventProducer {

    @Topic("cart-events")
    fun sendCartEvent(@KafkaKey cartId: UUID, cartEvent: CartEvent)

}