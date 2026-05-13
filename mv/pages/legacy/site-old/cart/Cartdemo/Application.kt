package com.ophelialabs.cart

import io.micronaut.runtime.Micronaut.build

fun main(args: Array<String>) {
	build()
	    .args(*args)
		.packages("com.ophelialabs.cart")
		.start()
}