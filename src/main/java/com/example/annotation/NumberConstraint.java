package com.example.annotation;

import com.example.validation.NumberValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = NumberValidator.class)
@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface NumberConstraint {
    String message() default "Invalid number";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};

    float min() default Float.MIN_VALUE;
    float max() default Float.MAX_VALUE;
}
