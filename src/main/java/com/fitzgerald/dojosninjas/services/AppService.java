package com.fitzgerald.dojosninjas.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fitzgerald.dojosninjas.models.Dojo;
import com.fitzgerald.dojosninjas.models.Ninja;
import com.fitzgerald.dojosninjas.repositories.DojoRepository;
import com.fitzgerald.dojosninjas.repositories.NinjaRepository;

@Service
public class AppService {
	
	//let service know about the repositories
	private final NinjaRepository ninjaRepo;
	private final DojoRepository dojoRepo;
	
	public AppService(NinjaRepository ninjaRepo, DojoRepository dojoRepo) {
		this.ninjaRepo = ninjaRepo;
		this.dojoRepo = dojoRepo;
	}
	
	//methods that the service can handle
	public List<Dojo> findAllDojos(){
		return (List<Dojo>)this.dojoRepo.findAll();
	}
	
	public Dojo createDojo(Dojo d) {
		return this.dojoRepo.save(d);
	}	
	
	public Ninja createNinja(Ninja n) {
		return this.ninjaRepo.save(n);
	}
	
	public Dojo getOneDojo(Long id) {
		return this.dojoRepo.findById(id).orElse(null);
	}
	
}
