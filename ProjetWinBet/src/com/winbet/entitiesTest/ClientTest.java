package com.winbet.entitiesTest;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.jupiter.api.Test;

import com.winbet.entities.Authentification;
import com.winbet.entities.Client;

public class ClientTest {

	@Test
	public void testConstruire() {
		Client client = new Client();
		assertNotNull(client);
	}

	@Test
	public void testGetCode() {
		Client client = new Client();
		String nom = client.getNom();
		assertNull(nom);
	}

	@Test
	public void testSetNom() {
		Client client = new Client();
		client.setNom("Toto");
		String nom = client.getNom();
		assertEquals("Toto", nom);
	}

	@Test
	public void testGetAuthentificationEmail() {
		Client client = new Client();
		Authentification auth= new Authentification();
		client.setAuthentification(auth);
		String email = auth.getEmail();
		assertNull(email);
	}

	@Test
	public void testSetAuthentificationEmail() {
		Client client = new Client();
		Authentification auth= new Authentification();
		client.setAuthentification(auth);
		auth.setEmail("Toto@toto.fr");
		String email = client.getAuthentification().getEmail();
		assertEquals("Toto@toto.fr", email);
	}
	
}
