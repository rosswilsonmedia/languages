package com.codingdojo.languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.languages.models.Languages;
import com.codingdojo.languages.services.LanguagesService;

@Controller
public class LanguagesController {
	 private final LanguagesService languagesService;
	 
	 public LanguagesController(LanguagesService languagesService) {
	     this.languagesService = languagesService;
	 }
	 
	 @RequestMapping("/languages")
	 public String index(Model model, @ModelAttribute("language") Languages language) {
	     List<Languages> languages = languagesService.allLanguages();
	     model.addAttribute("languages", languages);
	     return "/languages/index.jsp";
	 }
	 
	 @RequestMapping(value="/languages", method=RequestMethod.POST)
	 public String create(@Valid @ModelAttribute("language") Languages language, BindingResult result) {
		 if (result.hasErrors()) {
			 return "/languages/index.jsp";
		 } else {
			 languagesService.createLanguage(language);
			 return "redirect:/languages";
		 }
	 }
	 
	 @RequestMapping("/languages/{id}")
	 public String viewOne(@PathVariable("id") Long id, Model model) {
		 Languages languages = languagesService.findLanguage(id);
		 model.addAttribute(languages);
		 return "/languages/view.jsp";
	 }
	 
	 @RequestMapping("/languages/{id}/edit")
	 public String edit(@PathVariable("id") Long id, Model model) {
		 Languages language = languagesService.findLanguage(id);
		 model.addAttribute("language", language);
		 return "/languages/edit.jsp";
	 }
	    
	 @RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
	 public String update(@Valid @ModelAttribute("language") Languages language, BindingResult result) {
		 if (result.hasErrors()) {
			 return "/languages/edit.jsp";
		 } else {
			 languagesService.updateLanguage(language.getId(), language.getName(), language.getCreator(), language.getCurrentVersion());
			 return "redirect:/languages";
		 }
	 }
	 
	 @RequestMapping(value="/languages/{id}", method=RequestMethod.DELETE)
	 public String destroy(@PathVariable("id") Long id) {
		 languagesService.deleteLanguage(id);
		 return "redirect:/languages";
	 }
}
