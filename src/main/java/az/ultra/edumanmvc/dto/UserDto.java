package az.ultra.edumanmvc.dto;

import lombok.*;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class UserDto {

    private Long id;
    private String name;
    private String surname;
    private String middleName;
}
