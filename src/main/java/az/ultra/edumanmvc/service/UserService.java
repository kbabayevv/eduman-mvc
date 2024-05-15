package az.ultra.edumanmvc.service;

import az.ultra.edumanmvc.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

import static az.ultra.edumanmvc.enums.SqlStatements.*;

@Service
@RequiredArgsConstructor
public class UserService {


    private final JdbcTemplate jdbcTemplate;


    public void createUser(UserDto userDto) {
        String query = INSERT_USER.getQuery();
        jdbcTemplate.update(query, userDto.getName(), userDto.getSurname(), userDto.getMiddleName());
    }

    public List<UserDto> getUsers() {
        String query = GET_COMMON_USERS.getQuery();
        return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(UserDto.class));
    }

    public void updateUser(UserDto userDto) {
        String query = UPDATE_USER.getQuery();
        jdbcTemplate.update(query, userDto.getName(), userDto.getSurname(), userDto.getMiddleName(), userDto.getId());
    }

    public void deleteUser(Long id) {
        String query = DELETE_USER.getQuery();
        jdbcTemplate.update(query, id);
    }

    public List<UserDto> getStudents() {
        String query = SELECT_ONLY_STUDENTS.getQuery();
        return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(UserDto.class));
    }

    public List<UserDto> searchByName(String search) {
        search = search.toUpperCase();
        String query = SEARCH_BY_NAME_ALL_USERS.getQuery();
        return jdbcTemplate.query(query, new Object[]{"%" + search + "%"}, new BeanPropertyRowMapper<>(UserDto.class));
    }

    public List<UserDto> searchByNameStudents(String search) {
        search = search.toUpperCase();
        String query = SEARCH_BY_NAME_FOR_STUDENTS.getQuery();
        return jdbcTemplate.query(query, new Object[]{"%" + search + "%"}, new BeanPropertyRowMapper<>(UserDto.class));
    }
}
