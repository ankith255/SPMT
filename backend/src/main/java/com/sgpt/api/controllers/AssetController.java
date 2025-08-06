package com.sgpt.api.controllers;

import com.sgpt.api.dto.AssetDTO;
import com.sgpt.api.dto.AssetCreateRequest;
import com.sgpt.api.dto.AssetUpdateRequest;
import com.sgpt.api.dto.AssetFilterRequest;
import com.sgpt.api.services.AssetService;
import com.sgpt.api.utils.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import java.util.UUID;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/api/v1/assets")
@Tag(name = "Asset Management", description = "Art asset pipeline management endpoints")
public class AssetController {

    @Autowired
    private AssetService assetService;

    @GetMapping
    @Operation(summary = "Get all assets with filtering and pagination")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD', 'ARTIST')")
    public ResponseEntity<ApiResponse<Page<AssetDTO>>> getAllAssets(
            @ModelAttribute AssetFilterRequest filterRequest,
            Pageable pageable) {
        Page<AssetDTO> assets = assetService.getAllAssets(filterRequest, pageable);
        return ResponseEntity.ok(ApiResponse.success(assets));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get asset by ID")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD', 'ARTIST')")
    public ResponseEntity<ApiResponse<AssetDTO>> getAssetById(@PathVariable UUID id) {
        AssetDTO asset = assetService.getAssetById(id);
        return ResponseEntity.ok(ApiResponse.success(asset));
    }

    @PostMapping
    @Operation(summary = "Create new asset")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<AssetDTO>> createAsset(@Valid @RequestBody AssetCreateRequest request) {
        AssetDTO asset = assetService.createAsset(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(ApiResponse.success(asset));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update asset")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD', 'ARTIST')")
    public ResponseEntity<ApiResponse<AssetDTO>> updateAsset(
            @PathVariable UUID id,
            @Valid @RequestBody AssetUpdateRequest request) {
        AssetDTO asset = assetService.updateAsset(id, request);
        return ResponseEntity.ok(ApiResponse.success(asset));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete asset")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER')")
    public ResponseEntity<ApiResponse<Void>> deleteAsset(@PathVariable UUID id) {
        assetService.deleteAsset(id);
        return ResponseEntity.ok(ApiResponse.success(null));
    }

    @PostMapping("/{id}/status")
    @Operation(summary = "Update asset status")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD', 'ARTIST')")
    public ResponseEntity<ApiResponse<AssetDTO>> updateAssetStatus(
            @PathVariable UUID id,
            @RequestParam String status) {
        AssetDTO asset = assetService.updateAssetStatus(id, status);
        return ResponseEntity.ok(ApiResponse.success(asset));
    }

    @PostMapping("/{id}/assign")
    @Operation(summary = "Assign asset to artist")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<AssetDTO>> assignAsset(
            @PathVariable UUID id,
            @RequestParam UUID artistId) {
        AssetDTO asset = assetService.assignAsset(id, artistId);
        return ResponseEntity.ok(ApiResponse.success(asset));
    }

    @PostMapping("/{id}/review")
    @Operation(summary = "Submit asset for review")
    @PreAuthorize("hasAnyRole('ADMIN', 'ARTIST')")
    public ResponseEntity<ApiResponse<AssetDTO>> submitForReview(@PathVariable UUID id) {
        AssetDTO asset = assetService.submitForReview(id);
        return ResponseEntity.ok(ApiResponse.success(asset));
    }

    @PostMapping("/{id}/approve")
    @Operation(summary = "Approve asset")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<AssetDTO>> approveAsset(@PathVariable UUID id) {
        AssetDTO asset = assetService.approveAsset(id);
        return ResponseEntity.ok(ApiResponse.success(asset));
    }

    @PostMapping("/{id}/reject")
    @Operation(summary = "Reject asset")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<AssetDTO>> rejectAsset(
            @PathVariable UUID id,
            @RequestParam String feedback) {
        AssetDTO asset = assetService.rejectAsset(id, feedback);
        return ResponseEntity.ok(ApiResponse.success(asset));
    }

    @GetMapping("/{id}/files")
    @Operation(summary = "Get asset files")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD', 'ARTIST')")
    public ResponseEntity<ApiResponse<Object>> getAssetFiles(@PathVariable UUID id) {
        Object files = assetService.getAssetFiles(id);
        return ResponseEntity.ok(ApiResponse.success(files));
    }

    @PostMapping("/{id}/files")
    @Operation(summary = "Upload asset file")
    @PreAuthorize("hasAnyRole('ADMIN', 'ARTIST')")
    public ResponseEntity<ApiResponse<Object>> uploadAssetFile(
            @PathVariable UUID id,
            @RequestParam("file") MultipartFile file) {
        Object result = assetService.uploadAssetFile(id, file);
        return ResponseEntity.ok(ApiResponse.success(result));
    }

    @GetMapping("/dashboard/stats")
    @Operation(summary = "Get asset dashboard statistics")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<Object>> getAssetStats() {
        Object stats = assetService.getAssetStats();
        return ResponseEntity.ok(ApiResponse.success(stats));
    }

    @GetMapping("/overdue")
    @Operation(summary = "Get overdue assets")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<Object>> getOverdueAssets() {
        Object overdueAssets = assetService.getOverdueAssets();
        return ResponseEntity.ok(ApiResponse.success(overdueAssets));
    }
}