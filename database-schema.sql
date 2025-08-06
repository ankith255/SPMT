-- Smart Game Production Tracker (SGPT) Database Schema
-- PostgreSQL Database Schema for Unity-based game studios

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ====================================
-- Core User Management
-- ====================================

-- User roles enum
CREATE TYPE user_role AS ENUM ('admin', 'producer', 'team_lead', 'artist', 'designer', 'developer', 'qa_tester', 'freelancer');

-- Department enum
CREATE TYPE department AS ENUM ('art', 'design', 'ui_ux', 'frontend', 'backend', 'qa', 'production', 'management');

-- Users table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role user_role NOT NULL,
    department department,
    is_active BOOLEAN DEFAULT true,
    hourly_rate DECIMAL(10,2), -- For cost calculations
    github_username VARCHAR(100),
    plastic_scm_username VARCHAR(100),
    discord_id VARCHAR(100),
    slack_id VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- Project & Sprint Management
-- ====================================

-- Project status enum
CREATE TYPE project_status AS ENUM ('planning', 'active', 'on_hold', 'completed', 'cancelled');

-- Projects table
CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status project_status DEFAULT 'planning',
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15,2),
    producer_id UUID REFERENCES users(id),
    github_repo_url VARCHAR(500),
    plastic_scm_repo VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sprint status enum
CREATE TYPE sprint_status AS ENUM ('planning', 'active', 'completed', 'cancelled');

-- Sprints table
CREATE TABLE sprints (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status sprint_status DEFAULT 'planning',
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    story_points_planned INTEGER DEFAULT 0,
    story_points_completed INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- Art Asset Pipeline Module
-- ====================================

-- Asset type enum
CREATE TYPE asset_type AS ENUM ('character', 'environment', 'ui_asset', 'vfx', 'prop', 'audio', 'texture', 'model');

-- Asset stage enum
CREATE TYPE asset_stage AS ENUM ('concept', 'modeling', 'texturing', 'rigging', 'animation', 'qa', 'approved', 'rejected');

-- Asset priority enum
CREATE TYPE priority_level AS ENUM ('low', 'medium', 'high', 'critical');

-- Art assets table
CREATE TABLE art_assets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    asset_type asset_type NOT NULL,
    current_stage asset_stage DEFAULT 'concept',
    priority priority_level DEFAULT 'medium',
    assigned_artist_id UUID REFERENCES users(id),
    estimated_hours DECIMAL(5,2),
    actual_hours DECIMAL(5,2) DEFAULT 0,
    estimated_cost DECIMAL(10,2),
    actual_cost DECIMAL(10,2) DEFAULT 0,
    due_date DATE,
    completion_percentage INTEGER DEFAULT 0 CHECK (completion_percentage >= 0 AND completion_percentage <= 100),
    feedback_count INTEGER DEFAULT 0,
    revision_count INTEGER DEFAULT 0,
    delivery_files JSONB, -- Array of file paths/URLs
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Asset stage history for tracking progress
CREATE TABLE asset_stage_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    asset_id UUID REFERENCES art_assets(id) ON DELETE CASCADE,
    previous_stage asset_stage,
    new_stage asset_stage NOT NULL,
    changed_by_id UUID REFERENCES users(id),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- Game Design Module
-- ====================================

-- Design document status enum
CREATE TYPE design_doc_status AS ENUM ('draft', 'review', 'approved', 'implemented', 'deprecated');

-- Design documents table
CREATE TABLE design_documents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    status design_doc_status DEFAULT 'draft',
    author_id UUID REFERENCES users(id),
    reviewer_id UUID REFERENCES users(id),
    version INTEGER DEFAULT 1,
    tags TEXT[], -- Array of tags for categorization
    file_url VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Game mechanics balancing sheets
CREATE TABLE balancing_sheets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100), -- e.g., 'combat', 'economy', 'progression'
    data JSONB NOT NULL, -- Flexible JSON structure for different balance data
    version INTEGER DEFAULT 1,
    created_by_id UUID REFERENCES users(id),
    approved_by_id UUID REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- UI/UX Workflow Module
-- ====================================

-- UI stage enum
CREATE TYPE ui_stage AS ENUM ('wireframe', 'mockup', 'prototype', 'implementation', 'testing', 'approved');

-- UI components table
CREATE TABLE ui_components (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    screen_name VARCHAR(255),
    current_stage ui_stage DEFAULT 'wireframe',
    assigned_designer_id UUID REFERENCES users(id),
    assigned_developer_id UUID REFERENCES users(id),
    estimated_hours DECIMAL(5,2),
    actual_hours DECIMAL(5,2) DEFAULT 0,
    priority priority_level DEFAULT 'medium',
    figma_url VARCHAR(500),
    prototype_url VARCHAR(500),
    implementation_status VARCHAR(100),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- Task Management (Generic)
-- ====================================

-- Task type enum
CREATE TYPE task_type AS ENUM ('development', 'design', 'art', 'qa', 'research', 'review', 'meeting', 'documentation');

-- Task status enum
CREATE TYPE task_status AS ENUM ('todo', 'in_progress', 'in_review', 'completed', 'blocked', 'cancelled');

-- Tasks table
CREATE TABLE tasks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    sprint_id UUID REFERENCES sprints(id) ON DELETE SET NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    task_type task_type NOT NULL,
    status task_status DEFAULT 'todo',
    priority priority_level DEFAULT 'medium',
    assigned_to_id UUID REFERENCES users(id),
    created_by_id UUID REFERENCES users(id),
    story_points INTEGER DEFAULT 0,
    estimated_hours DECIMAL(5,2),
    actual_hours DECIMAL(5,2) DEFAULT 0,
    due_date DATE,
    parent_task_id UUID REFERENCES tasks(id), -- For sub-tasks
    dependencies UUID[], -- Array of task IDs this task depends on
    tags TEXT[],
    external_links JSONB, -- GitHub issues, Plastic SCM changesets, etc.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- Version Control Integration
-- ====================================

-- Repository type enum
CREATE TYPE repo_type AS ENUM ('github', 'plastic_scm');

-- Repositories table
CREATE TABLE repositories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    type repo_type NOT NULL,
    url VARCHAR(500) NOT NULL,
    api_token_encrypted TEXT, -- Encrypted API tokens
    last_sync_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Commits/Changesets table
CREATE TABLE commits (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    repository_id UUID REFERENCES repositories(id) ON DELETE CASCADE,
    external_id VARCHAR(255) NOT NULL, -- GitHub commit hash or Plastic changeset ID
    author_username VARCHAR(100) NOT NULL,
    author_id UUID REFERENCES users(id), -- Linked to our user if found
    message TEXT NOT NULL,
    branch VARCHAR(255),
    files_changed TEXT[],
    lines_added INTEGER DEFAULT 0,
    lines_deleted INTEGER DEFAULT 0,
    commit_date TIMESTAMP NOT NULL,
    synced_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Pull requests / Code reviews table
CREATE TABLE pull_requests (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    repository_id UUID REFERENCES repositories(id) ON DELETE CASCADE,
    external_id VARCHAR(255) NOT NULL, -- GitHub PR number
    title VARCHAR(255) NOT NULL,
    description TEXT,
    author_username VARCHAR(100) NOT NULL,
    author_id UUID REFERENCES users(id),
    reviewer_ids UUID[], -- Array of reviewer user IDs
    status VARCHAR(50) NOT NULL, -- open, closed, merged, etc.
    source_branch VARCHAR(255),
    target_branch VARCHAR(255),
    created_date TIMESTAMP NOT NULL,
    merged_date TIMESTAMP,
    synced_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- Bug Tracking Module
-- ====================================

-- Bug severity enum
CREATE TYPE bug_severity AS ENUM ('low', 'medium', 'high', 'critical', 'blocker');

-- Bug status enum
CREATE TYPE bug_status AS ENUM ('open', 'in_progress', 'resolved', 'closed', 'reopened', 'duplicate', 'wont_fix');

-- Bugs table
CREATE TABLE bugs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    severity bug_severity DEFAULT 'medium',
    priority priority_level DEFAULT 'medium',
    status bug_status DEFAULT 'open',
    module department NOT NULL, -- Which module/department it affects
    reported_by_id UUID REFERENCES users(id),
    assigned_to_id UUID REFERENCES users(id),
    environment VARCHAR(255), -- e.g., 'Unity Editor', 'Build', 'Staging'
    steps_to_reproduce TEXT,
    expected_behavior TEXT,
    actual_behavior TEXT,
    attachments JSONB, -- Screenshots, logs, etc.
    related_commits UUID[], -- Array of commit IDs
    related_tasks UUID[], -- Array of task IDs
    duplicate_of_id UUID REFERENCES bugs(id),
    resolution_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP
);

-- ====================================
-- Finance & Cost Tracking
-- ====================================

-- Payment status enum
CREATE TYPE payment_status AS ENUM ('pending', 'approved', 'paid', 'disputed', 'cancelled');

-- Cost entries table
CREATE TABLE cost_entries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id),
    task_id UUID REFERENCES tasks(id),
    asset_id UUID REFERENCES art_assets(id),
    description VARCHAR(255) NOT NULL,
    hours_worked DECIMAL(5,2) NOT NULL,
    hourly_rate DECIMAL(10,2) NOT NULL,
    total_cost DECIMAL(10,2) GENERATED ALWAYS AS (hours_worked * hourly_rate) STORED,
    work_date DATE NOT NULL,
    approved_by_id UUID REFERENCES users(id),
    payment_status payment_status DEFAULT 'pending',
    invoice_id VARCHAR(100),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payment milestones for freelancers
CREATE TABLE payment_milestones (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    freelancer_id UUID REFERENCES users(id),
    milestone_name VARCHAR(255) NOT NULL,
    description TEXT,
    amount DECIMAL(10,2) NOT NULL,
    due_date DATE,
    completion_criteria TEXT,
    status payment_status DEFAULT 'pending',
    completed_at TIMESTAMP,
    paid_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- Performance & Analytics
-- ====================================

-- Performance metrics table
CREATE TABLE performance_metrics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    tasks_completed INTEGER DEFAULT 0,
    story_points_completed INTEGER DEFAULT 0,
    total_hours_logged DECIMAL(8,2) DEFAULT 0,
    commits_count INTEGER DEFAULT 0,
    pull_requests_count INTEGER DEFAULT 0,
    bugs_reported INTEGER DEFAULT 0,
    bugs_fixed INTEGER DEFAULT 0,
    on_time_delivery_rate DECIMAL(5,2), -- Percentage
    average_task_completion_time DECIMAL(5,2), -- Hours
    feedback_score DECIMAL(3,2), -- 1-5 scale
    revision_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- Notifications & Alerts
-- ====================================

-- Notification type enum
CREATE TYPE notification_type AS ENUM ('deadline_warning', 'task_overdue', 'review_pending', 'inactivity_alert', 'milestone_reached', 'bug_critical', 'budget_warning');

-- Notification channel enum
CREATE TYPE notification_channel AS ENUM ('email', 'discord', 'slack', 'in_app');

-- Notifications table
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    type notification_type NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    channels notification_channel[] DEFAULT '{in_app}',
    related_entity_type VARCHAR(50), -- 'task', 'asset', 'bug', etc.
    related_entity_id UUID,
    is_read BOOLEAN DEFAULT false,
    is_sent BOOLEAN DEFAULT false,
    send_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- AI & Automation
-- ====================================

-- AI prediction types
CREATE TYPE prediction_type AS ENUM ('delay_prediction', 'cost_estimation', 'performance_forecast', 'risk_assessment');

-- AI predictions table
CREATE TABLE ai_predictions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    type prediction_type NOT NULL,
    target_entity_type VARCHAR(50), -- 'task', 'sprint', 'asset', etc.
    target_entity_id UUID,
    prediction_data JSONB NOT NULL, -- Flexible structure for different predictions
    confidence_score DECIMAL(3,2), -- 0-1 confidence level
    created_by_model VARCHAR(100), -- AI model identifier
    is_accurate BOOLEAN, -- For feedback learning
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Auto-generated summaries
CREATE TABLE ai_summaries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    summary_type VARCHAR(50) NOT NULL, -- 'sprint', 'weekly', 'monthly', 'project'
    period_start DATE,
    period_end DATE,
    summary_content TEXT NOT NULL,
    key_metrics JSONB,
    recommendations TEXT,
    generated_by_model VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- Audit & History
-- ====================================

-- Audit log for tracking all changes
CREATE TABLE audit_log (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    table_name VARCHAR(100) NOT NULL,
    record_id UUID NOT NULL,
    action VARCHAR(10) NOT NULL, -- INSERT, UPDATE, DELETE
    old_values JSONB,
    new_values JSONB,
    changed_by_id UUID REFERENCES users(id),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- Indexes for Performance
-- ====================================

-- User indexes
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_users_department ON users(department);

-- Project indexes
CREATE INDEX idx_projects_status ON projects(status);
CREATE INDEX idx_projects_producer ON projects(producer_id);

-- Sprint indexes
CREATE INDEX idx_sprints_project ON sprints(project_id);
CREATE INDEX idx_sprints_status ON sprints(status);
CREATE INDEX idx_sprints_dates ON sprints(start_date, end_date);

-- Task indexes
CREATE INDEX idx_tasks_project ON tasks(project_id);
CREATE INDEX idx_tasks_sprint ON tasks(sprint_id);
CREATE INDEX idx_tasks_assignee ON tasks(assigned_to_id);
CREATE INDEX idx_tasks_status ON tasks(status);
CREATE INDEX idx_tasks_due_date ON tasks(due_date);

-- Asset indexes
CREATE INDEX idx_assets_project ON art_assets(project_id);
CREATE INDEX idx_assets_artist ON art_assets(assigned_artist_id);
CREATE INDEX idx_assets_stage ON art_assets(current_stage);
CREATE INDEX idx_assets_type ON art_assets(asset_type);

-- Bug indexes
CREATE INDEX idx_bugs_project ON bugs(project_id);
CREATE INDEX idx_bugs_assignee ON bugs(assigned_to_id);
CREATE INDEX idx_bugs_status ON bugs(status);
CREATE INDEX idx_bugs_severity ON bugs(severity);

-- Commit indexes
CREATE INDEX idx_commits_repo ON commits(repository_id);
CREATE INDEX idx_commits_author ON commits(author_id);
CREATE INDEX idx_commits_date ON commits(commit_date);

-- Notification indexes
CREATE INDEX idx_notifications_user ON notifications(user_id);
CREATE INDEX idx_notifications_type ON notifications(type);
CREATE INDEX idx_notifications_read ON notifications(is_read);

-- Performance metrics indexes
CREATE INDEX idx_performance_user ON performance_metrics(user_id);
CREATE INDEX idx_performance_project ON performance_metrics(project_id);
CREATE INDEX idx_performance_period ON performance_metrics(period_start, period_end);

-- ====================================
-- Views for Common Queries
-- ====================================

-- Project overview view
CREATE VIEW project_overview AS
SELECT 
    p.id,
    p.name,
    p.status,
    p.start_date,
    p.end_date,
    p.budget,
    u.first_name || ' ' || u.last_name AS producer_name,
    COUNT(DISTINCT s.id) AS sprint_count,
    COUNT(DISTINCT t.id) AS task_count,
    COUNT(DISTINCT CASE WHEN t.status = 'completed' THEN t.id END) AS completed_tasks,
    COUNT(DISTINCT a.id) AS asset_count,
    COUNT(DISTINCT CASE WHEN a.current_stage = 'approved' THEN a.id END) AS approved_assets,
    COUNT(DISTINCT b.id) AS bug_count,
    COUNT(DISTINCT CASE WHEN b.status = 'open' THEN b.id END) AS open_bugs
FROM projects p
LEFT JOIN users u ON p.producer_id = u.id
LEFT JOIN sprints s ON p.id = s.project_id
LEFT JOIN tasks t ON p.id = t.project_id
LEFT JOIN art_assets a ON p.id = a.project_id
LEFT JOIN bugs b ON p.id = b.project_id
GROUP BY p.id, u.first_name, u.last_name;

-- User workload view
CREATE VIEW user_workload AS
SELECT 
    u.id,
    u.first_name || ' ' || u.last_name AS full_name,
    u.department,
    COUNT(DISTINCT t.id) AS assigned_tasks,
    COUNT(DISTINCT CASE WHEN t.status = 'in_progress' THEN t.id END) AS active_tasks,
    COUNT(DISTINCT a.id) AS assigned_assets,
    COUNT(DISTINCT CASE WHEN a.current_stage NOT IN ('approved', 'rejected') THEN a.id END) AS active_assets,
    COUNT(DISTINCT b.id) AS assigned_bugs,
    SUM(t.estimated_hours) AS total_estimated_hours,
    SUM(t.actual_hours) AS total_actual_hours
FROM users u
LEFT JOIN tasks t ON u.id = t.assigned_to_id AND t.status NOT IN ('completed', 'cancelled')
LEFT JOIN art_assets a ON u.id = a.assigned_artist_id AND a.current_stage NOT IN ('approved', 'rejected')
LEFT JOIN bugs b ON u.id = b.assigned_to_id AND b.status NOT IN ('closed', 'resolved')
GROUP BY u.id, u.first_name, u.last_name, u.department;

-- ====================================
-- Triggers for Automation
-- ====================================

-- Function to update timestamps
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Apply timestamp trigger to relevant tables
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_projects_updated_at BEFORE UPDATE ON projects FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_sprints_updated_at BEFORE UPDATE ON sprints FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_tasks_updated_at BEFORE UPDATE ON tasks FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_art_assets_updated_at BEFORE UPDATE ON art_assets FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_bugs_updated_at BEFORE UPDATE ON bugs FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_cost_entries_updated_at BEFORE UPDATE ON cost_entries FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Function to log asset stage changes
CREATE OR REPLACE FUNCTION log_asset_stage_change()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.current_stage IS DISTINCT FROM NEW.current_stage THEN
        INSERT INTO asset_stage_history (asset_id, previous_stage, new_stage, changed_by_id, notes)
        VALUES (NEW.id, OLD.current_stage, NEW.current_stage, NEW.assigned_artist_id, 'Automatic stage change');
    END IF;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER log_asset_stage_changes AFTER UPDATE ON art_assets FOR EACH ROW EXECUTE FUNCTION log_asset_stage_change();

-- Initial admin user (password should be changed immediately)
INSERT INTO users (username, email, password_hash, first_name, last_name, role, department, is_active)
VALUES ('admin', 'admin@sgpt.local', '$2a$10$N9qo8uLOickgx2ZMRZoMy.yx8R8qzYl1fjY9ZzTX/8N.8G.8qF.8q', 'Admin', 'User', 'admin', 'management', true);

-- Sample data constraints
ALTER TABLE tasks ADD CONSTRAINT chk_story_points CHECK (story_points >= 0);
ALTER TABLE tasks ADD CONSTRAINT chk_estimated_hours CHECK (estimated_hours >= 0);
ALTER TABLE art_assets ADD CONSTRAINT chk_completion_percentage CHECK (completion_percentage >= 0 AND completion_percentage <= 100);
ALTER TABLE performance_metrics ADD CONSTRAINT chk_feedback_score CHECK (feedback_score >= 1 AND feedback_score <= 5);