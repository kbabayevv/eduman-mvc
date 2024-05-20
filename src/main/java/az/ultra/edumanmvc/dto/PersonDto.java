package az.ultra.edumanmvc.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class PersonDto {

    private Long id;
    private String name;
    private String surname;
    private String middleName;

    public PersonDto(Long _id, String _name, String _surname)
    {
        id = _id;
        name = _name;
        surname = _surname;
    }
}
