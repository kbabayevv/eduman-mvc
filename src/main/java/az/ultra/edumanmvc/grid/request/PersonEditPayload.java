package az.ultra.edumanmvc.grid.request;

import az.ultra.edumanmvc.constraints.Capitalized;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;

@Getter
@Setter
@ToString
public class PersonEditPayload {

    @NotNull(message = "ID can't be null")
    @Positive(message = "ID must be positive")
    private Integer id;

    @NotBlank(message = "Name can't be empty")
    @Size(min = 3, max = 15, message = "Name size 3-15")
    @Capitalized
    private String name;

    @NotBlank(message = "Surname can't be empty")
    @Size(min = 3, max = 15, message = "Surname size 3-15")
    @Capitalized
    private String surname;

    @NotBlank(message = "Middle-name can't be empty")
    @Size(min = 3, max = 15, message = "Middle-name size 3-15")
    @Capitalized
    private String middleName;
}
