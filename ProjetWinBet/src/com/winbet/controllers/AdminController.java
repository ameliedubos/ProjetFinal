package com.winbet.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.winbet.dao.IEquipeJpaRepository;
import com.winbet.dao.IRencontreJpaRepository;
import com.winbet.dao.ISportJpaRepository;
import com.winbet.entities.Equipe;
import com.winbet.entities.Rencontre;
import com.winbet.entities.Sport;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ISportJpaRepository sportRepo;

	@Autowired
	private IRencontreJpaRepository rencontreRepo;

	@Autowired
	private IEquipeJpaRepository equipeRepo;

	@RequestMapping("/goToAccueil")
	private String gotoAccueil(Model model) {
		listeSports(model);
		return "accueil";
	}

	@RequestMapping("/goToMenuAdmin")
	private String gotoMenuAdmin(Model model) {
		List<Rencontre> listeRencontres = rencontreRepo.findAll();
		model.addAttribute("listeRencontres", listeRencontres);
		return "menuAdmin";
	}

	@GetMapping("/goToCreerRencontre")
	public String goToCreerRencontre(Model model) {
		listeSports(model);
		listeEquipes(model);
		model.addAttribute("rencontre", new Rencontre());
		return "creerRencontre";
	}

	@PostMapping("/creer")
	public String creer(@Valid @ModelAttribute(value = "rencontre") Rencontre rencontre, BindingResult result, Model model) {
		
		if (!result.hasErrors()) {
			rencontreRepo.save(rencontre);
			List<Rencontre> listeRencontres = rencontreRepo.findAll();
			model.addAttribute("listeRencontres", listeRencontres);
			return "menuAdmin";
		} else {
			return "creerRencontre";
		}
	}

	@RequestMapping("/goToModifierRencontre/{id}")
	public String goToModifierRencontre(@PathVariable(value = "id", required = true) Long id, Model model) {
		Rencontre rencontre = rencontreRepo.getOne(id);
		model.addAttribute("rencontre", rencontre);
		return "modifierRencontre";
	}

	@PostMapping("/supprimerRencontre")
	public String supprimerRencontre(@RequestParam(value = "id", required = true) Long id, Model model) {
		rencontreRepo.deleteById(id);
		return "menuAdmin";
	}

	private void listeSports(Model model) {
		List<Sport> listeSports = sportRepo.findAll();
		model.addAttribute("listeSports", listeSports);
	}

	private void listeEquipes(Model model) {
		List<Equipe> listeEquipes = equipeRepo.findAll();
		model.addAttribute("listeEquipes", listeEquipes);
	}
}
