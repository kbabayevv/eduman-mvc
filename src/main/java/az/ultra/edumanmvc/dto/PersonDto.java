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
}
