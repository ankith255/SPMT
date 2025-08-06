# SGPT Delay Predictor AI Prompt Flows

## Overview
The Delay Predictor uses GPT-based AI to analyze project data and predict potential delays, providing producers with early warnings and actionable recommendations to keep projects on track.

## Core Prediction Models

### 1. Task-Level Delay Prediction

**System Prompt:**
```
You are an AI assistant for Smart Game Production Tracker (SGPT) specializing in delay prediction. Your role is to analyze task data and predict the likelihood of delays based on historical patterns and current indicators.

Context:
- You have access to task progress, team performance, and historical data
- Focus on data-driven predictions with confidence scores
- Consider multiple factors including complexity, team capacity, and dependencies
- Provide actionable recommendations for risk mitigation
- Be conservative in predictions to avoid false positives

Analysis Framework:
1. **Progress Analysis** - Current vs expected progress
2. **Team Capacity** - Available resources and workload
3. **Dependency Impact** - Blocking factors and external dependencies
4. **Historical Patterns** - Similar task completion patterns
5. **Risk Factors** - Technical complexity, scope changes, quality issues

Output Format:
- **Delay Probability**: 0-100% with confidence level
- **Predicted Delay**: Days/weeks if delay is likely
- **Key Risk Factors**: Top 3 factors contributing to delay
- **Mitigation Strategies**: Specific actions to reduce delay risk
- **Monitoring Recommendations**: What to track closely
```

**User Prompt Template:**
```
Analyze the following task for delay prediction:

**Task Information:**
- Task ID: [TASK_ID]
- Task Name: [TASK_NAME]
- Task Type: [TASK_TYPE] (asset/design/ui/unity/backend)
- Priority: [PRIORITY_LEVEL]
- Complexity: [COMPLEXITY_SCORE]

**Current Progress:**
- Start Date: [START_DATE]
- Due Date: [DUE_DATE]
- Current Status: [CURRENT_STATUS]
- Progress Percentage: [PROGRESS_PERCENTAGE]
- Days Remaining: [DAYS_REMAINING]

**Team Assignment:**
- Assigned To: [ASSIGNED_USER]
- User's Current Workload: [WORKLOAD_PERCENTAGE]
- User's Historical Performance: [PERFORMANCE_SCORE]
- User's Availability: [AVAILABILITY_STATUS]

**Dependencies:**
- Blocking Tasks: [BLOCKING_TASKS]
- Dependent Tasks: [DEPENDENT_TASKS]
- External Dependencies: [EXTERNAL_DEPENDENCIES]

**Historical Context:**
- Similar Tasks Completed: [SIMILAR_TASKS_DATA]
- Average Completion Time: [AVG_COMPLETION_TIME]
- Delay Patterns: [DELAY_PATTERNS]

**Quality Indicators:**
- Review Status: [REVIEW_STATUS]
- Bug Count: [BUG_COUNT]
- Revision Count: [REVISION_COUNT]

**Recent Activity:**
- Last Update: [LAST_UPDATE]
- Recent Comments: [RECENT_COMMENTS]
- Status Changes: [STATUS_CHANGES]

Provide a comprehensive delay prediction analysis including:
1. Probability of delay (0-100%)
2. Confidence level in prediction
3. Predicted delay duration if likely
4. Top 3 risk factors
5. Specific mitigation strategies
6. Monitoring recommendations
```

### 2. Sprint-Level Delay Prediction

**System Prompt:**
```
You are an AI assistant for SGPT analyzing sprint-level delay risks. Focus on identifying patterns that could impact sprint completion and team velocity.

Context:
- Analyze sprint velocity trends and capacity utilization
- Consider team dynamics and external factors
- Identify systemic issues affecting sprint performance
- Provide sprint-level risk mitigation strategies
- Consider both individual task delays and systemic issues

Analysis Framework:
1. **Velocity Analysis** - Current vs historical velocity
2. **Capacity Assessment** - Team availability and workload
3. **Dependency Mapping** - Critical path and blocking factors
4. **Quality Impact** - How quality issues affect timeline
5. **External Factors** - Stakeholder dependencies and market pressures

Output Format:
- **Sprint Risk Level**: Low/Medium/High with percentage
- **Critical Path Analysis**: Most likely delay sources
- **Velocity Impact**: Expected velocity deviation
- **Systemic Issues**: Patterns affecting multiple tasks
- **Sprint Recovery Strategies**: Actions to get back on track
```

**User Prompt Template:**
```
Analyze the following sprint for delay prediction:

**Sprint Information:**
- Sprint Name: [SPRINT_NAME]
- Sprint Duration: [SPRINT_DURATION]
- Start Date: [SPRINT_START]
- End Date: [SPRINT_END]
- Days Remaining: [DAYS_REMAINING]

**Sprint Goals:**
- Planned Story Points: [PLANNED_POINTS]
- Completed Story Points: [COMPLETED_POINTS]
- Remaining Story Points: [REMAINING_POINTS]
- Velocity Target: [VELOCITY_TARGET]

**Team Capacity:**
- Team Size: [TEAM_SIZE]
- Available Capacity: [AVAILABLE_CAPACITY]
- Current Workload: [CURRENT_WORKLOAD]
- Absences/Time Off: [ABSENCES]

**Task Status Distribution:**
- Not Started: [NOT_STARTED_COUNT]
- In Progress: [IN_PROGRESS_COUNT]
- In Review: [IN_REVIEW_COUNT]
- Blocked: [BLOCKED_COUNT]
- Completed: [COMPLETED_COUNT]

**Historical Context:**
- Previous Sprint Velocity: [PREVIOUS_VELOCITY]
- Historical Velocity Trend: [VELOCITY_TREND]
- Common Blockers: [COMMON_BLOCKERS]
- Quality Issues: [QUALITY_ISSUES]

**Current Blockers:**
- Technical Blockers: [TECHNICAL_BLOCKERS]
- Resource Blockers: [RESOURCE_BLOCKERS]
- External Dependencies: [EXTERNAL_DEPENDENCIES]
- Quality Blockers: [QUALITY_BLOCKERS]

**Risk Indicators:**
- Overdue Tasks: [OVERDUE_TASKS]
- High-Risk Tasks: [HIGH_RISK_TASKS]
- Dependencies at Risk: [DEPENDENCIES_AT_RISK]
- Quality Issues: [QUALITY_ISSUES]

Provide a comprehensive sprint delay analysis including:
1. Overall sprint risk level
2. Critical path analysis
3. Velocity prediction
4. Systemic issues identification
5. Recovery strategies
6. Risk mitigation recommendations
```

### 3. Project-Level Delay Prediction

**System Prompt:**
```
You are an AI assistant for SGPT analyzing project-level delay risks. Focus on strategic factors that could impact overall project timeline and milestone achievement.

Context:
- Analyze project trajectory and milestone dependencies
- Consider market pressures and stakeholder expectations
- Identify strategic risks and resource constraints
- Provide project-level risk mitigation strategies
- Consider both technical and business factors

Analysis Framework:
1. **Milestone Analysis** - Critical path and milestone dependencies
2. **Resource Assessment** - Team capacity and skill gaps
3. **Market Context** - Competitive pressures and timing
4. **Stakeholder Impact** - Client expectations and feedback cycles
5. **Technical Debt** - Accumulated technical issues affecting timeline

Output Format:
- **Project Risk Level**: Low/Medium/High with percentage
- **Critical Milestones**: Most at-risk milestones
- **Resource Gaps**: Capacity and skill constraints
- **Strategic Recommendations**: High-level mitigation strategies
- **Timeline Impact**: Expected project timeline deviation
```

**User Prompt Template:**
```
Analyze the following project for delay prediction:

**Project Information:**
- Project Name: [PROJECT_NAME]
- Project Phase: [PROJECT_PHASE]
- Start Date: [PROJECT_START]
- Target Release: [TARGET_RELEASE]
- Days Remaining: [DAYS_REMAINING]

**Milestone Status:**
- Completed Milestones: [COMPLETED_MILESTONES]
- Current Milestone: [CURRENT_MILESTONE]
- Upcoming Milestones: [UPCOMING_MILESTONES]
- Milestone Dependencies: [MILESTONE_DEPENDENCIES]

**Team Resources:**
- Total Team Size: [TEAM_SIZE]
- Available Capacity: [AVAILABLE_CAPACITY]
- Skill Gaps: [SKILL_GAPS]
- Resource Constraints: [RESOURCE_CONSTRAINTS]

**Project Metrics:**
- Overall Progress: [OVERALL_PROGRESS]
- Budget Utilization: [BUDGET_UTILIZATION]
- Quality Score: [QUALITY_SCORE]
- Client Satisfaction: [CLIENT_SATISFACTION]

**Market Context:**
- Competitive Landscape: [COMPETITIVE_CONTEXT]
- Market Timing: [MARKET_TIMING]
- Stakeholder Pressure: [STAKEHOLDER_PRESSURE]
- Business Impact: [BUSINESS_IMPACT]

**Technical Factors:**
- Technical Debt: [TECHNICAL_DEBT]
- Architecture Issues: [ARCHITECTURE_ISSUES]
- Integration Challenges: [INTEGRATION_CHALLENGES]
- Performance Issues: [PERFORMANCE_ISSUES]

**Risk History:**
- Previous Delays: [PREVIOUS_DELAYS]
- Recovery Patterns: [RECOVERY_PATTERNS]
- Risk Mitigation Success: [RISK_MITIGATION_SUCCESS]

Provide a comprehensive project delay analysis including:
1. Overall project risk assessment
2. Critical milestone analysis
3. Resource gap identification
4. Strategic risk factors
5. Timeline impact prediction
6. High-level mitigation strategies
```

## Specialized Prediction Models

### 4. Asset Pipeline Delay Prediction

**System Prompt:**
```
You are an AI assistant for SGPT specializing in art asset pipeline delay prediction. Focus on artistic workflow factors, review cycles, and quality iteration patterns.

Context:
- Consider artistic iteration cycles and feedback loops
- Analyze review and approval patterns
- Consider asset complexity and artistic requirements
- Factor in artist availability and skill levels
- Account for asset dependencies and integration needs

Key Factors:
1. **Artistic Complexity** - Asset type and detail requirements
2. **Review Cycles** - Feedback iteration patterns
3. **Artist Capacity** - Skill level and availability
4. **Quality Standards** - Client/team quality expectations
5. **Integration Dependencies** - Technical integration requirements
```

### 5. Development Module Delay Prediction

**System Prompt:**
```
You are an AI assistant for SGPT specializing in development module delay prediction. Focus on technical complexity, code quality, and integration challenges.

Context:
- Analyze code complexity and technical debt
- Consider integration dependencies and API changes
- Factor in testing requirements and bug resolution
- Account for code review cycles and quality gates
- Consider deployment and environment factors

Key Factors:
1. **Technical Complexity** - Code complexity and architecture
2. **Integration Dependencies** - API and system dependencies
3. **Quality Gates** - Testing and review requirements
4. **Performance Impact** - Performance optimization needs
5. **Deployment Factors** - Environment and deployment complexity
```

## Prediction Confidence Scoring

### Confidence Level Definitions

**High Confidence (85-100%):**
- Strong historical data patterns
- Clear risk indicators present
- Consistent team performance data
- Well-defined dependencies and constraints

**Medium Confidence (60-84%):**
- Some historical data available
- Mixed risk indicators
- Variable team performance
- Some uncertainty in dependencies

**Low Confidence (40-59%):**
- Limited historical data
- Unclear risk indicators
- New team or process
- High uncertainty in dependencies

### Confidence Factors

1. **Data Quality**
   - Historical data completeness
   - Data consistency and accuracy
   - Sample size adequacy

2. **Pattern Recognition**
   - Clear historical patterns
   - Consistent performance trends
   - Recognizable risk factors

3. **Context Clarity**
   - Well-defined requirements
   - Clear dependencies
   - Stable team composition

4. **External Factors**
   - Market stability
   - Stakeholder consistency
   - Resource availability

## Risk Factor Analysis

### Technical Risk Factors

1. **Complexity Indicators**
   - High story point estimates
   - Multiple dependencies
   - New technology adoption
   - Integration requirements

2. **Quality Indicators**
   - Bug introduction rate
   - Code review feedback
   - Testing coverage gaps
   - Performance bottlenecks

3. **Resource Indicators**
   - Skill gaps
   - Team availability
   - Tool and environment issues
   - Knowledge transfer needs

### Business Risk Factors

1. **Stakeholder Factors**
   - Changing requirements
   - Feedback cycle delays
   - Approval bottlenecks
   - Communication gaps

2. **Market Factors**
   - Competitive pressure
   - Timing constraints
   - Budget limitations
   - Resource constraints

3. **Process Factors**
   - Workflow inefficiencies
   - Decision-making delays
   - Quality gate bottlenecks
   - Communication overhead

## Mitigation Strategy Templates

### Task-Level Mitigation

**Immediate Actions:**
- Reallocate resources if needed
- Break down complex tasks
- Add additional review cycles
- Increase monitoring frequency

**Process Improvements:**
- Streamline approval processes
- Improve communication channels
- Enhance quality gates
- Optimize workflow efficiency

### Sprint-Level Mitigation

**Capacity Management:**
- Adjust sprint scope
- Reallocate team resources
- Prioritize critical path items
- Reduce technical debt

**Process Optimization:**
- Improve estimation accuracy
- Enhance sprint planning
- Strengthen quality processes
- Optimize review cycles

### Project-Level Mitigation

**Strategic Actions:**
- Reassess project scope
- Adjust milestone timelines
- Enhance resource allocation
- Improve stakeholder communication

**Process Enhancements:**
- Strengthen risk management
- Improve change control
- Enhance quality processes
- Optimize team structure

## Continuous Learning

### Feedback Integration

1. **Prediction Accuracy Tracking**
   - Compare predictions with actual outcomes
   - Identify prediction bias and errors
   - Refine prediction models based on results

2. **Risk Factor Validation**
   - Validate identified risk factors
   - Update risk factor weights
   - Add new risk factors as discovered

3. **Mitigation Effectiveness**
   - Track mitigation strategy success rates
   - Identify most effective strategies
   - Refine strategy recommendations

### Model Improvement

1. **Data Enrichment**
   - Collect additional relevant data
   - Improve data quality and consistency
   - Expand historical data sets

2. **Algorithm Refinement**
   - Update prediction algorithms
   - Improve confidence scoring
   - Enhance risk factor analysis

3. **User Feedback Integration**
   - Collect user feedback on predictions
   - Incorporate user insights
   - Improve prediction relevance

## Integration Points

### Data Sources
- Task progress and time tracking
- Team performance metrics
- Historical completion data
- Quality and review metrics
- Resource availability data
- Dependency mapping

### Output Destinations
- Dashboard alerts and notifications
- Email warnings and reports
- Slack/Discord notifications
- Risk management tools
- Project planning systems
- Executive dashboards

### Alert Thresholds
- **High Risk**: >80% delay probability
- **Medium Risk**: 50-80% delay probability
- **Low Risk**: 20-50% delay probability
- **Monitor**: <20% delay probability

## Quality Assurance

### Prediction Validation
1. **Accuracy Tracking**: Monitor prediction vs actual outcomes
2. **Bias Detection**: Identify and correct prediction biases
3. **Confidence Calibration**: Ensure confidence scores are accurate
4. **Model Performance**: Track overall prediction performance

### Continuous Monitoring
1. **Real-time Updates**: Update predictions as new data arrives
2. **Trend Analysis**: Monitor prediction accuracy trends
3. **Model Drift**: Detect when models need updating
4. **Performance Metrics**: Track key performance indicators