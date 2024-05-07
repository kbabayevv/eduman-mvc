package az.ultra.edumanmvc.controller;

import az.ultra.edumanmvc.dto.PersonDetails;
import az.ultra.edumanmvc.dto.PersonDto;
import az.ultra.edumanmvc.service.PersonService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/persons")
public class PersonController {

    private final PersonService personService;

    @GetMapping("/all")
    @ResponseBody
    public ResponseEntity<List<PersonDto>> getAllPersons() {
        return ResponseEntity.ok(personService.getAllPersons());
    }

    @GetMapping("/details")
    @ResponseBody
    public ResponseEntity<List<PersonDetails>> getPersonsDetails() {
        return ResponseEntity.ok(personService.getPersonsDetails());
    }

    @GetMapping("/{id}")
    @ResponseBody
    public ResponseEntity<PersonDto> findPersonById(@PathVariable Integer id) {
        return ResponseEntity.ok(personService.getPersonById(id));
    }
}
