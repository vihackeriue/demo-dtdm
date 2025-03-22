package com.example.controller.admin;

import com.example.entity.ShiftDetailEntity;
import com.example.entity.ShiftEntity;
import com.example.service.IShiftService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.*;

@Controller
@RequestMapping("/manage/manager/shift")
public class ShiftController {
    @Autowired
    private IShiftService shiftService;
    @GetMapping(value="/list")
    public String listShifts(Model model) {
        List<ShiftEntity> list = shiftService.getShifts();
        if(!list.isEmpty()) {
            model.addAttribute("shifts", list);
        }
        System.out.println(list);
        return "admin/shift_list";
    }
    @GetMapping(value="/api/list")
    public List<Map<String, Object>> listAPIShifts() {
        List<ShiftEntity> lists = shiftService.getShifts();

        List<Map<String, Object>> events = new ArrayList<>();
        for (ShiftEntity shift : lists) {
            Map<String, Object> event = new HashMap<>();
            event.put("id", shift.getShiftId());
            event.put("title", shift.getShiftName());
            event.put("start", shift.getStartTime().toString());
            event.put("end", shift.getEndTime().toString());
            events.add(event);
            System.out.println(event.toString());
        }

        return events;
    }
    @GetMapping("/new")
    public String addShift(Model model) {
        return "admin/shift_form";
    }
    @GetMapping("/calendar")
    public String listCalendar(@RequestParam(defaultValue = "0") int weekOffset,
                               @RequestParam(required = false) String currentWeekStart,
                               Model model) {
        LocalDate today = LocalDate.now();
        LocalDate startOfWeek;

        if (currentWeekStart != null) {
            startOfWeek = LocalDate.parse(currentWeekStart).plusWeeks(weekOffset);
        } else {
            WeekFields weekFields = WeekFields.of(Locale.getDefault());
            startOfWeek = today.with(weekFields.dayOfWeek(), 1).plusWeeks(weekOffset);
        }

        LocalDate endOfWeek = startOfWeek.plusDays(6);

        List<LocalDate> daysOfWeek = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            daysOfWeek.add(startOfWeek.plusDays(i));
        }

        List<ShiftDetailEntity> listShiftToDay = shiftService.listShiftToDay(today);

        model.addAttribute("daysOfWeek", daysOfWeek);
        model.addAttribute("startOfWeek", startOfWeek);
        model.addAttribute("endOfWeek", endOfWeek);
        model.addAttribute("today", today);
        model.addAttribute("listShiftToDay", listShiftToDay);
        model.addAttribute("weekOffset", weekOffset);
        model.addAttribute("currentWeekStart", startOfWeek);

        List<ShiftEntity> shifts = shiftService.getShifts();
        if (!shifts.isEmpty()) {
            model.addAttribute("shifts", shifts);
        }

        return "admin/shift_calendar";
    }

    @PostMapping("/new")
    public String addShift(@ModelAttribute ShiftEntity shift) {
        shiftService.addShift(shift);

        return "redirect:/manage/manager/shift/list";
    }
    @PostMapping("/delete/{id}")
    public String addShift(@PathVariable Long id) {
        shiftService.deleteShift(id);

        return "redirect:/manage/manager/shift/list";
    }
    @PostMapping(value = "/roll-attendance/{shiftDetailID}")
    public String RollAttendance(@PathVariable Long shiftDetailID){
        boolean check = shiftService.RollAttendance(shiftDetailID);
        if(check){
            System.out.println("Đã điểm danh");
            return "redirect:/manage/home";
        }else {
            System.out.println("Chưa được điểm danh");
            return "redirect:/manage/home";
        }
    }
}
