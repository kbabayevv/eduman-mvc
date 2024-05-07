package az.ultra.edumanmvc.controller;

import az.ultra.edumanmvc.dto.PersonDetails;
import az.ultra.edumanmvc.dto.PersonDto;
import az.ultra.edumanmvc.service.PersonService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequiredArgsConstructor
@Slf4j
public class PersonDetailsController {

    private final PersonService personService;

    @RequestMapping(value = {"/details"}, method = GET)
    public String getPersonsDetails(Model model) {
        List<PersonDetails> personDetails = personService.getPersonsDetails();
        model.addAttribute("personDetails", personDetails);
        return "details";
    }

    @RequestMapping(value = {"/com-persons"}, method = GET)
    public String getPersonsComPersons(Model model) {
        List<PersonDto> personDto = personService.getPersonsComPersons();
        model.addAttribute("personList", personDto);
        return "com-persons";
    }

    @RequestMapping(value = {"/redirectPerson"}, method = GET)
    public String redirectPerson() {
        return "edit-person";
    }

    @RequestMapping(value = {"/updatePerson"}, method = POST)
    public String updatePerson(@ModelAttribute PersonDto personDto) {
        personService.updatePersonById(personDto);
        log.info("Person is {}", personDto);
        return "redirect:/com-persons";
    }
}
