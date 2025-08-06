# Smart Game Production Tracker (SGPT) - UI Wireframes

## Design Principles
- **Clean and Modern**: Material Design 3 / Google's Design System
- **Role-Based Interface**: Different views and permissions based on user roles
- **Responsive Design**: Mobile-first approach with desktop optimization
- **Dark/Light Theme**: Support for both themes with user preference
- **Real-time Updates**: Live data updates without page refresh
- **Accessibility**: WCAG 2.1 AA compliance

## Color Palette
- **Primary**: #1976D2 (Blue)
- **Secondary**: #424242 (Grey)
- **Success**: #2E7D32 (Green)
- **Warning**: #F57C00 (Orange)
- **Error**: #D32F2F (Red)
- **Surface**: #FFFFFF (Light) / #121212 (Dark)

---

## 1. Main Dashboard (Executive/Producer View)

```
╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ [🏠] Smart Game Production Tracker                     [🔔 3] [👤 John Producer ▼] [⚙️] [🌙]                  ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ Projects | Tasks | Assets | Team | Reports | Settings                                                           ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                  ║
║  ┌─── Project Overview ────────────────────────────┐  ┌─── Team Utilization ──────────────────────────────────┐  ║
║  │ 📊 3 Active Projects                             │  │ 👥 Team Capacity: 85%                                │  ║
║  │                                                 │  │                                                       │  ║
║  │ 🎮 Game Alpha    [████████░░] 80% Complete      │  │ Art Team     ████████░░ 80%                          │  ║
║  │ 📅 Due: Jan 15   💰 $45K/$60K                   │  │ Design Team  ██████░░░░ 60%                          │  ║
║  │                                                 │  │ Dev Team     ███████░░░ 70%                          │  ║
║  │ 🎯 Game Beta     [██████░░░░] 60% Complete      │  │ QA Team      █████░░░░░ 50%                          │  ║
║  │ 📅 Due: Mar 20   💰 $30K/$80K                   │  │                                                       │  ║
║  │                                                 │  │ 🚨 2 team members over capacity                       │  ║
║  │ 🔄 Game Gamma    [███░░░░░░░] 30% Complete      │  │ 📊 View Details                                       │  ║
║  │ 📅 Due: Jun 30   💰 $15K/$100K                  │  └───────────────────────────────────────────────────────┘  ║
║  └─────────────────────────────────────────────────┘                                                           ║
║                                                                                                                  ║
║  ┌─── Critical Alerts ─────────────────────────────┐  ┌─── Recent Activity ───────────────────────────────────┐  ║
║  │ 🚨 5 Overdue Tasks                              │  │ 🕐 2 hours ago                                        │  ║
║  │ 🐛 3 Critical Bugs                              │  │ Sarah completed "Character Rigging" ✅                │  ║
║  │ ⚠️  2 Budget Warnings                           │  │                                                       │  ║
║  │ 📅 4 Approaching Deadlines                      │  │ 🕐 4 hours ago                                        │  ║
║  │                                                 │  │ Mike submitted PR #234 for review 🔍                 │  ║
║  │ [View All Alerts]                               │  │                                                       │  ║
║  └─────────────────────────────────────────────────┘  │ 🕐 6 hours ago                                        │  ║
║                                                     │ Bug #156 marked as resolved 🐛                        │  ║
║  ┌─── Sprint Progress ──────────────────────────────┐  │                                                       │  ║
║  │ Current Sprint: Alpha Sprint 5                   │  │ 🕐 1 day ago                                          │  ║
║  │ [████████████░░░░░] 75% Complete                 │  │ New asset "Environment Pack 2" created 🎨            │  ║
║  │                                                 │  │                                                       │  ║
║  │ 📊 Velocity: 42 pts (Target: 45)               │  │ [Load More]                                           │  ║
║  │ 📅 5 days remaining                             │  └───────────────────────────────────────────────────────┘  ║
║  │ 🎯 23/30 story points completed                 │                                                           ║
║  │                                                 │                                                           ║
║  │ [View Sprint Details]                           │                                                           ║
║  └─────────────────────────────────────────────────┘                                                           ║
║                                                                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

### Dashboard Components:
1. **Top Navigation**: Logo, notifications, user menu, settings, theme toggle
2. **Side Navigation**: Main module navigation
3. **Project Overview Widget**: High-level project status, progress bars, budget
4. **Team Utilization Widget**: Resource allocation and capacity planning
5. **Critical Alerts Widget**: Important notifications requiring attention
6. **Sprint Progress Widget**: Current sprint status and velocity
7. **Recent Activity Feed**: Real-time updates on team activities

---

## 2. Project Detail View

```
╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ [← Back] 🎮 Game Alpha Project                                                    [📊 Analytics] [⚙️ Settings]   ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ Overview | Sprints | Tasks | Assets | Team | Budget | Reports                                                   ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                  ║
║  ┌─── Project Info ──────────────────────────────────┐  ┌─── Timeline & Milestones ─────────────────────────────┐  ║
║  │ Status: 🟢 Active                                  │  │ 📅 Project Timeline                                   │  ║
║  │ Producer: John Smith                               │  │                                                       │  ║
║  │ Start Date: Jan 1, 2024                           │  │ ├─ Jan 15: Alpha Release                               │  ║
║  │ End Date: Jun 30, 2024                            │  │ ├─ Mar 1:  Beta Release                                │  ║
║  │ Budget: $45K / $60K (75%)                         │  │ ├─ Apr 15: Pre-Production Complete                     │  ║
║  │                                                   │  │ ├─ May 30: Gold Master                                 │  ║
║  │ GitHub: github.com/studio/game-alpha             │  │ └─ Jun 30: Final Release                               │  ║
║  │ Plastic: plastic.company.com/gamealpha            │  │                                                       │  ║
║  └───────────────────────────────────────────────────┘  └───────────────────────────────────────────────────────┘  ║
║                                                                                                                  ║
║  ┌─── Progress Summary ───────────────────────────────┐  ┌─── Team Assignment ───────────────────────────────────┐  ║
║  │ Overall Progress: [████████░░] 80%                 │  │ 👤 Art Team (4 members)                               │  ║
║  │                                                   │  │    Sarah Johnson (Lead) - Characters                  │  ║
║  │ 📋 Tasks:     120/150 (80%)                       │  │    Mike Chen - Environments                           │  ║
║  │ 🎨 Assets:    45/60 (75%)                         │  │    Lisa Brown - UI Assets                             │  ║
║  │ 🐛 Open Bugs: 5 (2 critical)                      │  │    Tom Wilson - VFX                                   │  ║
║  │ 📊 Velocity:  42 points/sprint                    │  │                                                       │  ║
║  │                                                   │  │ 💻 Dev Team (6 members)                               │  ║
║  │ Quality Metrics:                                  │  │    Alex Rodriguez (Lead) - Backend                    │  ║
║  │ ✅ Code Coverage: 85%                             │  │    Emma Davis - Frontend                               │  ║
║  │ 🔍 Review Rate: 95%                               │  │    Ryan Park - Unity Development                      │  ║
║  │ 🏃 Deployment Success: 98%                        │  │    [+ 3 more]                                        │  ║
║  └───────────────────────────────────────────────────┘  │                                                       │  ║
║                                                     │ 🧪 QA Team (2 members)                                │  ║
║  ┌─── Budget Breakdown ──────────────────────────────┐  │    Jessica Lee (Lead)                                 │  ║
║  │ 💰 Financial Summary                              │  │    David Kim                                          │  ║
║  │                                                   │  └───────────────────────────────────────────────────────┘  ║
║  │ Art Department:     $18,000 (40%)                 │                                                           ║
║  │ Development:        $20,000 (44%)                 │                                                           ║
║  │ QA Testing:         $5,000 (11%)                  │                                                           ║
║  │ Management:         $2,000 (5%)                   │                                                           ║
║  │                                                   │                                                           ║
║  │ Monthly Burn: $8,500                              │                                                           ║
║  │ Projected Total: $57,000                          │                                                           ║
║  │ [View Detailed Budget]                            │                                                           ║
║  └───────────────────────────────────────────────────┘                                                           ║
║                                                                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

---

## 3. Art Asset Pipeline View

```
╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ 🎨 Art Asset Pipeline - Game Alpha                          [+ New Asset] [📁 Import] [🔍 Search] [🔧 Filters]   ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ All Assets | Characters | Environments | UI | VFX | Props | Audio                                               ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                  ║
║  ┌─── Pipeline Overview ─────────────────────────────────────────────────────────────────────────────────────────┐  ║
║  │ Concept [8] → Modeling [12] → Texturing [6] → Rigging [4] → Animation [3] → QA [2] → Approved [15]            │  ║
║  │    🟡         🟠           🟡          🟢         🟢           🟡        ✅                                    │  ║
║  └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘  ║
║                                                                                                                  ║
║  Filters: [Type: All ▼] [Stage: All ▼] [Artist: All ▼] [Priority: All ▼] [Due: All ▼]      Showing 1-10 of 50  ║
║                                                                                                                  ║
║ ┌────┬──────────────────────┬─────────────┬──────────────┬─────────────┬──────────────┬─────────────┬──────────┐ ║
║ │ #  │ Asset Name           │ Type        │ Stage        │ Artist      │ Priority     │ Due Date    │ Progress │ ║
║ ├────┼──────────────────────┼─────────────┼──────────────┼─────────────┼──────────────┼─────────────┼──────────┤ ║
║ │🚨  │ Main Character       │ Character   │ Animation    │ Sarah J.    │ 🔴 Critical  │ Jan 15      │ 90% ████ │ ║
║ │⚠️  │ Boss Enemy          │ Character   │ Rigging      │ Mike C.     │ 🟠 High      │ Jan 20      │ 75% ███░ │ ║
║ │    │ Forest Environment   │ Environment │ Texturing    │ Lisa B.     │ 🟡 Medium    │ Jan 25      │ 60% ██░░ │ ║
║ │    │ UI Button Set        │ UI Asset    │ QA           │ Tom W.      │ 🟢 Low       │ Feb 1       │ 95% ████ │ ║
║ │🔄  │ Magic VFX Pack       │ VFX         │ Concept      │ Sarah J.    │ 🟠 High      │ Feb 5       │ 20% █░░░ │ ║
║ │    │ Weapon Collection    │ Props       │ Modeling     │ Mike C.     │ 🟡 Medium    │ Feb 10      │ 40% ██░░ │ ║
║ │✅  │ Background Music     │ Audio       │ Approved     │ Alex R.     │ 🟡 Medium    │ Completed   │ 100% ████│ ║
║ │    │ Sound Effects Pack   │ Audio       │ QA           │ Emma D.     │ 🟢 Low       │ Feb 15      │ 85% ███░ │ ║
║ │⏳  │ Texture Library      │ Texture     │ Concept      │ Ryan P.     │ 🟡 Medium    │ Feb 20      │ 10% ░░░░ │ ║
║ │    │ Character Portraits  │ UI Asset    │ Modeling     │ Jessica L.  │ 🟠 High      │ Feb 25      │ 55% ██░░ │ ║
║ └────┴──────────────────────┴─────────────┴──────────────┴─────────────┴──────────────┴─────────────┴──────────┘ ║
║                                                                                                                  ║
║ Legend: 🚨 Overdue  ⚠️ At Risk  🔄 In Progress  ⏳ Not Started  ✅ Completed                                    ║
║                                                                                                                  ║
║ [⬅️ Previous] [1] [2] [3] [4] [5] [➡️ Next]                                              [Export] [Bulk Actions] ║
║                                                                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

### Asset Detail Modal (when clicking on an asset):

```
╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ 🎭 Main Character - Asset Details                                                                        [✕ Close] ║
╠═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ Details | Stage History | Files | Comments | Time Log                                                             ║
╠═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                   ║
║  ┌─── Asset Information ────────────────────────────┐  ┌─── Current Stage: Animation ─────────────────────────────┐ ║
║  │ Name: Main Character                              │  │ Progress: 90% Complete                                   │ ║
║  │ Type: Character                                   │  │ Assigned to: Sarah Johnson                               │ ║
║  │ Priority: 🔴 Critical                            │  │ Started: Jan 10, 2024                                   │ ║
║  │ Due Date: Jan 15, 2024 (🚨 2 days overdue)      │  │ Est. Completion: Jan 17, 2024                           │ ║
║  │                                                  │  │                                                         │ ║
║  │ Description:                                     │  │ Stage Actions:                                          │ ║
║  │ Primary protagonist character model with full    │  │ [Move to QA] [Request Review] [Add Time]                │ ║
║  │ rigging and basic animation set. Includes idle,  │  │                                                         │ ║
║  │ walk, run, jump, and attack animations.          │  │ Feedback: 2 revision requests                           │ ║
║  │                                                  │  │ [View Feedback History]                                 │ ║
║  │ Estimated Hours: 40                              │  └─────────────────────────────────────────────────────────┘ ║
║  │ Actual Hours: 36                                 │                                                            ║
║  │ Estimated Cost: $3,000                           │                                                            ║
║  │ Actual Cost: $2,700                              │  ┌─── Recent Files ────────────────────────────────────────┐ ║
║  └──────────────────────────────────────────────────┘  │ 📁 character_main_v3.fbx (Jan 12)                      │ ║
║                                                     │ 📁 character_main_texture.psd (Jan 11)                  │ ║
║  ┌─── Stage Progression ────────────────────────────┐  │ 📁 character_animations.blend (Jan 13)                  │ ║
║  │ ✅ Concept      (Jan 5)   - Sarah J.             │  │ 📁 character_refs.zip (Jan 8)                           │ ║
║  │ ✅ Modeling     (Jan 8)   - Sarah J.             │  │                                                         │ ║
║  │ ✅ Texturing    (Jan 10)  - Sarah J.             │  │ [Upload New File] [View All Files]                      │ ║
║  │ ✅ Rigging      (Jan 12)  - Sarah J.             │  └─────────────────────────────────────────────────────────┘ ║
║  │ 🔄 Animation    (Jan 13)  - Sarah J. (Current)   │                                                            ║
║  │ ⏳ QA           - Pending                         │  ┌─── Comments & Feedback ─────────────────────────────────┐ ║
║  │ ⏳ Approved     - Pending                         │  │ 💬 Art Director (2 hours ago):                         │ ║
║  └──────────────────────────────────────────────────┘  │ "Animation looks great! Just need to adjust the walk   │ ║
║                                                     │  cycle timing slightly. Should be ready for QA soon."   │ ║
║                                                     │                                                         │ ║
║                                                     │ 💬 Sarah Johnson (4 hours ago):                        │ ║
║                                                     │ "Completed idle and walk animations. Working on run     │ ║
║                                                     │  and jump cycles now."                                  │ ║
║                                                     │                                                         │ ║
║                                                     │ [Add Comment] [Request Feedback]                        │ ║
║                                                     └─────────────────────────────────────────────────────────┘ ║
║                                                                                                                   ║
║ [Save Changes] [Delete Asset] [Clone Asset] [Export Report]                                                      ║
║                                                                                                                   ║
╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

---

## 4. Task Management View

```
╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ 📋 Task Management - Sprint 5                               [+ New Task] [📋 Board View] [📊 Burndown] [🔍]      ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ All Tasks | My Tasks | Overdue | Blocked | In Review                                                            ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                  ║
║  Sprint: [Sprint 5 ▼] | Project: [Game Alpha ▼] | Assignee: [All ▼] | Status: [All ▼] | Type: [All ▼]         ║
║                                                                                                                  ║
║ ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐ ║
║ │ 📌 TO DO (8 tasks, 32 points)                                                                                    │ ║
║ ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ ║
║ │ 🎯 SGPT-123 | Implement user authentication system                          | 👤 Alex R. | 8pts | 🔴 High    │ ║
║ │ 🎮 SGPT-124 | Create character selection screen                             | 👤 Emma D. | 5pts | 🟠 Medium  │ ║
║ │ 🎨 SGPT-125 | Design main menu background                                   | 👤 Lisa B. | 3pts | 🟢 Low     │ ║
║ │ 🐛 SGPT-126 | Fix inventory UI scaling issues                               | 👤 Ryan P. | 5pts | 🟠 Medium  │ ║
║ │ 📚 SGPT-127 | Write API documentation for asset management                  | 👤 Sarah J.| 8pts | 🟢 Low     │ ║
║ │ ⚡ SGPT-128 | Optimize rendering performance                                | 👤 Mike C. | 13pts| 🔴 High    │ ║
║ └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐ ║
║ │ 🔄 IN PROGRESS (5 tasks, 21 points)                                                                              │ ║
║ ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ ║
║ │ 🎯 SGPT-129 | Database migration for user roles [████████░░] 80%           | 👤 Alex R. | 5pts | 🔴 High    │ ║
║ │ 🎮 SGPT-130 | Implement combat system mechanics [██████░░░░] 60%            | 👤 Emma D. | 8pts | 🟠 Medium  │ ║
║ │ 🎨 SGPT-131 | Character animation state machine [███████░░░] 70%            | 👤 Sarah J.| 8pts | 🟠 Medium  │ ║
║ └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐ ║
║ │ 👀 IN REVIEW (3 tasks, 11 points)                                                                                │ ║
║ ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ ║
║ │ 🎯 SGPT-132 | User profile management endpoints                             | 👤 Ryan P. | 5pts | ⏰ 2 days  │ ║
║ │ 🐛 SGPT-133 | Fix sound synchronization bug                                 | 👤 Tom W.  | 3pts | ⏰ 1 day   │ ║
║ │ 📱 SGPT-134 | Mobile responsive design updates                              | 👤 Lisa B. | 8pts | ⏰ 3 days  │ ║
║ └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐ ║
║ │ ✅ COMPLETED (12 tasks, 45 points)                                                                               │ ║
║ ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ ║
║ │ 🎯 SGPT-135 | Setup project infrastructure                                  | 👤 Alex R. | 8pts | ✅ Done    │ ║
║ │ 🎮 SGPT-136 | Basic player movement system                                  | 👤 Emma D. | 5pts | ✅ Done    │ ║
║ │ 🎨 SGPT-137 | Environment art style guide                                   | 👤 Mike C. | 5pts | ✅ Done    │ ║
║ │ [View All Completed...]                                                                                          │ ║
║ └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐ ║
║ │ 🚫 BLOCKED (2 tasks, 13 points)                                                                                  │ ║
║ ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ ║
║ │ 🎯 SGPT-138 | Payment system integration                    🔗 Waiting for API | 👤 Alex R. | 8pts | 🚨 Urgent │ ║
║ │ 🎮 SGPT-139 | Multiplayer lobby system                      🔗 Server setup   | 👤 Ryan P. | 5pts | 🟠 Medium │ ║
║ └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

### Task Detail Modal:

```
╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ 🎯 SGPT-123: Implement user authentication system                                                        [✕ Close] ║
╠═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ Details | Subtasks | Time Log | Comments | History                                                                 ║
╠═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                   ║
║  ┌─── Task Information ─────────────────────────────┐  ┌─── Progress & Time Tracking ─────────────────────────────┐ ║
║  │ Title: Implement user authentication system       │  │ Status: 📌 To Do                                        │ ║
║  │ Type: 💻 Development                              │  │ Progress: [░░░░░░░░░░] 0%                               │ ║
║  │ Priority: 🔴 High                                 │  │                                                         │ ║
║  │ Story Points: 8                                   │  │ Estimated Hours: 16                                     │ ║
║  │ Sprint: Sprint 5                                  │  │ Logged Hours: 0                                         │ ║
║  │ Assigned to: Alex Rodriguez                       │  │ Remaining: 16 hours                                     │ ║
║  │ Created by: John Smith (Producer)                 │  │                                                         │ ║
║  │ Due Date: Jan 18, 2024                           │  │ [Log Time] [Update Progress] [Change Status]            │ ║
║  │                                                  │  └─────────────────────────────────────────────────────────┘ ║
║  │ Description:                                     │                                                            ║
║  │ Implement JWT-based authentication system with   │  ┌─── Dependencies & Relationships ─────────────────────────┐ ║
║  │ login, logout, and token refresh functionality.  │  │ Depends on:                                             │ ║
║  │ Include role-based access control and session    │  │ ├─ SGPT-120: Database schema setup ✅                   │ ║
║  │ management. Integrate with existing user         │  │ ├─ SGPT-121: User model implementation ✅                │ ║
║  │ management system.                               │  │                                                         │ ║
║  │                                                  │  │ Blocks:                                                 │ ║
║  │ Acceptance Criteria:                             │  │ ├─ SGPT-140: User profile page                           │ ║
║  │ ✅ JWT token generation and validation           │  │ ├─ SGPT-141: Password reset functionality                │ ║
║  │ ✅ Login/logout endpoints                        │  │                                                         │ ║
║  │ ✅ Role-based middleware                         │  │ Related PRs: None                                       │ ║
║  │ ✅ Session timeout handling                      │  │ Related Commits: None                                   │ ║
║  │ ✅ Error handling and validation                 │  └─────────────────────────────────────────────────────────┘ ║
║  └──────────────────────────────────────────────────┘                                                            ║
║                                                                                                                   ║
║  ┌─── Subtasks (3/5 completed) ───────────────────────────────────────────────────────────────────────────────────┐ ║
║  │ ✅ Setup authentication middleware               | Alex R.  | 2pts | Completed Jan 10                      │ ║
║  │ ✅ Create login endpoint                         | Alex R.  | 2pts | Completed Jan 11                      │ ║
║  │ ✅ Implement JWT token generation               | Alex R.  | 2pts | Completed Jan 12                      │ ║
║  │ 📌 Add role-based access control                | Alex R.  | 1pt  | Not Started                          │ ║
║  │ 📌 Write unit tests                             | Alex R.  | 1pt  | Not Started                          │ ║
║  └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                   ║
║ [Save Changes] [Clone Task] [Convert to Bug] [Delete Task]                            [Start Work] [Request Help] ║
║                                                                                                                   ║
╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

---

## 5. Bug Tracking View

```
╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ 🐛 Bug Tracking - Game Alpha                                [+ Report Bug] [📊 Analytics] [📁 Export] [🔍]       ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ All Bugs | Open | In Progress | Resolved | Closed | My Bugs                                                     ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                  ║
║  ┌─── Bug Statistics ────────────────────────────────────────────────────────────────────────────────────────────┐  ║
║  │ 📊 Total: 45 | 🔴 Critical: 2 | 🟠 High: 8 | 🟡 Medium: 25 | 🟢 Low: 10                                     │  ║
║  │ 📈 Weekly Trend: ↗️ +5 new, ↘️ -8 resolved | 🎯 Resolution Rate: 85% | ⏱️ Avg Resolution: 3.2 days          │  ║
║  └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘  ║
║                                                                                                                  ║
║  Filters: [Status: Open ▼] [Severity: All ▼] [Module: All ▼] [Assignee: All ▼] [Reporter: All ▼]              ║
║                                                                                                                  ║
║ ┌────┬──────┬──────────────────────────────────┬──────────┬─────────────┬─────────────┬──────────────┬──────────┐ ║
║ │ ID │ Sev  │ Title                            │ Module   │ Status      │ Assignee    │ Reporter     │ Updated  │ ║
║ ├────┼──────┼──────────────────────────────────┼──────────┼─────────────┼─────────────┼──────────────┼──────────┤ ║
║ │156 │ 🔴   │ Game crashes on level transition │ Frontend │ 🔄 Progress │ Ryan P.     │ Jessica L.   │ 2h ago   │ ║
║ │157 │ 🔴   │ Save data corruption in inventory│ Backend  │ 🆕 Open     │ Alex R.     │ David K.     │ 4h ago   │ ║
║ │158 │ 🟠   │ Audio desync during cutscenes    │ Frontend │ 🔄 Progress │ Emma D.     │ Tom W.       │ 1d ago   │ ║
║ │159 │ 🟠   │ Character animation stuttering   │ Art      │ 🆕 Open     │ Sarah J.    │ Mike C.      │ 1d ago   │ ║
║ │160 │ 🟠   │ UI elements overlapping on mobile│ UI/UX    │ 👀 Review   │ Lisa B.     │ Jessica L.   │ 2d ago   │ ║
║ │161 │ 🟡   │ Achievement notification delay   │ Backend  │ 🆕 Open     │ Unassigned  │ Ryan P.      │ 2d ago   │ ║
║ │162 │ 🟡   │ Loading screen text cut off      │ UI/UX    │ ✅ Resolved │ Lisa B.     │ Emma D.      │ 3d ago   │ ║
║ │163 │ 🟡   │ Sound effects too loud in menu   │ Audio    │ 🔄 Progress │ Tom W.      │ David K.     │ 3d ago   │ ║
║ │164 │ 🟢   │ Typo in credits screen          │ UI/UX    │ 🆕 Open     │ Unassigned  │ John S.      │ 4d ago   │ ║
║ │165 │ 🟢   │ Minor visual glitch in shop UI   │ UI/UX    │ 🆕 Open     │ Lisa B.     │ Sarah J.     │ 5d ago   │ ║
║ └────┴──────┴──────────────────────────────────┴──────────┴─────────────┴─────────────┴──────────────┴──────────┘ ║
║                                                                                                                  ║
║ [⬅️ Previous] [1] [2] [3] [4] [5] [➡️ Next]                                        [Bulk Assign] [Bulk Status] ║
║                                                                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

### Bug Detail Modal:

```
╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ 🐛 BUG-156: Game crashes on level transition                                                             [✕ Close] ║
╠═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ Details | Reproduction | Attachments | Activity | Related                                                         ║
╠═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                   ║
║  ┌─── Bug Information ──────────────────────────────┐  ┌─── Status & Assignment ──────────────────────────────────┐ ║
║  │ ID: BUG-156                                       │  │ Status: 🔄 In Progress                                  │ ║
║  │ Severity: 🔴 Critical                            │  │ Priority: 🔴 High                                       │ ║
║  │ Module: Frontend (Unity)                          │  │ Assigned to: Ryan Park                                  │ ║
║  │ Environment: Unity 2023.1.5f1, Windows 11       │  │ Reporter: Jessica Lee (QA)                              │ ║
║  │ Reported: Jan 14, 2024 10:30 AM                  │  │ Created: 6 hours ago                                    │ ║
║  │ Last Updated: Jan 14, 2024 2:15 PM               │  │ Updated: 2 hours ago                                    │ ║
║  │                                                  │  │                                                         │ ║
║  │ Summary:                                         │  │ Actions:                                                │ ║
║  │ Game consistently crashes when transitioning     │  │ [Change Status] [Reassign] [Set Priority]              │ ║
║  │ from Level 2 to Level 3. Error occurs during     │  │ [Clone Bug] [Convert to Task] [Close Bug]              │ ║
║  │ the loading sequence approximately 75% through   │  │                                                         │ ║
║  │ the progress bar.                                │  └─────────────────────────────────────────────────────────┘ ║
║  └──────────────────────────────────────────────────┘                                                            ║
║                                                                                                                   ║
║  ┌─── Steps to Reproduce ───────────────────────────────────────────────────────────────────────────────────────┐ ║
║  │ 1. Start new game and complete Level 1                                                                        │ ║
║  │ 2. Progress through Level 2 and reach the exit portal                                                         │ ║
║  │ 3. Activate the portal to transition to Level 3                                                               │ ║
║  │ 4. Observe loading screen - crash occurs around 75% progress                                                  │ ║
║  │ 5. Error message appears: "Memory access violation in AssetLoader.LoadLevel()"                               │ ║
║  │                                                                                                               │ ║
║  │ Additional Notes:                                                                                             │ ║
║  │ - Reproducible 9/10 times                                                                                    │ ║
║  │ - Occurs only when transitioning FROM Level 2 TO Level 3                                                    │ ║
║  │ - Other level transitions work fine                                                                          │ ║
║  │ - Issue appeared after recent asset loading optimization changes                                             │ ║
║  └───────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                   ║
║  ┌─── Expected vs Actual Behavior ─────────────────────────────────────────────────────────────────────────────┐ ║
║  │ Expected: Smooth transition to Level 3 with loading screen completing successfully                            │ ║
║  │ Actual: Game crashes during loading with memory access violation error                                       │ ║
║  └───────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                   ║
║  ┌─── Attachments & Files ──────────────────────────────────────────────────────────────────────────────────────┐ ║
║  │ 📎 crash_log_20240114.txt (15KB) - Stack trace and error details                                            │ ║
║  │ 📎 level_transition_video.mp4 (2.3MB) - Screen recording of crash                                           │ ║
║  │ 📎 unity_console_output.log (45KB) - Complete Unity console log                                             │ ║
║  │ 📎 screenshot_before_crash.png (850KB) - Last frame before crash                                            │ ║
║  │                                                                                                               │ ║
║  │ [Upload File] [Download All]                                                                                 │ ║
║  └───────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                   ║
║ [Save Changes] [Add Comment] [Start Work] [Request Info]                              [Copy Link] [Export Report] ║
║                                                                                                                   ║
╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

---

## 6. Team Performance Dashboard

```
╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ 👥 Team Performance - Game Alpha                              [📅 Period: Last 30 Days ▼] [📊 Export] [⚙️]     ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ Overview | Individual | Team Comparison | Trends | Goals                                                        ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                  ║
║  ┌─── Team Overview ─────────────────────────────────────────────────────────────────────────────────────────────┐  ║
║  │ 📈 Velocity: 42 pts/sprint (Target: 45) | 🎯 On-time Delivery: 87% | 🐛 Bug Rate: 0.12/task | ⭐ Quality: 4.2/5 │  ║
║  │ 👥 Team Size: 12 | 📊 Utilization: 85% | 🕐 Avg Task Time: 10.5h | 🔄 Review Cycle: 1.8 days               │  ║
║  └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘  ║
║                                                                                                                  ║
║ ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐ ║
║ │ 👤 Individual Performance                                                                                          │ ║
║ ├────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤ ║
║ │ Name            │ Role        │ Tasks │ Points│ Hours │ On-time│ Quality│ Trend  │ Utilization│ Status         │ ║
║ ├─────────────────┼─────────────┼───────┼───────┼───────┼────────┼────────┼────────┼────────────┼────────────────┤ ║
║ │ 👤 Alex Rodriguez│ Backend Dev │  15   │  65   │ 120h  │  92%   │  4.8/5 │ ↗️ +5% │ ████████░░ │ 🟢 Excellent   │ ║
║ │ 👤 Sarah Johnson │ Art Lead    │  12   │  48   │ 96h   │  88%   │  4.5/5 │ ↗️ +3% │ ███████░░░ │ 🟢 Good        │ ║
║ │ 👤 Emma Davis    │ Frontend    │  18   │  72   │ 144h  │  85%   │  4.3/5 │ ↔️ 0%  │ █████████░ │ 🟢 Good        │ ║
║ │ 👤 Ryan Park     │ Unity Dev   │  14   │  56   │ 112h  │  79%   │  4.1/5 │ ↘️ -2% │ ████████░░ │ 🟡 Fair        │ ║
║ │ 👤 Mike Chen     │ Environment │  10   │  40   │ 80h   │  95%   │  4.7/5 │ ↗️ +8% │ ██████░░░░ │ 🟢 Excellent   │ ║
║ │ 👤 Lisa Brown    │ UI Designer │  16   │  64   │ 128h  │  90%   │  4.4/5 │ ↗️ +2% │ ████████░░ │ 🟢 Good        │ ║
║ │ 👤 Tom Wilson    │ VFX Artist  │   8   │  32   │ 64h   │  87%   │  4.2/5 │ ↔️ 0%  │ █████░░░░░ │ 🟢 Good        │ ║
║ │ 👤 Jessica Lee   │ QA Lead     │  20   │  45   │ 160h  │  93%   │  4.6/5 │ ↗️ +4% │ ██████████ │ 🟢 Excellent   │ ║
║ │ 👤 David Kim     │ QA Tester   │  25   │  35   │ 200h  │  91%   │  4.3/5 │ ↗️ +1% │ ██████████ │ 🟢 Good        │ ║
║ └─────────────────┴─────────────┴───────┴───────┴───────┴────────┴────────┴────────┴────────────┴────────────────┘ ║
║                                                                                                                  ║
║  ┌─── Performance Trends (Last 6 Sprints) ──────────────────┐  ┌─── Team Health Indicators ─────────────────────┐  ║
║  │     Velocity                                             │  │ 😊 Team Morale: 8.2/10                         │  ║
║  │  50 ┌─────────────────────────────────────────────────── │  │ 🤝 Collaboration Score: 9.1/10                 │  ║
║  │  45 ├──●────●────●────○────●────●                        │  │ 🔄 Knowledge Sharing: 7.8/10                   │  ║
║  │  40 ├────────────────────────────────────────────────── │  │ 💪 Skill Development: 8.5/10                   │  ║
║  │  35 ├─────────────────────────────────────────────────── │  │                                                │ ║
║  │  30 └─────────────────────────────────────────────────── │  │ Recent Achievements:                           │ ║
║  │     S1   S2   S3   S4   S5   S6                         │  │ 🏆 Zero critical bugs for 2 weeks              │ ║
║  │                                                         │  │ 🎯 Sprint 5 delivered ahead of schedule        │ ║
║  │     Quality Score                                       │  │ 🚀 New deployment pipeline reduced errors      │ ║
║  │ 5.0 ┌─────────────────────────────────────────────────── │  │                                                │ ║
║  │ 4.5 ├──●────●────●────●────○────●                        │  │ Areas for Improvement:                         │ ║
║  │ 4.0 ├─────────────────────────────────────────────────── │  │ ⚠️ Code review time increasing                  │ ║
║  │ 3.5 ├─────────────────────────────────────────────────── │  │ ⚠️ Cross-team communication gaps               │ ║
║  │ 3.0 └─────────────────────────────────────────────────── │  │ ⚠️ Technical debt accumulating                  │ ║
║  │     S1   S2   S3   S4   S5   S6                         │  └─────────────────────────────────────────────────┘ ║
║  └─────────────────────────────────────────────────────────┘                                                    ║
║                                                                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

---

## 7. Mobile Dashboard View

```
╔════════════════════════════════════╗
║ 🏠 SGPT      [🔔3] [👤] [⚙️]      ║
╠════════════════════════════════════╣
║                                    ║
║ ┌────── Quick Stats ──────────────┐ ║
║ │ 🎮 3 Projects    📋 15 Tasks   │ ║
║ │ 🎨 8 Assets      🐛 2 Bugs     │ ║
║ └────────────────────────────────────┘ ║
║                                    ║
║ ┌────── My Tasks ─────────────────┐ ║
║ │ 🔴 Fix login bug                │ ║
║ │    Due: Today                   │ ║
║ │    Progress: 80% ████████░░     │ ║
║ │                                │ ║
║ │ 🟠 Character animations         │ ║
║ │    Due: Tomorrow                │ ║
║ │    Progress: 60% ██████░░░░     │ ║
║ │                                │ ║
║ │ 🟡 UI mockup review             │ ║
║ │    Due: Jan 20                  │ ║
║ │    Progress: 30% ███░░░░░░░     │ ║
║ │                                │ ║
║ │ [View All Tasks]               │ ║
║ └────────────────────────────────────┘ ║
║                                    ║
║ ┌────── Notifications ────────────┐ ║
║ │ 🚨 2 overdue tasks              │ ║
║ │ 📝 3 pending reviews            │ ║
║ │ 💰 Budget alert: Game Alpha     │ ║
║ │                                │ ║
║ │ [View All Notifications]       │ ║
║ └────────────────────────────────────┘ ║
║                                    ║
║ ┌────── Quick Actions ────────────┐ ║
║ │ [📋 New Task] [🎨 New Asset]   │ ║
║ │ [🐛 Report Bug] [⏰ Log Time]  │ ║
║ └────────────────────────────────────┘ ║
║                                    ║
║ Navigation:                        ║
║ [🏠] [📋] [🎨] [👥] [📊]          ║
║                                    ║
╚════════════════════════════════════╝
```

---

## 8. Notification System UI

```
╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ 🔔 Notifications                                                          [Mark All Read] [Settings] [✕ Close]   ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ All | Mentions | Deadlines | Reviews | System                                                                   ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                  ║
║ ┌─ 🚨 Critical Alert ─────────────────────────────────────────────────────────────────────────────── 2 min ago ┐ ║
║ │ Game crash bug (BUG-156) has been escalated to critical priority                                             │ ║
║ │ Assigned to: Ryan Park | Project: Game Alpha                                              [View Bug] [Dismiss] │ ║
║ └───────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ ┌─ 📅 Deadline Warning ───────────────────────────────────────────────────────────────────────────── 15 min ago ┐ ║
║ │ Task "Character Animation System" is due in 2 hours                                                           │ ║
║ │ Assigned to: Sarah Johnson | Current Progress: 85%                                        [View Task] [Snooze] │ ║
║ └───────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ ┌─ 👀 Review Request ──────────────────────────────────────────────────────────────────────────────── 1 hour ago ┐ ║
║ │ Pull Request #234 "User authentication endpoints" needs your review                                           │ ║
║ │ From: Alex Rodriguez | Files changed: 8 | Lines: +156, -23                               [Review PR] [Delegate] │ ║
║ └───────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ ┌─ 🎯 Task Completed ──────────────────────────────────────────────────────────────────────────────── 2 hours ago ┐ ║
║ │ Mike Chen completed "Forest Environment Package"                                                              │ ║
║ │ Asset moved to QA stage | Ready for review                                              [View Asset] [Archive] │ ║
║ └───────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ ┌─ 💰 Budget Alert ────────────────────────────────────────────────────────────────────────────────── 4 hours ago ┐ ║
║ │ Game Alpha project has reached 80% of allocated budget                                                        │ ║
║ │ Current spend: $48K / $60K | Projected overage: $3K                                    [View Budget] [Dismiss] │ ║
║ └───────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ ┌─ 👥 Team Update ─────────────────────────────────────────────────────────────────────────────────── 6 hours ago ┐ ║
║ │ Weekly team velocity report is available                                                                      │ ║
║ │ Sprint 5 velocity: 42 points | Team performance: Above average                          [View Report] [Share] │ ║
║ └───────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ ┌─ 🔄 System Update ───────────────────────────────────────────────────────────────────────────────── 1 day ago ─┐ ║
║ │ GitHub integration sync completed successfully                                                                 │ ║
║ │ Synced: 23 commits, 5 pull requests, 2 new issues                                       [View Details] [✓ Read] │ ║
║ └───────────────────────────────────────────────────────────────────────────────────────────────────────────────┘ ║
║                                                                                                                  ║
║ [Load More Notifications]                                                               Showing 7 of 15 unread ║
║                                                                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

---

## 9. Settings & Configuration UI

```
╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ ⚙️ Settings & Configuration                                                                           [Save] [Cancel] ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║ Profile | Notifications | Integrations | Security | Team | System                                               ║
╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                                                  ║
║  ┌─── User Profile ────────────────────────────────┐  ┌─── Notification Preferences ──────────────────────────┐  ║
║  │ First Name: [John                           ]    │  │ 📧 Email Notifications                               │  ║
║  │ Last Name:  [Smith                          ]    │  │ ☑️ Task deadlines                                     │  ║
║  │ Email:      [john.smith@studio.com          ]    │  │ ☑️ Code review requests                               │  ║
║  │ Role:       [Producer                    ▼]      │  │ ☑️ Critical bugs                                      │  ║
║  │ Department: [Production                  ▼]      │  │ ☐ Weekly reports                                     │  ║
║  │ Hourly Rate:[$ 85.00                        ]    │  │                                                      │  ║
║  │                                                 │  │ 💬 Discord Notifications                             │  ║
║  │ Profile Picture:                                │  │ ☑️ Mentions                                           │  ║
║  │ [Choose File] [Remove]                          │  │ ☑️ Project updates                                    │  ║
║  │                                                 │  │ ☐ Daily summaries                                    │  ║
║  │ Timezone: [PST (UTC-8)               ▼]        │  │                                                      │  ║
║  │ Language: [English                   ▼]        │  │ 📱 In-App Notifications                              │  ║
║  │ Theme:    [Auto                      ▼]        │  │ ☑️ Real-time updates                                  │  ║
║  └─────────────────────────────────────────────────┘  │ ☑️ Sound notifications                                │  ║
║                                                     │ ☑️ Browser notifications                               │  ║
║  ┌─── Integration Settings ───────────────────────┐  │                                                      │  ║
║  │ 🐙 GitHub Integration                           │  │ Frequency:                                           │  ║
║  │ Username: [alexdev                          ]   │  │ ○ Immediate  ⦿ Batched  ○ Daily digest              │  ║
║  │ Status: ✅ Connected                            │  └──────────────────────────────────────────────────────┘  ║
║  │ Last Sync: 5 minutes ago                       │                                                           ║
║  │ [Reconnect] [Test Connection]                   │  ┌─── Security Settings ─────────────────────────────────┐  ║
║  │                                                │  │ 🔐 Password Security                                  │  ║
║  │ 🔄 Plastic SCM Integration                      │  │ Current Password: [******************]                │  ║
║  │ Username: [alex.rodriguez                   ]   │  │ New Password:     [******************]                │  ║
║  │ Status: ✅ Connected                            │  │ Confirm Password: [******************]                │  ║
║  │ Last Sync: 2 hours ago                         │  │                                                      │  ║
║  │ [Reconnect] [Test Connection]                   │  │ 🔑 Two-Factor Authentication                         │  ║
║  │                                                │  │ Status: ⚠️ Not Enabled                               │  ║
║  │ 💬 Discord Integration                          │  │ [Enable 2FA] [View Recovery Codes]                  │  ║
║  │ User ID: [alexdev#1234                      ]   │  │                                                      │  ║
║  │ Status: ✅ Connected                            │  │ 📋 Active Sessions                                   │  ║
║  │ [Reconnect] [Test Connection]                   │  │ • Chrome (Windows) - Current session                │  ║
║  │                                                │  │ • Mobile App (iOS) - 2 hours ago                    │  ║
║  │ 📢 Slack Integration                            │  │ • Chrome (Mac) - 1 day ago                          │  ║
║  │ User ID: [@alex.rodriguez                   ]   │  │                                                      │  ║
║  │ Status: ❌ Not Connected                        │  │ [Revoke All Sessions] [View Audit Log]              │  ║
║  │ [Connect] [Configure Channels]                  │  └──────────────────────────────────────────────────────┘  ║
║  └─────────────────────────────────────────────────┘                                                           ║
║                                                                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

---

## Design System Components

### Color System:
- **Primary Blue**: #1976D2 (Actions, links, primary buttons)
- **Success Green**: #2E7D32 (Completed tasks, success states)
- **Warning Orange**: #F57C00 (Warnings, medium priority)
- **Error Red**: #D32F2F (Errors, critical issues, overdue items)
- **Info Purple**: #7B1FA2 (Information, secondary actions)

### Typography:
- **Headers**: Roboto Bold, 24px/32px/40px
- **Body Text**: Roboto Regular, 14px/16px
- **Small Text**: Roboto Regular, 12px
- **Code/Monospace**: JetBrains Mono, 14px

### Spacing:
- **Base Unit**: 8px
- **Small**: 8px, **Medium**: 16px, **Large**: 24px, **XL**: 32px

### Interactive Elements:
- **Buttons**: 8px border radius, 40px height
- **Input Fields**: 4px border radius, 48px height
- **Cards**: 8px border radius, 2px elevation
- **Modals**: 12px border radius, backdrop blur

### Responsive Breakpoints:
- **Mobile**: < 768px
- **Tablet**: 768px - 1024px  
- **Desktop**: > 1024px

### Accessibility Features:
- High contrast mode support
- Keyboard navigation for all interactive elements
- Screen reader friendly semantic markup
- Focus indicators on all focusable elements
- Alternative text for all images and icons

This comprehensive wireframe system provides a solid foundation for building the SGPT interface with modern design principles, excellent user experience, and full accessibility support.