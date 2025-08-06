# Smart Game Production Tracker (SGPT) - AI Prompt Flows

## Overview
This document defines the AI prompt flows for the automated summarization and delay prediction features in SGPT. These prompts are designed to work with large language models (GPT-4, Claude, etc.) to provide intelligent insights for game production management.

## Model Requirements
- **Primary Model**: GPT-4 or Claude-3-Opus for complex reasoning
- **Secondary Model**: GPT-3.5-turbo for simpler tasks and cost optimization  
- **Context Window**: Minimum 8K tokens, recommended 32K+ for large projects
- **Temperature**: 0.1-0.3 for factual summaries, 0.5-0.7 for recommendations

---

## 1. Auto-Summarizer Prompt Flows

### 1.1 Daily Project Summary

```
# System Prompt
You are an expert game production analyst specializing in Unity-based game development. Your role is to generate concise, actionable daily summaries for game production teams. Focus on progress, blockers, risks, and recommendations.

# User Prompt Template
Generate a daily summary for the following game project:

**Project:** {project_name}  
**Date:** {current_date}  
**Summary Type:** Daily Progress Report

**Data Context:**
- **Tasks Completed Today:** {completed_tasks}
- **Tasks In Progress:** {in_progress_tasks}  
- **New Tasks Created:** {new_tasks}
- **Blocked Tasks:** {blocked_tasks}
- **Art Assets Updated:** {updated_assets}
- **Bugs Reported:** {new_bugs}
- **Bugs Resolved:** {resolved_bugs}
- **Pull Requests:** {pull_requests}
- **Commits:** {commits}
- **Team Member Activities:** {team_activities}
- **Budget Status:** Spent ${spent_budget} of ${total_budget}

**Previous Issues to Track:**
{previous_issues}

**Team Capacity:**
{team_capacity_info}

**Format Requirements:**
1. Executive Summary (2-3 sentences)
2. Key Accomplishments (bullet points)
3. Current Blockers & Risks (bullet points)
4. Tomorrow's Priorities (3-5 items)
5. Action Items for Leadership (if any)
6. Team Health Indicators

Keep the summary under 300 words and focus on actionable insights.
```

### 1.2 Sprint Summary

```
# System Prompt
You are a senior game production consultant with expertise in agile methodologies and Unity game development. Analyze sprint data to provide comprehensive sprint retrospectives and planning insights.

# User Prompt Template
Generate a sprint summary for the following data:

**Project:** {project_name}
**Sprint:** {sprint_name} ({sprint_start_date} to {sprint_end_date})
**Sprint Status:** {sprint_status}

**Sprint Metrics:**
- **Planned Story Points:** {planned_points}
- **Completed Story Points:** {completed_points}
- **Velocity:** {velocity} (Target: {target_velocity})
- **Tasks Completed:** {completed_tasks}/{total_tasks}
- **Assets Delivered:** {delivered_assets}
- **Bugs Fixed:** {bugs_fixed}
- **New Bugs Introduced:** {new_bugs}
- **Code Coverage:** {code_coverage}%
- **Review Cycle Time:** {avg_review_time} days

**Team Performance:**
{team_performance_data}

**Goal Achievement:**
{sprint_goals_status}

**Blockers Encountered:**
{sprint_blockers}

**Technical Debt:**
{technical_debt_info}

**Generate the following sections:**

1. **Sprint Overview** (2-3 sentences on overall performance)
2. **Velocity Analysis** (compare to previous sprints and targets)
3. **Quality Metrics** (bug rates, code quality, review efficiency)
4. **Goal Achievement** (which goals were met/missed and why)
5. **Team Highlights** (individual/team accomplishments)
6. **Areas for Improvement** (specific, actionable recommendations)
7. **Risks for Next Sprint** (potential issues to watch)
8. **Recommendations for Sprint Planning** (capacity, focus areas)

Limit to 500 words with data-driven insights and specific recommendations.
```

### 1.3 Weekly Team Performance Summary

```
# System Prompt
You are an expert in team performance analytics for game development studios. Analyze team metrics to provide balanced, constructive insights that help improve productivity while maintaining team morale.

# User Prompt Template
Analyze the following team performance data for the week of {week_start} to {week_end}:

**Project:** {project_name}
**Team:** {team_name} ({team_size} members)

**Individual Performance Data:**
{individual_metrics}

**Team Metrics:**
- **Total Hours Logged:** {total_hours}
- **Average Task Completion Time:** {avg_completion_time}
- **On-time Delivery Rate:** {on_time_rate}%
- **Code Review Coverage:** {review_coverage}%
- **Collaboration Score:** {collaboration_score}/10
- **Knowledge Sharing Events:** {knowledge_sharing_count}

**Quality Indicators:**
- **Bug Introduction Rate:** {bug_introduction_rate}
- **Rework Percentage:** {rework_percentage}%
- **Client/Stakeholder Feedback Score:** {feedback_score}/5

**Team Health Signals:**
- **Morale Survey Results:** {morale_data}
- **Overtime Hours:** {overtime_hours}
- **Sick Days:** {sick_days}
- **Team Communication Frequency:** {communication_frequency}

**Previous Week Comparison:**
{previous_week_comparison}

**Generate a balanced report with:**

1. **Team Performance Overview** (highlight achievements and progress)
2. **Individual Recognition** (top performers and areas of growth)
3. **Productivity Insights** (efficiency trends and patterns)
4. **Quality Assessment** (code quality, output quality, processes)
5. **Team Health Check** (workload balance, morale, collaboration)
6. **Development Opportunities** (skills to develop, training needs)
7. **Process Improvements** (workflow optimizations)
8. **Action Items** (specific next steps for team leads)

Keep the tone positive and constructive. Focus on growth opportunities rather than criticism. Limit to 400 words.
```

### 1.4 Monthly Project Health Report

```
# System Prompt
You are a strategic game production advisor with deep experience in project management, financial planning, and risk assessment for Unity-based game studios. Provide executive-level insights and strategic recommendations.

# User Prompt Template
Generate a comprehensive monthly project health report:

**Project:** {project_name}
**Reporting Period:** {month_year}
**Project Timeline:** {start_date} to {end_date} ({days_remaining} days remaining)

**Financial Status:**
- **Budget:** ${spent_budget} / ${total_budget} ({budget_percentage}% spent)
- **Burn Rate:** ${monthly_burn_rate}/month
- **Projected Total Cost:** ${projected_cost}
- **Cost Per Story Point:** ${cost_per_point}

**Progress Metrics:**
- **Overall Completion:** {overall_progress}%
- **Features Complete:** {features_complete}/{total_features}
- **Art Assets Complete:** {assets_complete}/{total_assets}
- **Technical Milestones:** {milestones_status}

**Team & Resource Metrics:**
- **Team Velocity Trend:** {velocity_trend}
- **Resource Utilization:** {resource_utilization}%
- **Team Stability:** {team_stability_metrics}

**Quality & Risk Indicators:**
- **Critical Bugs Open:** {critical_bugs}
- **Technical Debt Score:** {tech_debt_score}/10
- **Performance Benchmarks:** {performance_metrics}
- **User Testing Results:** {user_testing_data}

**External Dependencies:**
{external_dependencies_status}

**Stakeholder Feedback:**
{stakeholder_feedback_summary}

**Market & Competition Analysis:**
{market_analysis_data}

**Provide a strategic analysis covering:**

1. **Executive Summary** (3-4 sentences for leadership)
2. **Project Health Score** (Green/Yellow/Red with justification)
3. **Financial Projection** (budget forecast and recommendations)
4. **Timeline Assessment** (delivery confidence and risk factors)
5. **Quality & Performance** (current state and trajectory)
6. **Team & Resource Planning** (capacity, hiring needs, skills gaps)
7. **Risk Assessment** (top 5 risks with mitigation strategies)
8. **Strategic Recommendations** (key decisions needed)
9. **Stakeholder Communication** (key messages for different audiences)

Target 600-800 words with executive-level insights and clear action items.
```

---

## 2. Delay Prediction Prompt Flows

### 2.1 Task Delay Prediction

```
# System Prompt
You are an expert predictive analyst specializing in software development and game production timelines. You use historical data, current progress indicators, and team dynamics to predict potential delays with high accuracy. Provide probability-based predictions with confidence intervals and actionable mitigation strategies.

# User Prompt Template
Analyze the following task for delay probability:

**Task Information:**
- **Task ID:** {task_id}
- **Title:** {task_title}
- **Type:** {task_type}
- **Complexity:** {complexity_score}/10
- **Original Estimate:** {original_estimate} hours
- **Time Spent:** {time_spent} hours
- **Progress:** {progress_percentage}%
- **Due Date:** {due_date}
- **Days Remaining:** {days_remaining}

**Assignee Data:**
- **Developer:** {assignee_name}
- **Experience Level:** {experience_level}
- **Current Workload:** {current_workload} hours
- **Historical Velocity:** {historical_velocity} points/week
- **Recent Performance:** {recent_performance_metrics}
- **Availability:** {availability_percentage}% (accounting for meetings, etc.)

**Task Context:**
- **Dependencies:** {dependency_status}
- **Blockers:** {current_blockers}
- **Requirements Clarity:** {requirements_clarity_score}/10
- **Technical Risk:** {technical_risk_score}/10
- **Similar Task History:** {similar_task_data}

**Team Environment:**
- **Team Velocity Trend:** {team_velocity_trend}
- **Current Sprint Load:** {sprint_load_percentage}%
- **Recent Interruptions:** {interruption_frequency}
- **Code Review Backlog:** {review_backlog_days} days
- **Integration Complexity:** {integration_risk_score}/10

**Historical Patterns:**
{historical_delay_patterns}

**Project Context:**
- **Project Phase:** {project_phase}
- **Overall Timeline Pressure:** {timeline_pressure_score}/10
- **Stakeholder Pressure:** {stakeholder_pressure_level}

**Provide a comprehensive delay analysis:**

1. **Delay Probability:** X% chance of delay (with confidence interval)
2. **Expected Completion:** Predicted date range with confidence levels
3. **Risk Factors:** Top 3 factors contributing to delay risk
4. **Scenario Analysis:**
   - Best case: Complete by {best_case_date}
   - Most likely: Complete by {likely_date}  
   - Worst case: Complete by {worst_case_date}
5. **Early Warning Signals:** Key metrics to monitor
6. **Mitigation Strategies:** 3-5 specific actions to reduce delay risk
7. **Resource Recommendations:** Additional resources/support needed
8. **Escalation Triggers:** When to escalate to management

Include specific data points that support your analysis and quantify confidence levels.
```

### 2.2 Sprint Delay Prediction

```
# System Prompt
You are a senior agile coach and game production analyst with expertise in sprint planning and risk assessment. Use current sprint data and team dynamics to predict sprint completion probability and recommend interventions.

# User Prompt Template
Analyze sprint delay risk for the following sprint:

**Sprint Details:**
- **Sprint:** {sprint_name}
- **Project:** {project_name}
- **Start Date:** {start_date}
- **End Date:** {end_date}
- **Days Remaining:** {days_remaining}
- **Planned Story Points:** {planned_points}
- **Completed Points:** {completed_points}

**Current Progress:**
- **Completion Rate:** {completion_percentage}%
- **Daily Velocity:** {daily_velocity} points/day
- **Required Velocity:** {required_velocity} points/day to complete on time
- **Velocity Trend:** {velocity_trend} (last 5 days)

**Task Status:**
- **Not Started:** {not_started_tasks} tasks ({not_started_points} points)
- **In Progress:** {in_progress_tasks} tasks ({in_progress_points} points)
- **In Review:** {in_review_tasks} tasks ({in_review_points} points)
- **Blocked:** {blocked_tasks} tasks ({blocked_points} points)
- **Completed:** {completed_tasks} tasks ({completed_points} points)

**Team Availability:**
- **Team Size:** {active_team_size} members
- **Planned Absences:** {planned_absences}
- **Sick Days Taken:** {sick_days}
- **Average Daily Capacity:** {daily_capacity} hours
- **Utilization Rate:** {utilization_rate}%

**Quality Metrics:**
- **Bug Discovery Rate:** {bug_discovery_rate} bugs/day
- **Rework Percentage:** {rework_percentage}%
- **Review Cycle Time:** {avg_review_time} hours
- **Integration Issues:** {integration_issues} reported

**External Factors:**
- **Dependency Delays:** {dependency_delays}
- **Scope Changes:** {scope_changes}
- **Stakeholder Feedback:** {stakeholder_feedback_impact}
- **Technical Discoveries:** {technical_discoveries}

**Historical Context:**
- **Previous Sprint Velocities:** {previous_velocities}
- **Team Performance Trend:** {performance_trend}
- **Similar Sprint Outcomes:** {similar_sprint_data}

**Risk Indicators:**
{current_risk_indicators}

**Generate a comprehensive sprint prediction:**

1. **Sprint Success Probability:** X% chance of completing all committed work
2. **Completion Scenarios:**
   - 90% confident: {conservative_completion}% of work complete
   - 70% confident: {likely_completion}% of work complete
   - 50% confident: {optimistic_completion}% of work complete
3. **Critical Path Analysis:** Tasks that most impact sprint success
4. **Velocity Projection:** Expected final velocity with confidence range
5. **Risk Assessment:** Top 5 risks to sprint completion
6. **Intervention Opportunities:**
   - Scope adjustments possible
   - Resource reallocation options
   - Process improvements
7. **Daily Monitoring Plan:** Key metrics to track daily
8. **Escalation Strategy:** When and how to adjust sprint scope

Provide specific recommendations for the next 3 days to maximize sprint success probability.
```

### 2.3 Project Milestone Delay Prediction

```
# System Prompt
You are a strategic project management consultant specializing in game development with expertise in milestone planning, risk assessment, and timeline forecasting. Analyze complex project data to predict milestone delivery risks and provide strategic recommendations.

# User Prompt Template
Assess delay risk for the upcoming project milestone:

**Milestone Information:**
- **Milestone:** {milestone_name}
- **Target Date:** {target_date}
- **Days Until Deadline:** {days_remaining}
- **Milestone Type:** {milestone_type} (Alpha/Beta/Gold Master/etc.)
- **Criticality:** {criticality_level}/10

**Completion Requirements:**
{milestone_requirements}

**Current Progress:**
- **Features Complete:** {features_complete}/{total_features} ({feature_percentage}%)
- **Assets Complete:** {assets_complete}/{total_assets} ({asset_percentage}%)
- **Bugs Resolved:** {bugs_resolved}/{total_bugs} ({bug_percentage}%)
- **Testing Coverage:** {testing_coverage}%
- **Performance Benchmarks:** {performance_status}

**Dependency Status:**
{dependency_analysis}

**Team Capacity Analysis:**
- **Art Team:** {art_team_capacity} (Utilization: {art_utilization}%)
- **Development Team:** {dev_team_capacity} (Utilization: {dev_utilization}%)
- **QA Team:** {qa_team_capacity} (Utilization: {qa_utilization}%)
- **Design Team:** {design_team_capacity} (Utilization: {design_utilization}%)

**Velocity Projections:**
- **Current Sprint Velocity:** {current_velocity}
- **Required Velocity:** {required_velocity} to meet milestone
- **Historical Average:** {historical_average_velocity}
- **Trend Analysis:** {velocity_trend_analysis}

**Quality Gates:**
- **Code Quality Score:** {code_quality_score}/10
- **Performance Benchmarks:** {performance_benchmarks}
- **User Acceptance Criteria:** {acceptance_criteria_status}
- **Platform Compliance:** {platform_compliance_status}

**Risk Factors:**
{identified_risks}

**External Dependencies:**
{external_dependencies}

**Stakeholder Expectations:**
{stakeholder_expectations}

**Financial Constraints:**
- **Budget Remaining:** ${remaining_budget}
- **Resource Cost Rate:** ${resource_cost_rate}/day
- **Overtime Budget:** ${overtime_budget}

**Provide a strategic milestone analysis:**

1. **Milestone Delivery Confidence:** X% probability of on-time delivery
2. **Timeline Scenarios:**
   - Aggressive (10% probability): Deliver by {aggressive_date}
   - Realistic (50% probability): Deliver by {realistic_date}
   - Conservative (90% probability): Deliver by {conservative_date}
3. **Critical Path Analysis:** Dependencies that most impact timeline
4. **Resource Bottleneck Assessment:** Team/skill constraints
5. **Quality vs. Timeline Tradeoffs:** Potential scope adjustments
6. **Financial Impact Analysis:** Cost of delay vs. acceleration
7. **Stakeholder Communication Strategy:** Key messages and timing
8. **Contingency Planning:** Fallback options and their implications
9. **Daily/Weekly Monitoring Plan:** KPIs to track progress
10. **Strategic Recommendations:** 
    - Immediate actions (next 48 hours)
    - Short-term adjustments (next 2 weeks)
    - Long-term planning changes

Include confidence intervals for all predictions and quantify the impact of different mitigation strategies.
```

---

## 3. AI Model Integration Guidelines

### 3.1 Prompt Engineering Best Practices

```
**Context Optimization:**
- Provide structured data with clear labels
- Include relevant historical context (last 3-6 months)
- Use consistent data formats across all prompts
- Include confidence indicators for input data quality

**Output Format:**
- Request specific formats (JSON, structured text, bullet points)
- Ask for confidence scores (0-100%) for predictions
- Require specific word limits for summaries
- Request actionable recommendations with timeframes

**Bias Mitigation:**
- Include diverse team perspectives in training data
- Regularly audit outputs for fairness across team members
- Use multiple models for critical decisions
- Implement human review for high-impact predictions

**Quality Assurance:**
- Validate predictions against actual outcomes
- Track accuracy metrics over time
- Adjust prompts based on performance data
- Implement feedback loops for continuous improvement
```

### 3.2 Integration Architecture

```
**API Integration Flow:**
1. Data Collection: Aggregate from database, GitHub, Plastic SCM
2. Data Preprocessing: Clean, normalize, and structure data
3. Prompt Generation: Use templates with current data
4. Model Invocation: Send to appropriate AI model
5. Response Processing: Parse and validate AI output
6. Confidence Scoring: Assess prediction reliability
7. Storage: Save predictions and actual outcomes
8. Feedback Loop: Update models based on accuracy

**Model Selection Logic:**
- GPT-4: Complex reasoning, strategic analysis, nuanced recommendations
- GPT-3.5-turbo: Quick summaries, simple predictions, daily updates
- Claude-3: Detailed analysis, alternative perspectives, risk assessment
- Fine-tuned Models: Domain-specific predictions with project history

**Performance Monitoring:**
- Track prediction accuracy by model and prompt type
- Monitor response times and costs
- A/B test different prompt variations
- Measure user satisfaction with AI insights
```

### 3.3 Ethical AI Guidelines

```
**Transparency:**
- Always indicate AI-generated content
- Provide confidence scores for all predictions
- Explain the data sources used for analysis
- Allow users to see the reasoning behind recommendations

**Privacy Protection:**
- Anonymize personal performance data when possible
- Protect sensitive project information
- Implement role-based access to AI insights
- Regular security audits of AI data handling

**Fairness:**
- Ensure predictions don't discriminate based on personal characteristics
- Regular bias testing across different demographics
- Multiple perspective analysis for team assessments
- Human oversight for performance-related AI outputs

**Human Oversight:**
- AI recommendations are advisory, not prescriptive
- Critical decisions require human review
- Easy override mechanisms for AI suggestions
- Regular validation of AI accuracy against human judgment
```

---

## 4. Prompt Performance Metrics

### 4.1 Summarizer Metrics

```
**Accuracy Metrics:**
- Fact accuracy: % of verifiable facts correctly stated
- Completeness: % of key events included in summary
- Relevance: % of summary content deemed relevant by users

**Quality Metrics:**
- Readability score (Flesch-Kincaid)
- Actionability: % of recommendations that are implementable
- Timeliness: % of urgent issues properly highlighted

**User Satisfaction:**
- Summary usefulness rating (1-5 scale)
- Time saved compared to manual summary creation
- Frequency of summary sharing among team members
```

### 4.2 Delay Predictor Metrics

```
**Prediction Accuracy:**
- Binary accuracy: % of delay/no-delay predictions correct
- Timeline accuracy: Average difference between predicted and actual dates
- Confidence calibration: How well confidence scores match actual accuracy

**Business Impact:**
- Early warning effectiveness: % of delays caught 3+ days early
- Mitigation success rate: % of predicted delays successfully avoided
- Resource optimization: Improvement in resource allocation efficiency

**Model Performance:**
- Response time: Average time to generate predictions
- Cost efficiency: Prediction cost vs. value provided
- Stability: Consistency of predictions over time
```

This comprehensive AI prompt system provides the foundation for intelligent automation in the SGPT platform, enabling proactive project management and data-driven insights for game development teams.