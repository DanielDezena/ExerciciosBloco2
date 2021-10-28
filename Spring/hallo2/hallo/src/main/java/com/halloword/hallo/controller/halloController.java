package com.halloword.hallo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
@RestController
@RequestMapping("/hallo")

public class halloController {

	@GetMapping
	public String hallo() {
		return "hallo generation!";
	}

}
