package com.winbet.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winbet.dao.ISportJpaRepository;
import com.winbet.entities.Client;
import com.winbet.entities.Equipe;
import com.winbet.entities.Rencontre;
import com.winbet.entities.Sport;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ISportJpaRepository sportRepo;

	@RequestMapping("/goToAccueil")
	private String gotoAccueil(Model model) {
		List<Sport> listeSports = sportRepo.findAll();
		model.addAttribute("listeSports", listeSports);

		return "accueil";
	}

	@GetMapping("/goToCreerRencontre")
	public String goToCreerRencontre(Model model) {
		model.addAttribute("rencontre", new Rencontre());
		model.addAttribute("equipe", new Equipe());
		return "inscription";
	}
}
