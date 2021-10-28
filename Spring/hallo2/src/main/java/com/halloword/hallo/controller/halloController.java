package com.halloword.hallo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;


@RestController
@RequestMapping("/generation")
public class halloController {
	@RequestMapping("/habilidades")
	@GetMapping
	public String habilidades() {
		return "Persistência e atenção aos detalhes";
	}
	@RequestMapping("/objetivos")
	@GetMapping
	public String objetivos() {
		return "Aprender sobre api's e como aplicar no java";
	}
}

