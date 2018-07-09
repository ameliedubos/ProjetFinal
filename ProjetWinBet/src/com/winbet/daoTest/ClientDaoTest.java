package com.winbet.daoTest;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.winbet.config.AppConfig;
import com.winbet.dao.IClientJpaRepository;
import com.winbet.entities.Authentification;
import com.winbet.entities.Client;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { AppConfig.class })

public class ClientDaoTest extends SpringTest{

	
	@Autowired
	private IClientJpaRepository clientRepo;
	
	@Test
	public void testfindAllOk() {
		assertTrue("Liste vide", clientRepo.findAll().isEmpty() == false);

	}

	@Test
	public void testfindbyId() {
		assertFalse("Objet non existant", clientRepo.findById((long) 1) == null);

	}

	@Test
	public void testsave() {
		Client client = new Client();
		Authentification authentification = new Authentification();
		client.setAuthentification(authentification);
		authentification.setEmail("pb@free.fr");
		authentification.setMotDePasse("123");
		
		client.setAge("999999");
		client.setNom("Kiwis");
		client.setPrenom("titi");
		client.setMontantMax(1200);

		clientRepo.save(client);
	}

}