package fr.cmm.controller;

import fr.cmm.domain.Recipe;
import fr.cmm.helper.PageQuery;
import fr.cmm.service.RecipeService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.inject.Inject;

@Controller
public class ApiController {
    @Inject
    private RecipeService recipeService;

    @RequestMapping(value = "/api/recipes", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Iterable<Recipe> getJSONRecettesList() {
        PageQuery pageQuery = new PageQuery();
        return recipeService.findByQueryByLatest(pageQuery);
    }

    @RequestMapping(value = "/api/recipes/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Recipe getJSONRecetteById(@PathVariable("id") String id) {
        if(recipeService.findById(id) == null){ throw new ResourceNotFoundException(); }
        return recipeService.findById(id);
    }
}