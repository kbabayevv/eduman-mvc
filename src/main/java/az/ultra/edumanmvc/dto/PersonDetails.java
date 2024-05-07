package az.ultra.edumanmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PersonDetails {
    private String fullName;
    private Integer active;
    private Date birthDate;
    private String sex;
    private String organizationName;
    private Integer acceptedYear;
    private String photoUrl;
    private String fullAddress;
    private String specialty;
    private String username;
    private String password;
    private Integer uomgBall;
    private Integer motherId;
    private Integer fatherId;
    private String motherName;
    private String fatherName;
}
