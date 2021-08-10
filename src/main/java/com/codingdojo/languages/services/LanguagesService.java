package com.codingdojo.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.languages.models.Languages;
import com.codingdojo.languages.repositories.LanguagesRepository;

@Service
public class LanguagesService {
    // adding the book repository as a dependency
    private final LanguagesRepository languagesRepository;
    
    public LanguagesService(LanguagesRepository languagesRepository) {
        this.languagesRepository = languagesRepository;
    }
    // returns all the books
    public List<Languages> allLanguages() {
        return languagesRepository.findAll();
    }
    // creates a book
    public Languages createLanguage(Languages l) {
        return languagesRepository.save(l);
    }
    // retrieves a book
    public Languages findLanguage(Long id) {
        Optional<Languages> optionalLanguage = languagesRepository.findById(id);
        if(optionalLanguage.isPresent()) {
            return optionalLanguage.get();
        } else {
            return null;
        }
    }
    
    public void deleteLanguage(Long id) {
    	languagesRepository.deleteById(id);
    }
    
    public Languages updateLanguage(Long id, String name, String creator, String currentVersion) {
    	Languages updatedLanguage = findLanguage(id);
    	if(updatedLanguage!=null) {
    		updatedLanguage.setName(name);
    		updatedLanguage.setCreator(creator);
    		updatedLanguage.setCurrentVersion(currentVersion);
    		languagesRepository.save(updatedLanguage);
    	}
    	return updatedLanguage;
    }
}