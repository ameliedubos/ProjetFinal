package com.winbet.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winbet.dao.IAdminJpaRepository;
import com.winbet.dao.IEquipeJpaRepository;
import com.winbet.dao.ISportJpaRepository;
import com.winbet.entities.Authentification;
import com.winbet.entities.Sport;

@Controller
@RequestMapping("/welcome")
public class WelcomeController {

    @Autowired
    private IAdminJpaRepository AdminRepo;

    @Autowired
    private ISportJpaRepository sportRepo;

    @Autowired
    private IEquipeJpaRepository equipeRepo;

    @RequestMapping("/goToAccueil")
    public String goToAccueil(Model model) {
	// createElementsInDataBase();
	if (!AuthHelper.isAuthenticated()) {
	    List<Sport> listeSports = sportRepo.findAll();
	    model.addAttribute("listeSports", listeSports);
	    return "accueil";
	} else if (AuthHelper.getPrincipal().isAdministrateur())

	    return "redirect:/admin/goToMenuAdmin";
	else
	    return "redirect:/client/goToMenuClient";
    }

    private static void encodePassword(Authentification authentification) {
	String rawPassword = authentification.getMotDePasse();
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encodedPassword = encoder.encode(rawPassword);
	authentification.setMotDePasse(encodedPassword);
    }

    // private void createElementsInDataBase() {
    // Admin admin = new Admin();
    // Authentification auth = new Authentification();
    // auth.setEmail("root@root.fr");
    // auth.setMotDePasse("123");
    // auth.setRole(ERole.ROLE_ADMIN);
    // encodePassword(auth);
    // admin.setAuthentification(auth);
    // AdminRepo.save(admin);
    //
    // Sport sports1 = new Sport();
    // sports1.setNom("Football");
    // Sport sports2 = new Sport();
    // sports2.setNom("Rugby");
    // Sport sports3 = new Sport();
    // sports3.setNom("Basketball");
    // Sport sports4 = new Sport();
    // sports4.setNom("Tennis");
    // Sport sports5 = new Sport();
    // sports5.setNom("Handball");
    // Sport sports6 = new Sport();
    // sports6.setNom("Volleyball");
    //
    // Equipe equipe1 = new Equipe();
    // equipe1.setNom("PSG");
    // Equipe equipe2 = new Equipe();
    // equipe2.setNom("CHELSEA");
    // Equipe equipe3 = new Equipe();
    // equipe3.setNom("GOLDENSTATE");
    // Equipe equipe4 = new Equipe();
    // equipe4.setNom("CHICAGO BULLS");
    // Equipe equipe5 = new Equipe();
    // equipe5.setNom("TOULON");
    // Equipe equipe6 = new Equipe();
    // equipe6.setNom("CASTRE OLYMPIQUE");
    //
    // sportRepo.save(sports1);
    // sportRepo.save(sports2);
    // sportRepo.save(sports3);
    // sportRepo.save(sports4);
    // sportRepo.save(sports5);
    // sportRepo.save(sports6);
    //
    // equipe1.setSport(sports1);
    // equipe2.setSport(sports1);
    // equipe3.setSport(sports3);
    // equipe4.setSport(sports3);
    // equipe5.setSport(sports2);
    // equipe6.setSport(sports2);
    //
    // equipeRepo.save(equipe1);
    // equipeRepo.save(equipe2);
    // equipeRepo.save(equipe3);
    // equipeRepo.save(equipe4);
    // equipeRepo.save(equipe5);
    // equipeRepo.save(equipe6);
    //
    // }

}
