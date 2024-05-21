package az.ultra.edumanmvc.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Person {
    private Integer id;
    private String name;
    private String surname;
    private String middleName;
}
