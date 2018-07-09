package com.winbet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winbet.dao.IAdminJpaRepository;
import com.winbet.entities.Admin;
import com.winbet.entities.Authentification;
import com.winbet.entities.ERole;

@Controller
@RequestMapping("/welcome")
public class WelcomeController {

    @Autowired
    private IAdminJpaRepository AdminRepo;

    @RequestMapping("/goToAccueil")
    public String goToAccueil() {

	// à commenter
//	Admin admin = new Admin();
//	Authentification auth = new Authentification();
//	auth.setEmail("root@root.fr");
//	auth.setMotDePasse("123");
//	auth.setRole(ERole.ROLE_ADMIN);
//	encodePassword(auth);
//	admin.setAuthentification(auth);
//	AdminRepo.save(admin);
	//

	if (!AuthHelper.isAuthenticated())
	    return "accueil";
	//else if (AuthHelper.getRole().equals(ERole.ROLE_CLIENT))
	else if (AuthHelper.getPrincipal().isAdministrateur())
		return "redirect:/admin/goToMenuAdmin";
	else   
		return "redirect:/client/goToMenuClient";
    }

//    private static void encodePassword(Authentification authentification) {
//	String rawPassword = authentification.getMotDePasse();
//	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//	String encodedPassword = encoder.encode(rawPassword);
//	authentification.setMotDePasse(encodedPassword);
//    }
}
