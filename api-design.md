# Smart Game Production Tracker (SGPT) - RESTful API Design

## Base Configuration
- **Base URL**: `https://api.sgpt.studio/v1`
- **Authentication**: JWT Bearer tokens
- **Content-Type**: `application/json`
- **Rate Limiting**: 1000 requests/hour per user, 5000/hour for admin

## Authentication Endpoints

### POST /auth/login
**Description**: Authenticate user and receive JWT token
```json
Request:
{
  "username": "string",
  "password": "string"
}

Response:
{
  "token": "jwt_token_string",
  "refresh_token": "refresh_token_string",
  "user": {
    "id": "uuid",
    "username": "string",
    "email": "string",
    "role": "admin|producer|team_lead|artist|designer|developer|qa_tester|freelancer",
    "department": "art|design|ui_ux|frontend|backend|qa|production|management"
  },
  "expires_in": 3600
}
```

### POST /auth/refresh
**Description**: Refresh JWT token
```json
Request:
{
  "refresh_token": "string"
}

Response:
{
  "token": "new_jwt_token",
  "expires_in": 3600
}
```

### POST /auth/logout
**Description**: Invalidate tokens

## User Management

### GET /users
**Description**: Get all users (paginated)
**Query Parameters**: 
- `page=0&size=20`
- `role=admin|producer|...`
- `department=art|design|...`
- `active=true|false`

```json
Response:
{
  "content": [
    {
      "id": "uuid",
      "username": "string",
      "email": "string",
      "firstName": "string",
      "lastName": "string",
      "role": "string",
      "department": "string",
      "isActive": true,
      "hourlyRate": 75.00,
      "githubUsername": "string",
      "plasticScmUsername": "string",
      "createdAt": "2024-01-01T00:00:00Z"
    }
  ],
  "pageable": {...},
  "totalElements": 50,
  "totalPages": 3
}
```

### GET /users/{userId}
**Description**: Get user by ID

### POST /users
**Description**: Create new user (Admin only)
```json
Request:
{
  "username": "string",
  "email": "string",
  "password": "string",
  "firstName": "string",
  "lastName": "string",
  "role": "string",
  "department": "string",
  "hourlyRate": 75.00,
  "githubUsername": "string",
  "plasticScmUsername": "string"
}
```

### PUT /users/{userId}
**Description**: Update user

### DELETE /users/{userId}
**Description**: Deactivate user (Admin only)

### GET /users/{userId}/workload
**Description**: Get user's current workload
```json
Response:
{
  "userId": "uuid",
  "assignedTasks": 5,
  "activeTasks": 3,
  "assignedAssets": 2,
  "activeAssets": 1,
  "assignedBugs": 1,
  "totalEstimatedHours": 40.5,
  "totalActualHours": 25.0,
  "utilizationRate": 85.5
}
```

## Project Management

### GET /projects
**Description**: Get all projects (paginated)
**Query Parameters**:
- `status=planning|active|on_hold|completed|cancelled`
- `producerId=uuid`

### GET /projects/{projectId}
**Description**: Get project details with overview

### POST /projects
**Description**: Create new project (Producer/Admin only)
```json
Request:
{
  "name": "string",
  "description": "string",
  "startDate": "2024-01-01",
  "endDate": "2024-12-31",
  "budget": 100000.00,
  "producerId": "uuid",
  "githubRepoUrl": "string",
  "plasticScmRepo": "string"
}
```

### PUT /projects/{projectId}
**Description**: Update project

### DELETE /projects/{projectId}
**Description**: Archive project (Admin only)

### GET /projects/{projectId}/overview
**Description**: Get project overview with statistics
```json
Response:
{
  "id": "uuid",
  "name": "string",
  "status": "string",
  "progress": {
    "sprintCount": 5,
    "taskCount": 120,
    "completedTasks": 75,
    "assetCount": 45,
    "approvedAssets": 30,
    "bugCount": 15,
    "openBugs": 5
  },
  "timeline": {
    "startDate": "2024-01-01",
    "endDate": "2024-12-31",
    "daysRemaining": 180
  },
  "budget": {
    "allocated": 100000.00,
    "spent": 45000.00,
    "remaining": 55000.00
  }
}
```

## Sprint Management

### GET /projects/{projectId}/sprints
**Description**: Get sprints for project

### POST /projects/{projectId}/sprints
**Description**: Create new sprint
```json
Request:
{
  "name": "Sprint 1",
  "description": "Initial development sprint",
  "startDate": "2024-01-01",
  "endDate": "2024-01-14",
  "storyPointsPlanned": 50
}
```

### GET /sprints/{sprintId}
**Description**: Get sprint details

### PUT /sprints/{sprintId}
**Description**: Update sprint

### DELETE /sprints/{sprintId}
**Description**: Delete sprint

### GET /sprints/{sprintId}/velocity
**Description**: Get sprint velocity metrics
```json
Response:
{
  "sprintId": "uuid",
  "storyPointsPlanned": 50,
  "storyPointsCompleted": 45,
  "velocityRate": 90.0,
  "burndownData": [
    {"date": "2024-01-01", "remaining": 50},
    {"date": "2024-01-02", "remaining": 47}
  ]
}
```

## Task Management

### GET /tasks
**Description**: Get tasks (paginated with filters)
**Query Parameters**:
- `projectId=uuid`
- `sprintId=uuid`
- `assignedToId=uuid`
- `status=todo|in_progress|in_review|completed|blocked|cancelled`
- `type=development|design|art|qa|research|review|meeting|documentation`
- `priority=low|medium|high|critical`

### POST /tasks
**Description**: Create new task
```json
Request:
{
  "projectId": "uuid",
  "sprintId": "uuid",
  "title": "string",
  "description": "string",
  "taskType": "development",
  "priority": "medium",
  "assignedToId": "uuid",
  "storyPoints": 5,
  "estimatedHours": 8.0,
  "dueDate": "2024-01-15",
  "parentTaskId": "uuid",
  "dependencies": ["uuid1", "uuid2"],
  "tags": ["feature", "ui"]
}
```

### GET /tasks/{taskId}
**Description**: Get task details

### PUT /tasks/{taskId}
**Description**: Update task

### DELETE /tasks/{taskId}
**Description**: Delete task

### POST /tasks/{taskId}/time-log
**Description**: Log time spent on task
```json
Request:
{
  "hours": 2.5,
  "date": "2024-01-15",
  "description": "Implemented user authentication"
}
```

### GET /tasks/{taskId}/dependencies
**Description**: Get task dependencies and dependents

## Art Asset Pipeline

### GET /projects/{projectId}/assets
**Description**: Get art assets for project
**Query Parameters**:
- `type=character|environment|ui_asset|vfx|prop|audio|texture|model`
- `stage=concept|modeling|texturing|rigging|animation|qa|approved|rejected`
- `assignedArtistId=uuid`
- `priority=low|medium|high|critical`

### POST /projects/{projectId}/assets
**Description**: Create new art asset
```json
Request:
{
  "name": "Main Character",
  "description": "Primary protagonist character model",
  "assetType": "character",
  "priority": "high",
  "assignedArtistId": "uuid",
  "estimatedHours": 40.0,
  "estimatedCost": 3000.00,
  "dueDate": "2024-02-01"
}
```

### GET /assets/{assetId}
**Description**: Get asset details with stage history

### PUT /assets/{assetId}
**Description**: Update asset

### PUT /assets/{assetId}/stage
**Description**: Update asset stage
```json
Request:
{
  "newStage": "texturing",
  "notes": "Modeling completed, moving to texturing phase"
}
```

### POST /assets/{assetId}/feedback
**Description**: Add feedback to asset
```json
Request:
{
  "feedback": "Great work! Please adjust the lighting on the face.",
  "requestsRevision": true
}
```

### GET /assets/{assetId}/stage-history
**Description**: Get asset stage progression history

## UI/UX Workflow

### GET /projects/{projectId}/ui-components
**Description**: Get UI components for project

### POST /projects/{projectId}/ui-components
**Description**: Create new UI component
```json
Request:
{
  "name": "Login Screen",
  "screenName": "Authentication",
  "assignedDesignerId": "uuid",
  "assignedDeveloperId": "uuid",
  "estimatedHours": 16.0,
  "priority": "high",
  "figmaUrl": "https://figma.com/...",
  "notes": "Responsive design required"
}
```

### GET /ui-components/{componentId}
**Description**: Get UI component details

### PUT /ui-components/{componentId}
**Description**: Update UI component

### PUT /ui-components/{componentId}/stage
**Description**: Update UI component stage

## Design Documentation

### GET /projects/{projectId}/design-docs
**Description**: Get design documents for project

### POST /projects/{projectId}/design-docs
**Description**: Create new design document
```json
Request:
{
  "title": "Combat System Design",
  "content": "Detailed description of combat mechanics...",
  "authorId": "uuid",
  "reviewerId": "uuid",
  "tags": ["combat", "gameplay", "mechanics"],
  "fileUrl": "https://docs.google.com/..."
}
```

### GET /design-docs/{docId}
**Description**: Get design document

### PUT /design-docs/{docId}
**Description**: Update design document

### PUT /design-docs/{docId}/approve
**Description**: Approve design document (Reviewer only)

### GET /projects/{projectId}/balancing-sheets
**Description**: Get balancing sheets for project

### POST /projects/{projectId}/balancing-sheets
**Description**: Create balancing sheet
```json
Request:
{
  "name": "Weapon Balance v1.0",
  "category": "combat",
  "data": {
    "weapons": [
      {"name": "Sword", "damage": 50, "speed": 1.2, "range": 2.0},
      {"name": "Bow", "damage": 35, "speed": 0.8, "range": 10.0}
    ]
  }
}
```

## Bug Tracking

### GET /bugs
**Description**: Get bugs (paginated with filters)
**Query Parameters**:
- `projectId=uuid`
- `status=open|in_progress|resolved|closed|reopened`
- `severity=low|medium|high|critical|blocker`
- `module=art|design|ui_ux|frontend|backend|qa`
- `assignedToId=uuid`

### POST /bugs
**Description**: Create new bug report
```json
Request:
{
  "projectId": "uuid",
  "title": "Login button not responding",
  "description": "The login button becomes unresponsive after invalid credentials",
  "severity": "high",
  "priority": "high",
  "module": "frontend",
  "reportedById": "uuid",
  "environment": "Unity Editor 2023.1",
  "stepsToReproduce": "1. Enter invalid credentials\n2. Click login\n3. Try clicking again",
  "expectedBehavior": "Button should remain clickable",
  "actualBehavior": "Button becomes disabled permanently"
}
```

### GET /bugs/{bugId}
**Description**: Get bug details

### PUT /bugs/{bugId}
**Description**: Update bug

### PUT /bugs/{bugId}/assign
**Description**: Assign bug to user
```json
Request:
{
  "assignedToId": "uuid"
}
```

### PUT /bugs/{bugId}/resolve
**Description**: Resolve bug
```json
Request:
{
  "resolution": "Fixed in commit abc123",
  "relatedCommits": ["uuid1", "uuid2"]
}
```

## Version Control Integration

### GET /projects/{projectId}/repositories
**Description**: Get repositories for project

### POST /projects/{projectId}/repositories
**Description**: Add repository to project
```json
Request:
{
  "name": "Backend API",
  "type": "github",
  "url": "https://github.com/studio/backend-api",
  "apiToken": "encrypted_token"
}
```

### POST /repositories/{repoId}/sync
**Description**: Trigger repository synchronization

### GET /repositories/{repoId}/commits
**Description**: Get recent commits
**Query Parameters**:
- `since=2024-01-01`
- `until=2024-01-31`
- `authorId=uuid`
- `branch=main`

### GET /repositories/{repoId}/pull-requests
**Description**: Get pull requests
**Query Parameters**:
- `status=open|closed|merged`
- `authorId=uuid`

### GET /commits/{commitId}
**Description**: Get commit details

### GET /pull-requests/{prId}
**Description**: Get pull request details

## Finance & Cost Tracking

### GET /projects/{projectId}/cost-entries
**Description**: Get cost entries for project
**Query Parameters**:
- `userId=uuid`
- `startDate=2024-01-01`
- `endDate=2024-01-31`
- `paymentStatus=pending|approved|paid`

### POST /cost-entries
**Description**: Create cost entry
```json
Request:
{
  "projectId": "uuid",
  "userId": "uuid",
  "taskId": "uuid",
  "description": "Frontend development work",
  "hoursWorked": 8.0,
  "hourlyRate": 75.00,
  "workDate": "2024-01-15"
}
```

### PUT /cost-entries/{entryId}/approve
**Description**: Approve cost entry (Team Lead/Admin only)

### GET /projects/{projectId}/budget-summary
**Description**: Get budget summary
```json
Response:
{
  "projectId": "uuid",
  "totalBudget": 100000.00,
  "totalSpent": 45000.00,
  "remaining": 55000.00,
  "byDepartment": {
    "art": 15000.00,
    "frontend": 12000.00,
    "backend": 18000.00
  },
  "monthlyBurn": 8500.00,
  "projectedCompletion": "2024-08-15"
}
```

### GET /projects/{projectId}/payment-milestones
**Description**: Get payment milestones for freelancers

### POST /projects/{projectId}/payment-milestones
**Description**: Create payment milestone
```json
Request:
{
  "freelancerId": "uuid",
  "milestoneName": "Character Art Package 1",
  "description": "Complete 5 character models",
  "amount": 5000.00,
  "dueDate": "2024-02-01",
  "completionCriteria": "All 5 models approved and delivered"
}
```

## Performance & Analytics

### GET /users/{userId}/performance
**Description**: Get user performance metrics
**Query Parameters**:
- `periodStart=2024-01-01`
- `periodEnd=2024-01-31`

```json
Response:
{
  "userId": "uuid",
  "period": {
    "start": "2024-01-01",
    "end": "2024-01-31"
  },
  "metrics": {
    "tasksCompleted": 15,
    "storyPointsCompleted": 75,
    "totalHoursLogged": 160.0,
    "commitsCount": 45,
    "pullRequestsCount": 8,
    "bugsReported": 3,
    "bugsFixed": 5,
    "onTimeDeliveryRate": 87.5,
    "averageTaskCompletionTime": 10.5,
    "feedbackScore": 4.2,
    "revisionCount": 2
  }
}
```

### GET /projects/{projectId}/analytics
**Description**: Get project analytics
```json
Response:
{
  "projectId": "uuid",
  "velocity": {
    "currentSprintVelocity": 45,
    "averageVelocity": 42,
    "velocityTrend": "increasing"
  },
  "quality": {
    "bugDensity": 0.15,
    "defectEscapeRate": 0.05,
    "codeReviewCoverage": 0.95
  },
  "timeline": {
    "onScheduleTasks": 85,
    "delayedTasks": 10,
    "averageDelayDays": 2.3
  }
}
```

### GET /projects/{projectId}/team-performance
**Description**: Get team performance summary

## Notifications & Alerts

### GET /notifications
**Description**: Get user notifications
**Query Parameters**:
- `unread=true|false`
- `type=deadline_warning|task_overdue|review_pending|...`

### PUT /notifications/{notificationId}/read
**Description**: Mark notification as read

### PUT /notifications/read-all
**Description**: Mark all notifications as read

### GET /notifications/settings
**Description**: Get user notification preferences

### PUT /notifications/settings
**Description**: Update notification preferences
```json
Request:
{
  "channels": ["email", "discord"],
  "types": {
    "deadline_warning": true,
    "task_overdue": true,
    "review_pending": false
  }
}
```

## AI & Automation

### POST /ai/predict-delay
**Description**: Get delay prediction for task/sprint/asset
```json
Request:
{
  "entityType": "task",
  "entityId": "uuid",
  "factors": {
    "currentProgress": 0.6,
    "remainingTime": 5,
    "teamVelocity": 42,
    "complexityScore": 8
  }
}

Response:
{
  "predictionId": "uuid",
  "delayProbability": 0.73,
  "estimatedDelayDays": 3,
  "confidenceScore": 0.85,
  "factors": {
    "primary": "below average velocity",
    "secondary": "high complexity"
  },
  "recommendations": [
    "Consider adding additional resources",
    "Break down into smaller tasks"
  ]
}
```

### POST /ai/generate-summary
**Description**: Generate AI summary for period/project
```json
Request:
{
  "summaryType": "sprint",
  "projectId": "uuid",
  "sprintId": "uuid",
  "periodStart": "2024-01-01",
  "periodEnd": "2024-01-14"
}

Response:
{
  "summaryId": "uuid",
  "content": "Sprint 1 completed with 90% velocity...",
  "keyMetrics": {
    "velocityAchieved": 0.9,
    "tasksCompleted": 18,
    "bugsFound": 3
  },
  "recommendations": [
    "Increase testing coverage",
    "Consider pair programming for complex tasks"
  ]
}
```

### GET /ai/predictions/{predictionId}
**Description**: Get AI prediction details

### PUT /ai/predictions/{predictionId}/feedback
**Description**: Provide feedback on prediction accuracy
```json
Request:
{
  "wasAccurate": true,
  "actualOutcome": "Task completed on time",
  "notes": "Prediction helped us allocate resources properly"
}
```

## Dashboard & Reports

### GET /dashboard/overview
**Description**: Get main dashboard data
```json
Response:
{
  "activeProjects": 3,
  "overdueTasks": 5,
  "criticalBugs": 2,
  "teamUtilization": 0.82,
  "recentActivity": [...],
  "upcomingDeadlines": [...],
  "budgetAlerts": [...]
}
```

### GET /dashboard/project/{projectId}
**Description**: Get project-specific dashboard

### POST /reports/generate
**Description**: Generate custom report
```json
Request:
{
  "reportType": "sprint_summary|project_overview|team_performance",
  "projectId": "uuid",
  "periodStart": "2024-01-01",
  "periodEnd": "2024-01-31",
  "format": "pdf|excel|json",
  "includeCharts": true
}

Response:
{
  "reportId": "uuid",
  "downloadUrl": "https://api.sgpt.studio/reports/download/uuid",
  "expiresAt": "2024-02-01T00:00:00Z"
}
```

### GET /reports/{reportId}/download
**Description**: Download generated report

## WebSocket Endpoints (Real-time Updates)

### /ws/notifications
**Description**: Real-time notifications

### /ws/project/{projectId}/updates
**Description**: Project-specific real-time updates

### /ws/dashboard
**Description**: Dashboard real-time data updates

## Error Response Format
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid request data",
    "details": [
      {
        "field": "email",
        "message": "Invalid email format"
      }
    ],
    "timestamp": "2024-01-15T10:30:00Z",
    "path": "/api/v1/users"
  }
}
```

## Standard HTTP Status Codes
- `200 OK` - Success
- `201 Created` - Resource created
- `204 No Content` - Success with no response body
- `400 Bad Request` - Invalid request
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Insufficient permissions
- `404 Not Found` - Resource not found
- `409 Conflict` - Resource conflict
- `422 Unprocessable Entity` - Validation error
- `429 Too Many Requests` - Rate limit exceeded
- `500 Internal Server Error` - Server error

## Security Headers
All responses include:
- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: DENY`
- `X-XSS-Protection: 1; mode=block`
- `Strict-Transport-Security: max-age=31536000`