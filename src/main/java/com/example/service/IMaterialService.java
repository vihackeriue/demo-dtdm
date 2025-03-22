package com.example.service;

import com.example.entity.MaterialEntity;

import java.util.List;

public interface IMaterialService {
    public List<MaterialEntity> getAllMaterials();
    public MaterialEntity getMaterialById(Long id);
    public MaterialEntity saveMaterial(MaterialEntity material);
    public void deleteMaterial(Long id);
}
