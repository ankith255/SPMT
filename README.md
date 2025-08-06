# Smart Game Production Tracker (SGPT)

A modern, intelligent, and automated game production tracking system for Unity-based game studios using GitHub (Java Spring Boot backend) and Plastic SCM (Unity frontend).

## 🎯 Vision Statement

Build a modern, intelligent, and automated game production tracking system for a distributed or hybrid team. It should monitor asset pipelines, development status, milestones, finances, and performance using integrations with GitHub (Java Spring Boot backend) and Plastic SCM (Unity frontend). The system should notify delays, highlight blockers, and support studio growth and transparency.

## 🏗️ System Architecture

### Core Technologies
- **Backend**: Java Spring Boot
- **Frontend**: Angular/React (Modern Web UI)
- **Database**: PostgreSQL
- **Integrations**: GitHub API, Plastic SCM CLI/API, Discord, Slack
- **AI Support**: GPT-based auto-summarizer, delay prediction, performance review generation

### System Modules

#### 1. Art Asset Pipeline
- Track assets by type: Characters, Environments, UI, VFX, Props
- Stages: Concept → Modeling → Texturing → Rigging → Animation → QA → Approved
- Track assigned artist, estimated time, actual time, cost, delivery files, feedback loop

#### 2. Game Design Module
- Task assignment, design docs tracking, idea feedback
- Balancing sheets, playable mechanics documentation

#### 3. UI/UX Workflow
- Wireframe → Mockup → Prototype → Implementation → Testing
- Task tracking for each screen/component

#### 4. Frontend (Unity + Plastic SCM)
- Unity module tracking by feature and sprint
- Plastic SCM integration to fetch changesets, branches, commit messages
- Unity bugs, performance bottlenecks, testing status

#### 5. Backend (Java Spring Boot + GitHub)
- GitHub integration: Pull requests, issues, commits, code reviews
- API versioning, deployment tracking, backend QA coverage
- Issue → Fix → PR → Review → Merge → Deploy pipeline

#### 6. QA and Bug Tracking
- Cross-module bug tracker (Art, UI, Backend, Frontend)
- Priority, severity, owner, linked commits/tasks
- Regressions and release certification

#### 7. Finance & Estimation
- Artist rate cards, task-based cost tracking
- Asset or module cost summary
- Payment milestones for freelancers

#### 8. Performance & Review Engine
- Weekly/monthly effort summary by contributor
- Auto-generated reports from commit stats + task completion
- Feedback tracking: Number of revisions, issues raised, on-time delivery %

#### 9. Notification & Delay Engine
- Notify producers if deadlines missed or code not reviewed
- Alert leads if artist/designer inactive for 2+ days
- Email + Discord + Slack integration

#### 10. Unified Dashboard
- Filterable by team, person, asset, sprint, or milestone
- Visualize blockers, asset health, velocity
- Quick export: Reports, sprint summaries, asset lists

## 📊 Database Schema

The system uses a comprehensive PostgreSQL database with the following key tables:

### Core Tables
- `users` - User authentication and roles
- `teams` - Team organization
- `projects` - Project management
- `sprints` - Sprint planning and tracking

### Module-Specific Tables
- `assets` - Art asset pipeline tracking
- `design_tasks` - Game design task management
- `ui_components` - UI/UX workflow tracking
- `unity_modules` - Unity development tracking
- `backend_modules` - Backend development tracking
- `bugs` - Cross-module bug tracking
- `cost_tracking` - Financial tracking
- `performance_reviews` - Team performance analysis

### AI and Analytics Tables
- `ai_summaries` - Auto-generated summaries
- `delay_predictions` - AI delay predictions
- `notifications` - Alert system
- `effort_tracking` - Time and effort tracking

## 🔌 RESTful API Design

### Core Endpoints

#### Asset Management
```
GET    /api/v1/assets              # Get all assets with filtering
GET    /api/v1/assets/{id}         # Get asset by ID
POST   /api/v1/assets              # Create new asset
PUT    /api/v1/assets/{id}         # Update asset
DELETE /api/v1/assets/{id}         # Delete asset
POST   /api/v1/assets/{id}/status  # Update asset status
POST   /api/v1/assets/{id}/assign  # Assign asset to artist
POST   /api/v1/assets/{id}/review  # Submit for review
POST   /api/v1/assets/{id}/approve # Approve asset
POST   /api/v1/assets/{id}/reject  # Reject asset
```

#### Dashboard
```
GET    /api/v1/dashboard/overview           # Get dashboard overview
GET    /api/v1/dashboard/project/{id}       # Get project dashboard
GET    /api/v1/dashboard/sprint/{id}        # Get sprint dashboard
GET    /api/v1/dashboard/team/{id}          # Get team dashboard
GET    /api/v1/dashboard/user/{id}          # Get user dashboard
GET    /api/v1/dashboard/blockers           # Get current blockers
GET    /api/v1/dashboard/delays             # Get delay predictions
GET    /api/v1/dashboard/velocity           # Get velocity metrics
GET    /api/v1/dashboard/performance        # Get performance metrics
GET    /api/v1/dashboard/finance            # Get financial overview
```

#### AI Integration
```
POST   /api/v1/ai/summarize                # Generate AI summary
POST   /api/v1/ai/predict-delay            # Predict delays
POST   /api/v1/ai/generate-review          # Generate performance review
GET    /api/v1/ai/insights                 # Get AI insights
```

## 🎨 UI Wireframes

### Dashboard Design
The main dashboard features:
- **Sidebar Navigation** - Easy access to all modules
- **Quick Actions** - Create assets, tasks, bugs, reports
- **Project Overview** - Progress, budget, timeline metrics
- **Asset Pipeline** - Visual progress tracking
- **Recent Activity** - Real-time updates
- **Alerts & Notifications** - Important warnings
- **Team Performance** - Velocity and quality metrics
- **AI Insights** - Automated analysis and predictions

### Key Features
- **Responsive Design** - Works on desktop and mobile
- **Modern UI** - Clean, professional interface
- **Real-time Updates** - Live data synchronization
- **Interactive Charts** - Visual data representation
- **Quick Filters** - Easy data filtering and search

## 🤖 AI Modules

### Auto-Summarizer
Generates intelligent summaries of project activity:

#### Daily Activity Summary
- Key achievements and progress
- Current blockers and risks
- Tomorrow's priorities
- Team performance insights

#### Weekly Sprint Summary
- Sprint goals and achievements
- Performance analysis
- Key learnings and patterns
- Risk assessment
- Recommendations for next sprint

#### Project Milestone Summary
- Milestone achievement status
- Project health indicators
- Strategic insights
- Risk assessment
- Strategic recommendations

### Delay Predictor
Provides early warnings about potential delays:

#### Task-Level Prediction
- Progress analysis vs expected timeline
- Team capacity assessment
- Dependency impact analysis
- Historical pattern recognition
- Risk factor identification

#### Sprint-Level Prediction
- Velocity trend analysis
- Capacity utilization assessment
- Critical path analysis
- Systemic issue identification
- Recovery strategy recommendations

#### Project-Level Prediction
- Milestone dependency analysis
- Resource gap identification
- Strategic risk assessment
- Timeline impact prediction
- High-level mitigation strategies

## 📋 User Stories

### Epic: Art Asset Pipeline
- **Asset Creation and Assignment** - Producers can create and assign assets to artists
- **Asset Status Tracking** - Artists can update progress through pipeline stages
- **Asset Review and Approval** - Team leads can review and provide feedback

### Epic: Game Design Module
- **Design Task Management** - Designers can create and track design tasks
- **Design Document Management** - Maintain organized design documentation
- **Design Review Process** - Review design work and provide feedback

### Epic: UI/UX Workflow
- **UI Component Tracking** - Track components through design and development
- **UI Development Handoff** - Clear specifications for implementation

### Epic: Frontend (Unity + Plastic SCM)
- **Unity Module Management** - Track Unity modules and features
- **Plastic SCM Integration** - Link code changes to tracked modules
- **Unity Performance Tracking** - Monitor performance metrics

### Epic: Backend (Java Spring Boot + GitHub)
- **Backend Module Management** - Track backend modules and API development
- **GitHub Integration** - Link GitHub work to tracked modules
- **API Endpoint Tracking** - Track API endpoints and their status

### Epic: QA and Bug Tracking
- **Cross-Module Bug Tracking** - Report bugs across all modules
- **Bug Lifecycle Management** - Track bug resolution progress
- **Test Case Management** - Create and track test cases

### Epic: Finance & Estimation
- **Cost Tracking** - Track costs across all project activities
- **Rate Card Management** - Manage team member rate cards
- **Payment Milestone Tracking** - Track payment milestones

### Epic: Performance & Review Engine
- **Effort Tracking** - Log daily work hours
- **Performance Reviews** - Conduct data-driven performance reviews
- **Team Performance Analytics** - View team performance analytics

### Epic: Notification & Delay Engine
- **Automated Notifications** - Receive timely notifications
- **Delay Prediction** - Receive early warnings about delays
- **Blocker Management** - Identify and track project blockers

### Epic: Unified Dashboard
- **Personalized Dashboard** - View personalized information
- **Project Overview Dashboard** - Comprehensive project overview
- **Export and Reporting** - Export data and generate reports

### Epic: AI Modules
- **Auto-Summarization** - Receive automated summaries
- **Delay Prediction** - Receive AI-powered delay predictions
- **Performance Review Generation** - Generate performance review drafts

## 🚀 Development Roadmap

### Phase 1: Basic Asset & Task Tracker (2 weeks)
- [ ] Core database schema implementation
- [ ] Basic asset creation and tracking
- [ ] User authentication and roles
- [ ] Simple dashboard

### Phase 2: GitHub Integration, UI/UX + Backend Pipelines (3 weeks)
- [ ] GitHub API integration
- [ ] UI/UX workflow tracking
- [ ] Backend module tracking
- [ ] Enhanced dashboard

### Phase 3: Plastic SCM Integration + Frontend Sprint Tracker (3 weeks)
- [ ] Plastic SCM integration
- [ ] Unity module tracking
- [ ] Sprint planning and tracking
- [ ] Performance metrics

### Phase 4: QA, Bug Tracking & Alert System (2 weeks)
- [ ] Cross-module bug tracking
- [ ] Notification system
- [ ] Alert rules and automation
- [ ] Quality metrics

### Phase 5: Performance Engine, Dashboards & Automation (2 weeks)
- [ ] Performance review engine
- [ ] Advanced dashboards
- [ ] Report generation
- [ ] Export functionality

### Phase 6: AI Modules + Notification Integration (3 weeks)
- [ ] Auto-summarizer implementation
- [ ] Delay predictor implementation
- [ ] Discord/Slack integration
- [ ] AI insights dashboard

## 📈 KPIs & Success Criteria

- **100% task traceability** across all teams
- **90%+ on-time delivery rate** for assets/modules
- **Improved review-to-merge cycle by 30%**
- **Real-time delay prediction with 85% accuracy**

## 🛠️ Setup Instructions

### Prerequisites
- Java 17+
- PostgreSQL 14+
- Node.js 18+
- Docker (optional)

### Database Setup
```sql
-- Run the schema.sql file
psql -U postgres -d sgpt -f database/schema.sql
```

### Backend Setup
```bash
cd backend
./mvnw clean install
./mvnw spring-boot:run
```

### Frontend Setup
```bash
cd frontend
npm install
npm start
```

## 🔧 Configuration

### Environment Variables
```bash
# Database
DATABASE_URL=postgresql://localhost:5432/sgpt
DATABASE_USERNAME=sgpt_user
DATABASE_PASSWORD=sgpt_password

# GitHub Integration
GITHUB_TOKEN=your_github_token
GITHUB_ORG=your_organization

# Plastic SCM Integration
PLASTIC_SCM_URL=your_plastic_url
PLASTIC_SCM_USER=your_plastic_user
PLASTIC_SCM_PASSWORD=your_plastic_password

# AI Integration
OPENAI_API_KEY=your_openai_key

# Notifications
DISCORD_WEBHOOK_URL=your_discord_webhook
SLACK_WEBHOOK_URL=your_slack_webhook
```

## 📚 Documentation

- [Database Schema](./database/schema.sql)
- [API Documentation](./backend/docs/api.md)
- [User Stories](./docs/user-stories.md)
- [UI Wireframes](./ui/wireframes/)
- [AI Prompts](./ai/prompts/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue in the GitHub repository
- Contact the development team
- Check the documentation

---

**Built with ❤️ for game development teams**