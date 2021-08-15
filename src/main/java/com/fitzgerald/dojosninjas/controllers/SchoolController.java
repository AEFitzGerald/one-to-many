package com.fitzgerald.dojosninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.fitzgerald.dojosninjas.models.Dojo;
import com.fitzgerald.dojosninjas.models.Ninja;
import com.fitzgerald.dojosninjas.services.AppService;

@Controller
public class SchoolController {
	
	
	private final AppService appService;
	
	public SchoolController(AppService appService) {
		this.appService= appService;
	}
	
	//------------Enter New Dojo -------
	
	@GetMapping("/dojos/new")
	public String enterNewDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "new-dojo.jsp";
	}
	
	
	//------------  Create New Dojo -------
	
	@PostMapping("/dojo/create")
	public String createNewDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "new-dojo.jsp";
		}
		else {
			this.appService.createDojo(dojo);
			return "redirect:/dojos/new";	
		}
	}
	
	
	//-------------  Enter New Ninja -------
	
	@GetMapping("/ninjas/new")
	public String enterNewNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		
		//List Dojos > choose one for attendance
		List<Dojo> allDojos = this.appService.findAllDojos();
		model.addAttribute("allDojos", allDojos);
		
		return "new-ninja.jsp";
	}
	
	
	//------------  Create New Ninja -------
	
	@PostMapping("/ninja/create")
	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Dojo> allDojos = this.appService.findAllDojos();
			model.addAttribute("allDojos", allDojos);
			return "new-ninja.jsp";
		}
		else {
			this.appService.createNinja(ninja);
			return "redirect:/dojos/new";
		}	
	}
	
	//------------  View One Dojo ------
	
	@GetMapping("/dojo/{id}")
	public String showDojoDetails(@PathVariable("id")Long id, Model model) {
		
		Dojo d = this.appService.getOneDojo(id);
		model.addAttribute("dojo", d);
		
		return "dojo-details.jsp";
	}
	
	

}
