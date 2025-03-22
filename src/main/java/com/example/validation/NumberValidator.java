package com.example.validation;

import com.example.annotation.NumberConstraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class NumberValidator implements ConstraintValidator<NumberConstraint, Float> {
    private float min;
    private float max;

    @Override
    public void initialize(NumberConstraint constraintAnnotation) {
        this.min = constraintAnnotation.min();
        this.max = constraintAnnotation.max();
    }

    @Override
    public boolean isValid(Float v, ConstraintValidatorContext constraintValidatorContext) {
        if(v == null){
            return true;
        }
        return v >= min && v <= max;
    }
}
