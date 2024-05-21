package az.ultra.edumanmvc.constraints;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CapitalizedTextValidator implements ConstraintValidator<Capitalized, String> {

    @Override
    public void initialize(Capitalized constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(String data, ConstraintValidatorContext constraintValidatorContext) {
        return data != null && !data.isBlank() && Character.isUpperCase(data.charAt(0));
    }

}
