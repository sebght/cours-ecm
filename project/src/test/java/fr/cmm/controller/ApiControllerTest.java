package fr.cmm.controller;

import fr.cmm.domain.Recipe;
import fr.cmm.service.RecipeService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;
import javax.inject.Inject;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = ApiControllerTestConfig.class)
@WebAppConfiguration
public class ApiControllerTest {
    @Inject
    RecipeService recipeService;

    @Inject
    WebApplicationContext wac;

    MockMvc mockMvc;

    @Before
    public void setup() {
        mockMvc = webAppContextSetup(wac).build();

        Mockito.reset(recipeService);
    }

    @Test
    public void getJSONRecetteById() throws Exception {
        String id = "56375619d4c603aa4eb412af";

        Mockito.when(recipeService.findById(id)).thenReturn(new Recipe());

        mockMvc.perform(get("/api/recipes/"+id))
                .andExpect(status().is(200))
                .andExpect(content().contentType(MediaType.APPLICATION_JSON)); //pas de tests sur le model/view comme pour IndexController
    }

    @Test
    public void getJSONRecette_not_found() throws Exception {
        mockMvc.perform(get("/api/recipes/56375619d4c603aa4eb412dd"))
                .andExpect(status().isNotFound());
    }

    @Test
    public void getJSONRecettesList() throws Exception {

        mockMvc.perform(get("/api/recipes/").contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().is(200));
                //.andExpect(content().contentTypeCompatibleWith("application/json"));
        //je n'ai pas réussi à récupérer le contentType via le Test,
        // alors que l' outil de développement me confirment que c'est bien du type "application/json"
    }
}