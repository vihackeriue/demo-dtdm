package com.example.annotation;

import com.example.validation.TimeValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = {TimeValidator.class})
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface TimeConstraint {
    String message() default "";
    String startTime();
    String endTime();

    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
    
    @Target({ElementType.TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    @interface List {
        TimeConstraint[] value();
    }

}
