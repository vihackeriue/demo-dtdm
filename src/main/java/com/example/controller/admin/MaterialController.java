package com.example.controller.admin;

import com.example.entity.MaterialEntity;
import com.example.service.IMaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/manage/material")
public class MaterialController {
    @Autowired
    IMaterialService materialService;

    @GetMapping("/list")
    public String listMaterial(Model model) {
        List<MaterialEntity> materials = materialService.getAllMaterials();
        model.addAttribute("materials", materials);

        return "admin/material_list";
    }

    @GetMapping("/new")
    public String newMaterial(Model model) {
        return "admin/material_form";
    }

    @PostMapping("/new")
    public String newMaterial(@RequestParam("materialName") String name,
                              @RequestParam("unitsOfMeasurement") String unitsOfMeasurement,
                              @RequestParam("quantity") int quantity,
                              Model model) {
        MaterialEntity material = new MaterialEntity();
        material.setMaterialName(name);
        material.setUnitsOfMeasurement(unitsOfMeasurement);
        material.setQuantity(quantity);

        materialService.saveMaterial(material);

        return "redirect:/manage/material/list";
    }

    @GetMapping("/edit/{id}")
    public String editMaterial(@PathVariable("id") Long id, Model model) {
        MaterialEntity material = materialService.getMaterialById(id);

        model.addAttribute("material", material);
        return "admin/material_edit_form";
    }

    @PostMapping("/edit")
    public String editMaterialHandler(@ModelAttribute("material") MaterialEntity material){
        System.out.println(material);
        materialService.saveMaterial(material);

        return "redirect:/manage/material/list";
    }

    @PostMapping("/delete/{id}")
    public String deleteMaterial(@PathVariable("id") Long id, Model model) {
        materialService.deleteMaterial(id);
        return "redirect:/manage/material/list";
    }

}
