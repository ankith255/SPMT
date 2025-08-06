package com.sgpt.api.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AssetDTO {
    private UUID id;
    private UUID projectId;
    private UUID sprintId;
    private String name;
    private String description;
    private UUID assetTypeId;
    private String assetTypeName;
    private UUID assetCategoryId;
    private String assetCategoryName;
    private UUID assignedArtistId;
    private String assignedArtistName;
    private UUID reviewerId;
    private String reviewerName;
    private String priority;
    private String status;
    private BigDecimal estimatedHours;
    private BigDecimal actualHours;
    private BigDecimal estimatedCost;
    private BigDecimal actualCost;
    
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate dueDate;
    
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime completedDate;
    
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime createdAt;
    
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime updatedAt;
    
    // Additional fields for dashboard
    private Boolean isOverdue;
    private Integer daysRemaining;
    private String progressPercentage;
    private Integer feedbackCount;
    private Integer fileCount;
}