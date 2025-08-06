package com.sgpt.api.controllers;

import com.sgpt.api.dto.DashboardStatsDTO;
import com.sgpt.api.dto.ProjectOverviewDTO;
import com.sgpt.api.services.DashboardService;
import com.sgpt.api.utils.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/dashboard")
@Tag(name = "Dashboard", description = "Unified dashboard endpoints")
public class DashboardController {

    @Autowired
    private DashboardService dashboardService;

    @GetMapping("/overview")
    @Operation(summary = "Get dashboard overview")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<DashboardStatsDTO>> getDashboardOverview() {
        DashboardStatsDTO overview = dashboardService.getDashboardOverview();
        return ResponseEntity.ok(ApiResponse.success(overview));
    }

    @GetMapping("/project/{projectId}")
    @Operation(summary = "Get project-specific dashboard")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<ProjectOverviewDTO>> getProjectDashboard(@PathVariable UUID projectId) {
        ProjectOverviewDTO projectOverview = dashboardService.getProjectDashboard(projectId);
        return ResponseEntity.ok(ApiResponse.success(projectOverview));
    }

    @GetMapping("/sprint/{sprintId}")
    @Operation(summary = "Get sprint-specific dashboard")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<Object>> getSprintDashboard(@PathVariable UUID sprintId) {
        Object sprintOverview = dashboardService.getSprintDashboard(sprintId);
        return ResponseEntity.ok(ApiResponse.success(sprintOverview));
    }

    @GetMapping("/team/{teamId}")
    @Operation(summary = "Get team-specific dashboard")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<Object>> getTeamDashboard(@PathVariable UUID teamId) {
        Object teamOverview = dashboardService.getTeamDashboard(teamId);
        return ResponseEntity.ok(ApiResponse.success(teamOverview));
    }

    @GetMapping("/user/{userId}")
    @Operation(summary = "Get user-specific dashboard")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<Object>> getUserDashboard(@PathVariable UUID userId) {
        Object userOverview = dashboardService.getUserDashboard(userId);
        return ResponseEntity.ok(ApiResponse.success(userOverview));
    }

    @GetMapping("/blockers")
    @Operation(summary = "Get current blockers")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<Object>> getBlockers() {
        Object blockers = dashboardService.getBlockers();
        return ResponseEntity.ok(ApiResponse.success(blockers));
    }

    @GetMapping("/delays")
    @Operation(summary = "Get delay predictions")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<Object>> getDelayPredictions() {
        Object delays = dashboardService.getDelayPredictions();
        return ResponseEntity.ok(ApiResponse.success(delays));
    }

    @GetMapping("/velocity")
    @Operation(summary = "Get velocity metrics")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<Object>> getVelocityMetrics() {
        Object velocity = dashboardService.getVelocityMetrics();
        return ResponseEntity.ok(ApiResponse.success(velocity));
    }

    @GetMapping("/performance")
    @Operation(summary = "Get performance metrics")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<Object>> getPerformanceMetrics() {
        Object performance = dashboardService.getPerformanceMetrics();
        return ResponseEntity.ok(ApiResponse.success(performance));
    }

    @GetMapping("/finance")
    @Operation(summary = "Get financial overview")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER')")
    public ResponseEntity<ApiResponse<Object>> getFinancialOverview() {
        Object finance = dashboardService.getFinancialOverview();
        return ResponseEntity.ok(ApiResponse.success(finance));
    }

    @GetMapping("/exports/project/{projectId}")
    @Operation(summary = "Export project data")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER')")
    public ResponseEntity<ApiResponse<Object>> exportProjectData(
            @PathVariable UUID projectId,
            @RequestParam String format) {
        Object export = dashboardService.exportProjectData(projectId, format);
        return ResponseEntity.ok(ApiResponse.success(export));
    }

    @GetMapping("/exports/sprint/{sprintId}")
    @Operation(summary = "Export sprint data")
    @PreAuthorize("hasAnyRole('ADMIN', 'PRODUCER', 'TEAM_LEAD')")
    public ResponseEntity<ApiResponse<Object>> exportSprintData(
            @PathVariable UUID sprintId,
            @RequestParam String format) {
        Object export = dashboardService.exportSprintData(sprintId, format);
        return ResponseEntity.ok(ApiResponse.success(export));
    }
}