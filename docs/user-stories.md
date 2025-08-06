# Smart Game Production Tracker (SGPT) - User Stories

## Epic: Art Asset Pipeline

### User Story: Asset Creation and Assignment
**As a** Producer or Team Lead  
**I want to** create new assets and assign them to artists  
**So that** I can track the art pipeline and ensure proper resource allocation  

**Acceptance Criteria:**
- [ ] Can create assets with name, description, type, category, and estimated hours
- [ ] Can assign assets to specific artists
- [ ] Can set priority levels (low, medium, high, critical)
- [ ] Can set due dates for assets
- [ ] System automatically calculates estimated cost based on artist hourly rate
- [ ] Can upload reference materials and specifications

### User Story: Asset Status Tracking
**As an** Artist  
**I want to** update the status of my assigned assets  
**So that** producers and leads can track progress in real-time  

**Acceptance Criteria:**
- [ ] Can update asset status through the pipeline stages
- [ ] Can log actual hours worked on each asset
- [ ] Can upload work-in-progress files
- [ ] Can submit assets for review when ready
- [ ] System tracks time spent in each stage

### User Story: Asset Review and Approval
**As a** Team Lead or Producer  
**I want to** review submitted assets and provide feedback  
**So that** quality standards are maintained and artists get clear direction  

**Acceptance Criteria:**
- [ ] Can view submitted assets with all associated files
- [ ] Can approve or reject assets with detailed feedback
- [ ] Can request revisions with specific comments
- [ ] System notifies artists of review decisions
- [ ] Can track revision history and feedback loops

---

## Epic: Game Design Module

### User Story: Design Task Management
**As a** Game Designer  
**I want to** create and track design tasks  
**So that** I can organize my work and collaborate with the team  

**Acceptance Criteria:**
- [ ] Can create design tasks with titles, descriptions, and estimated hours
- [ ] Can assign tasks to specific designers
- [ ] Can link tasks to specific game features or mechanics
- [ ] Can track task status (todo, in_progress, review, approved, completed)
- [ ] Can set priority levels and due dates

### User Story: Design Document Management
**As a** Game Designer  
**I want to** create and version design documents  
**So that** I can maintain organized design documentation  

**Acceptance Criteria:**
- [ ] Can create design documents linked to specific tasks
- [ ] Can specify document type (mechanic, balance, level, system, narrative)
- [ ] Can version documents and track changes
- [ ] Can share documents with team members
- [ ] Can export documents in various formats

### User Story: Design Review Process
**As a** Producer or Lead Designer  
**I want to** review design work and provide feedback  
**So that** design quality is maintained and aligned with project goals  

**Acceptance Criteria:**
- [ ] Can review submitted design tasks and documents
- [ ] Can provide structured feedback with categories
- [ ] Can approve or request revisions
- [ ] System tracks review cycles and feedback history
- [ ] Can generate design review reports

---

## Epic: UI/UX Workflow

### User Story: UI Component Tracking
**As a** UI/UX Designer  
**I want to** track UI components through the design and development pipeline  
**So that** I can ensure proper handoff and implementation  

**Acceptance Criteria:**
- [ ] Can create UI components with specifications
- [ ] Can track components through stages (wireframe, mockup, prototype, implementation, testing, approved)
- [ ] Can assign designers and developers to components
- [ ] Can upload design files and specifications
- [ ] Can link components to specific screens or features

### User Story: UI Development Handoff
**As a** Frontend Developer  
**I want to** receive clear specifications and assets for UI implementation  
**So that** I can implement UI components accurately and efficiently  

**Acceptance Criteria:**
- [ ] Can view approved UI components with all specifications
- [ ] Can access design files and assets
- [ ] Can track implementation progress
- [ ] Can request clarification or additional assets
- [ ] Can mark components as implemented and ready for testing

---

## Epic: Frontend (Unity + Plastic SCM)

### User Story: Unity Module Management
**As a** Unity Developer  
**I want to** track Unity modules and features through development  
**So that** I can organize my work and collaborate effectively  

**Acceptance Criteria:**
- [ ] Can create Unity modules with descriptions and estimated hours
- [ ] Can track modules through development stages
- [ ] Can link modules to specific game features
- [ ] Can track performance metrics for modules
- [ ] Can assign modules to specific developers

### User Story: Plastic SCM Integration
**As a** Unity Developer  
**I want to** link my code changes to tracked modules  
**So that** my work is automatically tracked and visible to the team  

**Acceptance Criteria:**
- [ ] System automatically detects Plastic SCM changesets
- [ ] Can manually link changesets to specific modules
- [ ] Can track branch names and commit messages
- [ ] Can view code review status and merge history
- [ ] Can generate code contribution reports

### User Story: Unity Performance Tracking
**As a** Technical Lead  
**I want to** track Unity performance metrics  
**So that** I can identify and address performance bottlenecks  

**Acceptance Criteria:**
- [ ] Can record FPS, memory usage, and build size metrics
- [ ] Can track performance changes over time
- [ ] Can set performance targets and alerts
- [ ] Can generate performance reports
- [ ] Can identify modules causing performance issues

---

## Epic: Backend (Java Spring Boot + GitHub)

### User Story: Backend Module Management
**As a** Backend Developer  
**I want to** track backend modules and API development  
**So that** I can organize my work and ensure proper integration  

**Acceptance Criteria:**
- [ ] Can create backend modules with descriptions and estimated hours
- [ ] Can track modules through development stages
- [ ] Can link modules to specific API endpoints
- [ ] Can track deployment status and versioning
- [ ] Can assign modules to specific developers

### User Story: GitHub Integration
**As a** Backend Developer  
**I want to** link my GitHub work to tracked modules  
**So that** my contributions are automatically tracked  

**Acceptance Criteria:**
- [ ] System automatically detects GitHub pull requests and issues
- [ ] Can manually link GitHub items to specific modules
- [ ] Can track code review status and merge history
- [ ] Can view commit history and contribution metrics
- [ ] Can generate GitHub activity reports

### User Story: API Endpoint Tracking
**As a** Backend Developer  
**I want to** track API endpoints and their status  
**So that** I can maintain API documentation and versioning  

**Acceptance Criteria:**
- [ ] Can create and track API endpoints
- [ ] Can specify HTTP methods and paths
- [ ] Can track endpoint status (development, testing, production, deprecated)
- [ ] Can link endpoints to specific modules
- [ ] Can generate API documentation

---

## Epic: QA and Bug Tracking

### User Story: Cross-Module Bug Tracking
**As a** QA Tester  
**I want to** report bugs across all modules  
**So that** issues are properly tracked and resolved  

**Acceptance Criteria:**
- [ ] Can create bugs with detailed descriptions
- [ ] Can specify bug type (art, ui, frontend, backend, design, performance, crash)
- [ ] Can set priority and severity levels
- [ ] Can link bugs to specific assets, components, or modules
- [ ] Can assign bugs to appropriate team members

### User Story: Bug Lifecycle Management
**As a** Team Member  
**I want to** track bug resolution progress  
**So that** I can ensure timely fixes and quality assurance  

**Acceptance Criteria:**
- [ ] Can update bug status through resolution stages
- [ ] Can add comments and progress updates
- [ ] Can track time spent on bug fixes
- [ ] Can link fixes to specific code changes
- [ ] Can generate bug resolution reports

### User Story: Test Case Management
**As a** QA Lead  
**I want to** create and track test cases  
**So that** I can ensure comprehensive testing coverage  

**Acceptance Criteria:**
- [ ] Can create test cases with detailed descriptions
- [ ] Can specify test types (unit, integration, ui, performance, regression)
- [ ] Can assign test cases to specific testers
- [ ] Can track test execution status
- [ ] Can generate test coverage reports

---

## Epic: Finance & Estimation

### User Story: Cost Tracking
**As a** Producer  
**I want to** track costs across all project activities  
**So that** I can manage budgets and make informed decisions  

**Acceptance Criteria:**
- [ ] Can track labor costs based on hourly rates and time spent
- [ ] Can track material, software, and hardware costs
- [ ] Can link costs to specific assets, tasks, or modules
- [ ] Can generate cost reports by project, sprint, or team
- [ ] Can set budget alerts and notifications

### User Story: Rate Card Management
**As a** Producer  
**I want to** manage team member rate cards  
**So that** I can accurately estimate and track project costs  

**Acceptance Criteria:**
- [ ] Can create and update rate cards for team members
- [ ] Can specify effective dates for rate changes
- [ ] Can track rate history over time
- [ ] Can set different rates for different roles
- [ ] Can generate cost estimates based on current rates

### User Story: Payment Milestone Tracking
**As a** Producer  
**I want to** track payment milestones for freelancers and contractors  
**So that** I can ensure timely payments and maintain relationships  

**Acceptance Criteria:**
- [ ] Can create payment milestones with amounts and due dates
- [ ] Can track milestone status (pending, approved, paid)
- [ ] Can link milestones to specific deliverables
- [ ] Can generate payment reports and schedules
- [ ] Can set payment reminders and notifications

---

## Epic: Performance & Review Engine

### User Story: Effort Tracking
**As a** Team Member  
**I want to** log my daily work hours  
**So that** my contributions are properly tracked and recognized  

**Acceptance Criteria:**
- [ ] Can log daily hours worked on specific tasks
- [ ] Can add descriptions of work completed
- [ ] Can link time entries to specific projects or modules
- [ ] Can view personal time tracking history
- [ ] Can generate personal productivity reports

### User Story: Performance Reviews
**As a** Team Lead  
**I want to** conduct performance reviews based on tracked data  
**So that** I can provide fair and data-driven feedback  

**Acceptance Criteria:**
- [ ] Can generate performance reports based on tracked metrics
- [ ] Can review quality, productivity, and collaboration scores
- [ ] Can add subjective comments and feedback
- [ ] Can track review history over time
- [ ] Can generate performance trends and insights

### User Story: Team Performance Analytics
**As a** Producer  
**I want to** view team performance analytics  
**So that** I can identify areas for improvement and resource allocation  

**Acceptance Criteria:**
- [ ] Can view team velocity and productivity metrics
- [ ] Can compare team performance across projects
- [ ] Can identify high and low performers
- [ ] Can track team capacity and utilization
- [ ] Can generate team performance reports

---

## Epic: Notification & Delay Engine

### User Story: Automated Notifications
**As a** Team Member  
**I want to** receive timely notifications about important events  
**So that** I can stay informed and take action when needed  

**Acceptance Criteria:**
- [ ] Receive notifications for assigned tasks and deadlines
- [ ] Receive notifications for review requests and feedback
- [ ] Receive notifications for overdue items and blockers
- [ ] Can configure notification preferences
- [ ] Can receive notifications via email, Discord, or Slack

### User Story: Delay Prediction
**As a** Producer  
**I want to** receive early warnings about potential delays  
**So that** I can take proactive measures to keep projects on track  

**Acceptance Criteria:**
- [ ] System predicts delays based on historical data and current progress
- [ ] Receive alerts for items at risk of missing deadlines
- [ ] Can view confidence scores for predictions
- [ ] Can see factors contributing to delay predictions
- [ ] Can take action to address predicted delays

### User Story: Blocker Management
**As a** Team Lead  
**I want to** identify and track project blockers  
**So that** I can help resolve issues and keep work flowing  

**Acceptance Criteria:**
- [ ] Can identify and categorize blockers
- [ ] Can assign blockers to appropriate team members
- [ ] Can track blocker resolution progress
- [ ] Can receive alerts for new or unresolved blockers
- [ ] Can generate blocker reports and trends

---

## Epic: Unified Dashboard

### User Story: Personalized Dashboard
**As a** Team Member  
**I want to** view a personalized dashboard with my relevant information  
**So that** I can quickly see what I need to work on  

**Acceptance Criteria:**
- [ ] Can view assigned tasks and their status
- [ ] Can see upcoming deadlines and priorities
- [ ] Can view recent activity and notifications
- [ ] Can access quick actions for common tasks
- [ ] Can customize dashboard layout and preferences

### User Story: Project Overview Dashboard
**As a** Producer  
**I want to** view comprehensive project overview information  
**So that** I can make informed decisions and track project health  

**Acceptance Criteria:**
- [ ] Can view project progress and milestones
- [ ] Can see team velocity and capacity
- [ ] Can view budget and cost information
- [ ] Can identify risks and blockers
- [ ] Can access detailed reports and analytics

### User Story: Export and Reporting
**As a** Producer  
**I want to** export project data and generate reports  
**So that** I can share information with stakeholders and make presentations  

**Acceptance Criteria:**
- [ ] Can export data in Excel, PDF, and other formats
- [ ] Can generate sprint summaries and project reports
- [ ] Can create custom reports with specific filters
- [ ] Can schedule automated report generation
- [ ] Can share reports with team members and stakeholders

---

## Epic: AI Modules

### User Story: Auto-Summarization
**As a** Producer  
**I want to** receive automated summaries of project activity  
**So that** I can quickly understand project status without manual review  

**Acceptance Criteria:**
- [ ] Receive daily and weekly activity summaries
- [ ] Get sprint summaries with key metrics and highlights
- [ ] Receive project milestone summaries
- [ ] Can customize summary content and frequency
- [ ] Summaries include progress, blockers, and recommendations

### User Story: Delay Prediction
**As a** Producer  
**I want to** receive AI-powered delay predictions  
**So that** I can proactively address potential issues  

**Acceptance Criteria:**
- [ ] Receive predictions for task and milestone delays
- [ ] Get confidence scores and reasoning for predictions
- [ ] Receive recommendations for addressing predicted delays
- [ ] Can view prediction accuracy over time
- [ ] Can provide feedback to improve prediction accuracy

### User Story: Performance Review Generation
**As a** Team Lead  
**I want to** receive AI-generated performance review drafts  
**So that** I can save time while providing comprehensive feedback  

**Acceptance Criteria:**
- [ ] Receive draft performance reviews based on tracked metrics
- [ ] Can review and edit AI-generated content
- [ ] Reviews include quality, productivity, and collaboration insights
- [ ] Can add personal observations and feedback
- [ ] Can generate team performance comparison reports