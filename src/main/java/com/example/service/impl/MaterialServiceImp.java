package com.example.service.impl;

import com.example.entity.MaterialEntity;
import com.example.repository.MaterialRepository;
import com.example.service.IMaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialServiceImp implements IMaterialService {
    @Autowired
    private MaterialRepository materialRepository;

    @Override
    public List<MaterialEntity> getAllMaterials() {
        return materialRepository.findAll();
    }

    @Override
    public MaterialEntity getMaterialById(Long id) {
        return materialRepository.findById(id).orElse(null);
    }

    @Override
    public MaterialEntity saveMaterial(MaterialEntity material) {
        return materialRepository.save(material);
    }

    @Override
    public void deleteMaterial(Long id) {
        materialRepository.deleteById(id);
    }
}
