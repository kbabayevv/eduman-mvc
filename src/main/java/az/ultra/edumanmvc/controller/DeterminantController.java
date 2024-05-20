package az.ultra.edumanmvc.controller;

import az.ultra.edumanmvc.service.DeterminantService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class DeterminantController {

    private final DeterminantService determinantService;

    @GetMapping("/main")
    public String redirect() {
        return "com-determinant";
    }

    @PostMapping("/calculate")
    @ResponseBody
    public Integer calculateDeterminant(@RequestParam("matrix") String matrixString, Model model) {
        // Parse the matrix string into a 2D array of integers
        String[] rows = matrixString.split("\n");
        int[][] matrix = new int[rows.length][];
        for (int i = 0; i < rows.length; i++) {
            String[] elements = rows[i].split(","); // Split by comma
            matrix[i] = new int[elements.length];
            for (int j = 0; j < elements.length; j++) {
                matrix[i][j] = Integer.parseInt(elements[j].trim()); // Parse and trim spaces
            }
        }

        // Calculate the determinant
        return determinantService.calculateDeterminant(matrix);
    }

    @GetMapping("/getList")
    public String getAllList(Model model) {

        return "getList";
    }
}
