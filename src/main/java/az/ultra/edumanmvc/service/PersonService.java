package az.ultra.edumanmvc.service;

import az.ultra.edumanmvc.dto.PersonDetails;
import az.ultra.edumanmvc.dto.PersonDto;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

import static az.ultra.edumanmvc.enums.SqlStatements.*;

@Service
@RequiredArgsConstructor
public class PersonService {


    private final JdbcTemplate jdbcTemplate;

    public List<PersonDto> getAllPersons() {
        String query = GET_ALL_PERSONS.getQuery();
        return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(PersonDto.class));
    }

    public PersonDto getPersonById(Integer id) {
        String query = FIND_BY_ID.getQuery();
        return jdbcTemplate.queryForObject(query, new Object[]{id}, new BeanPropertyRowMapper<>(PersonDto.class));
    }

    public void updatePersonById(PersonDto personDto) {
        String query = UPDATE_PERSON.getQuery();
        int rowsAffected = jdbcTemplate.update(query, personDto.getName(), personDto.getSurname(), personDto.getMiddleName(), personDto.getId());

        if (rowsAffected == 1) {
            String selectedQuery = FIND_BY_ID.getQuery();
            jdbcTemplate.queryForObject(selectedQuery, new Object[]{personDto.getId()}, new BeanPropertyRowMapper<>(PersonDto.class));
        }
    }

    public List<PersonDetails> getPersonsDetails() {
        String query = GET_PERSON_DETAILS.getQuery();
        return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(PersonDetails.class));
    }

    public List<PersonDto> getPersonsComPersons() {
        String query = GET_COMMON_PERSONS.getQuery();
        return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(PersonDto.class));
    }
}
