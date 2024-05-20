package az.ultra.edumanmvc.controller;

import az.ultra.edumanmvc.dto.PersonDetails;
import az.ultra.edumanmvc.dto.PersonDto;
import az.ultra.edumanmvc.service.PersonService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.annotation.Id;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/persons")
public class PersonController {

    private final PersonService personService;

    @PostMapping("/test")
    @ResponseBody
    public ResponseEntity<ArrayList<PersonDto>> testApi()
    {
        ArrayList<PersonDto> l = new ArrayList<PersonDto>();

        l.add(new PersonDto((long)1, "Name1", "Surname1"));
        l.add(new PersonDto((long)2, "Name2", "Surname2"));
        l.add(new PersonDto((long)3, "Name3", "Surname3"));

        return ResponseEntity.ok(l);
    }
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
