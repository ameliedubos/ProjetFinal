package com.winbet.controllers;

import javax.validation.Valid;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winbet.dao.IClientJpaRepository;
import com.winbet.entities.Authentification;
import com.winbet.entities.Client;

@Controller
@RequestMapping("/client")
public class ClientController {

    private IClientJpaRepository clientRepo;

    @RequestMapping("/goToAccueil")
    private String gotoAccueil() {
	return "accueil";
    }

    @GetMapping("/goToCreer")
    public String goToCreer(Model model) {
	model.addAttribute("client", new Client());
	// model.addAttribute("roles", ERole.values());
	return "inscription";
    }

    @PostMapping("/creer")
    public String creer(@Valid @ModelAttribute(value = "client") Client client, BindingResult result, Model model) {
	if (!result.hasErrors()) {
	    encodePassword(client.getAuthentification());
	    clientRepo.save(client);
	    model.addAttribute("client", new Client());
	}
	return "creer";
    }

    private static void encodePassword(Authentification authentification) {
	String rawPassword = authentification.getMotDePasse();
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encodedPassword = encoder.encode(rawPassword);
	authentification.setMotDePasse(encodedPassword);
    }
}
