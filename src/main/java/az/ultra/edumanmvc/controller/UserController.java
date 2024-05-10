package az.ultra.edumanmvc.controller;

import az.ultra.edumanmvc.dto.UserDto;
import az.ultra.edumanmvc.service.UserService;
import az.ultra.edumanmvc.service.UserServiceForProcedure;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.Socket;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserController {

    private final UserService userService;
    private final UserServiceForProcedure serviceForProcedure;


    @RequestMapping(value = {"/redirectToAdd"}, method = GET)
    public String redirectForAddingUser() {
        return "add-user";
    }

    @RequestMapping(value = {"/create-user"}, method = POST)
    public String createUser(@ModelAttribute UserDto userDto) {
        serviceForProcedure.insertUser(userDto);
        return "redirect:/com-users";
    }

    @RequestMapping(value = {"/com-users"}, method = GET)
    public String getPersonsComPersons(Model model) {
        List<UserDto> userDto = serviceForProcedure.getAllUsers();
        model.addAttribute("userList", userDto);
        return "com-users";
    }

    @RequestMapping(value = {"/redirectUser"}, method = GET)
    public String redirectUserForUpdate() {
        return "edit-user";
    }

    @RequestMapping(value = {"/updateUser"}, method = POST)
    public String updateUser(@ModelAttribute UserDto userDto) {
        serviceForProcedure.updateUser(userDto);
        log.info("Person is {}", userDto);
        return "redirect:/com-users";
    }


    @RequestMapping(value = {"/deleteUser/{id}"}, method = GET)
    public String deleteUser(@PathVariable Long id) {
        serviceForProcedure.deleteUser(id);
        return "redirect:/com-users";
    }

}
