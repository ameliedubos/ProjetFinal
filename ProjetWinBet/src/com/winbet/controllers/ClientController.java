package com.winbet.controllers;

import java.util.Date;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.winbet.dao.IAuthentificationJpaRepository;
import com.winbet.dao.IClientJpaRepository;
import com.winbet.dao.IPariJpaRepository;
import com.winbet.dao.IRencontreJpaRepository;
import com.winbet.dao.ISportJpaRepository;
import com.winbet.entities.Authentification;
import com.winbet.entities.Client;
import com.winbet.entities.ERole;
import com.winbet.entities.Pari;
import com.winbet.entities.Rencontre;
import com.winbet.entities.Sport;

@Controller
@RequestMapping("/client")
public class ClientController {

    @Autowired
    private IClientJpaRepository clientRepo;

    @Autowired
    private IAuthentificationJpaRepository authentificationRepo;

    @Autowired
    private ISportJpaRepository sportRepo;

    @Autowired
    private IRencontreJpaRepository rencontreRepo;

    @Autowired
    private IPariJpaRepository pariRepo;

    @RequestMapping("/goToAccueil")
    private String gotoAccueil(@RequestParam(value = "logout", required = false) Boolean logout, Model model) {
	List<Sport> listeSports = sportRepo.findAll();
	model.addAttribute("listeSports", listeSports);
	return "accueil";
    }

    @RequestMapping("/goToMenuClient")
    private String gotoMenuClient(Model model) {
	return "menuClient";
    }

    @GetMapping("/goToCreer")
    public String goToCreer(Model model) {
	model.addAttribute("client", new Client());
	return "inscription";
    }

    @PostMapping("/creer")
    public String creer(@Valid @ModelAttribute(value = "client") Client client, BindingResult result, Model model) {

	if (!result.hasErrors()) {
	    String email = client.getAuthentification().getEmail();
	    Client other = clientRepo.findByAuthentificationEmail(email);
	    if (other != null) {
		result.rejectValue("authentification.email", "error.authentification.email.doublon");
	    }
	}
	if (!result.hasErrors()) {

	    encodePassword(client.getAuthentification());
	    client.getAuthentification().setRole(ERole.ROLE_CLIENT);
	    clientRepo.save(client);
	    model.addAttribute("client", new Client());
	    return "accueil";
	} else {
	    return "inscription";
	}
    }

    @RequestMapping("/goToRencontresAvenir")
    private String goToRencontresAvenir(Model model) {
	Date now = new Date();
	List<Rencontre> listeRencontres = rencontreRepo.findNextEvents(now);
	model.addAttribute("listeRencontres", listeRencontres);
	return "rencontresAVenir";
    }

    @GetMapping("/goToPari/{id_rencontre}")
    public String goToPari(@PathVariable(value = "id_rencontre", required = true) Long id_rencontre, Model model) {
	Pari pari = new Pari();
	pari.setRencontre(rencontreRepo.getOne(id_rencontre));
	pari.setClient(AuthHelper.getClient());
	model.addAttribute("pari", pari);
	return "pari";
    }

    @PostMapping("/pari")
    private String Pari(@Valid @ModelAttribute(value = "pari") Pari pari, BindingResult result, Model model) {
	if (pari.getSomme() > pari.getClient().getMontantMax()) {
	    result.rejectValue("somme", "error.pari.somme.excessive");
	}
	if (!result.hasErrors()) {
	    pariRepo.save(pari);
	    model.addAttribute("pari", new Pari());
	    Date now = new Date();
	    List<Rencontre> listeRencontres = rencontreRepo.findNextEvents(now);
	    model.addAttribute("listeRencontres", listeRencontres);
	    return "rencontresAVenir";
	} else {
	    System.out.println(pari.getRencontre().getEquipe1());
	    return "pari";
	}
    }
    
    
    @RequestMapping("/goToRencontresPariees")
    private String goToRencontresPariees(@ModelAttribute(value = "client") Client client, Model model) {
	List<Pari> listePariByClient = pariRepo.findByClientId(AuthHelper.getClient().getId());
	model.addAttribute("listePariByClient", listePariByClient);
	return "rencontresPariees";
    }

    private static void encodePassword(Authentification authentification) {
	String rawPassword = authentification.getMotDePasse();
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encodedPassword = encoder.encode(rawPassword);
	authentification.setMotDePasse(encodedPassword);
    }
}
