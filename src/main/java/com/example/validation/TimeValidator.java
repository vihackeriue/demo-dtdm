package com.example.validation;

import com.example.annotation.TimeConstraint;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.BeanWrapperImpl;

import java.time.LocalTime;

public class TimeValidator implements ConstraintValidator<TimeConstraint, Object> {
    private String startTimeField;
    private String endTimeField;

    @Override
    public void initialize(TimeConstraint constraintAnnotation) {
        this.startTimeField = constraintAnnotation.startTime();
        this.endTimeField = constraintAnnotation.endTime();
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext constraintValidatorContext) {
        BeanWrapperImpl beanWrapper = new BeanWrapperImpl(value);
        Object startTimeObj = beanWrapper.getPropertyValue(startTimeField);
        Object endTimeObj = beanWrapper.getPropertyValue(endTimeField);

        if (startTimeObj == null || endTimeObj == null) {
            return true;
        }

        LocalTime startTime = (LocalTime) startTimeObj;
        LocalTime endTime = (LocalTime) endTimeObj;

        boolean valid =  endTime.isAfter(startTime);
        if (!valid) {
            constraintValidatorContext.buildConstraintViolationWithTemplate(constraintValidatorContext.getDefaultConstraintMessageTemplate())
                    .addPropertyNode(endTimeField)
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();

            constraintValidatorContext.buildConstraintViolationWithTemplate(constraintValidatorContext.getDefaultConstraintMessageTemplate())
                    .addPropertyNode(startTimeField)
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
        }
        return valid;
    }
}
