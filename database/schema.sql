-- Smart Game Production Tracker (SGPT) Database Schema
-- PostgreSQL Database Schema for Unity-based game studios

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =============================================
-- CORE TABLES
-- =============================================

-- Users and Authentication
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'producer', 'team_lead', 'artist', 'designer', 'developer', 'qa', 'freelancer')),
    department VARCHAR(50) NOT NULL CHECK (department IN ('art', 'design', 'ui_ux', 'frontend', 'backend', 'qa', 'production')),
    hourly_rate DECIMAL(10,2),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Teams
CREATE TABLE teams (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    lead_id UUID REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Team Members
CREATE TABLE team_members (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    team_id UUID REFERENCES teams(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(team_id, user_id)
);

-- Projects
CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    target_release_date DATE,
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('planning', 'active', 'on_hold', 'completed', 'cancelled')),
    budget DECIMAL(15,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sprints
CREATE TABLE sprints (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'planned' CHECK (status IN ('planned', 'active', 'completed', 'cancelled')),
    velocity_target INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- ART ASSET PIPELINE
-- =============================================

-- Asset Types
CREATE TABLE asset_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    estimated_hours DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Asset Categories
CREATE TABLE asset_categories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Assets
CREATE TABLE assets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    sprint_id UUID REFERENCES sprints(id),
    name VARCHAR(200) NOT NULL,
    description TEXT,
    asset_type_id UUID REFERENCES asset_types(id),
    asset_category_id UUID REFERENCES asset_categories(id),
    assigned_artist_id UUID REFERENCES users(id),
    reviewer_id UUID REFERENCES users(id),
    priority VARCHAR(20) DEFAULT 'medium' CHECK (priority IN ('low', 'medium', 'high', 'critical')),
    status VARCHAR(20) DEFAULT 'concept' CHECK (status IN ('concept', 'modeling', 'texturing', 'rigging', 'animation', 'qa', 'approved', 'rejected')),
    estimated_hours DECIMAL(5,2),
    actual_hours DECIMAL(5,2),
    estimated_cost DECIMAL(10,2),
    actual_cost DECIMAL(10,2),
    due_date DATE,
    completed_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Asset Files
CREATE TABLE asset_files (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    asset_id UUID REFERENCES assets(id) ON DELETE CASCADE,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    file_size BIGINT,
    file_type VARCHAR(50),
    version VARCHAR(20),
    uploaded_by UUID REFERENCES users(id),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Asset Feedback
CREATE TABLE asset_feedback (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    asset_id UUID REFERENCES assets(id) ON DELETE CASCADE,
    reviewer_id UUID REFERENCES users(id),
    feedback_text TEXT NOT NULL,
    feedback_type VARCHAR(20) DEFAULT 'general' CHECK (feedback_type IN ('general', 'technical', 'artistic', 'approval')),
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'addressed', 'resolved')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP
);

-- =============================================
-- GAME DESIGN MODULE
-- =============================================

-- Design Tasks
CREATE TABLE design_tasks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    sprint_id UUID REFERENCES sprints(id),
    title VARCHAR(200) NOT NULL,
    description TEXT,
    assigned_designer_id UUID REFERENCES users(id),
    reviewer_id UUID REFERENCES users(id),
    priority VARCHAR(20) DEFAULT 'medium',
    status VARCHAR(20) DEFAULT 'todo' CHECK (status IN ('todo', 'in_progress', 'review', 'approved', 'completed')),
    estimated_hours DECIMAL(5,2),
    actual_hours DECIMAL(5,2),
    due_date DATE,
    completed_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Design Documents
CREATE TABLE design_documents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    design_task_id UUID REFERENCES design_tasks(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    document_type VARCHAR(50) CHECK (document_type IN ('mechanic', 'balance', 'level', 'system', 'narrative')),
    version VARCHAR(20),
    created_by UUID REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- UI/UX WORKFLOW
-- =============================================

-- UI Components
CREATE TABLE ui_components (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    sprint_id UUID REFERENCES sprints(id),
    name VARCHAR(200) NOT NULL,
    description TEXT,
    component_type VARCHAR(50) CHECK (component_type IN ('screen', 'modal', 'button', 'input', 'navigation', 'overlay')),
    assigned_designer_id UUID REFERENCES users(id),
    assigned_developer_id UUID REFERENCES users(id),
    priority VARCHAR(20) DEFAULT 'medium',
    status VARCHAR(20) DEFAULT 'wireframe' CHECK (status IN ('wireframe', 'mockup', 'prototype', 'implementation', 'testing', 'approved')),
    estimated_hours DECIMAL(5,2),
    actual_hours DECIMAL(5,2),
    due_date DATE,
    completed_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- UI Files
CREATE TABLE ui_files (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    ui_component_id UUID REFERENCES ui_components(id) ON DELETE CASCADE,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    file_type VARCHAR(50),
    version VARCHAR(20),
    uploaded_by UUID REFERENCES users(id),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- FRONTEND (UNITY + PLASTIC SCM)
-- =============================================

-- Unity Modules
CREATE TABLE unity_modules (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    sprint_id UUID REFERENCES sprints(id),
    name VARCHAR(200) NOT NULL,
    description TEXT,
    module_type VARCHAR(50) CHECK (module_type IN ('feature', 'system', 'ui', 'audio', 'vfx', 'optimization')),
    assigned_developer_id UUID REFERENCES users(id),
    reviewer_id UUID REFERENCES users(id),
    priority VARCHAR(20) DEFAULT 'medium',
    status VARCHAR(20) DEFAULT 'planned' CHECK (status IN ('planned', 'in_progress', 'review', 'testing', 'completed')),
    estimated_hours DECIMAL(5,2),
    actual_hours DECIMAL(5,2),
    due_date DATE,
    completed_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Plastic SCM Changesets
CREATE TABLE plastic_changesets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    unity_module_id UUID REFERENCES unity_modules(id) ON DELETE CASCADE,
    changeset_id VARCHAR(100) NOT NULL,
    branch_name VARCHAR(100),
    commit_message TEXT,
    author_id UUID REFERENCES users(id),
    created_at TIMESTAMP,
    merged_at TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'reviewed', 'merged', 'rejected'))
);

-- Unity Performance Metrics
CREATE TABLE unity_performance_metrics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    unity_module_id UUID REFERENCES unity_modules(id) ON DELETE CASCADE,
    fps_average DECIMAL(5,2),
    memory_usage_mb DECIMAL(10,2),
    build_size_mb DECIMAL(10,2),
    load_time_seconds DECIMAL(5,2),
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- BACKEND (JAVA SPRING BOOT + GITHUB)
-- =============================================

-- Backend Modules
CREATE TABLE backend_modules (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    sprint_id UUID REFERENCES sprints(id),
    name VARCHAR(200) NOT NULL,
    description TEXT,
    module_type VARCHAR(50) CHECK (module_type IN ('api', 'service', 'database', 'integration', 'deployment')),
    assigned_developer_id UUID REFERENCES users(id),
    reviewer_id UUID REFERENCES users(id),
    priority VARCHAR(20) DEFAULT 'medium',
    status VARCHAR(20) DEFAULT 'planned' CHECK (status IN ('planned', 'in_progress', 'review', 'testing', 'deployed')),
    estimated_hours DECIMAL(5,2),
    actual_hours DECIMAL(5,2),
    due_date DATE,
    completed_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- GitHub Integration
CREATE TABLE github_integrations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    backend_module_id UUID REFERENCES backend_modules(id) ON DELETE CASCADE,
    repository_name VARCHAR(200) NOT NULL,
    branch_name VARCHAR(100),
    pull_request_number INTEGER,
    issue_number INTEGER,
    commit_sha VARCHAR(40),
    title VARCHAR(500),
    description TEXT,
    status VARCHAR(20) DEFAULT 'open' CHECK (status IN ('open', 'reviewed', 'merged', 'closed')),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    merged_at TIMESTAMP
);

-- API Endpoints
CREATE TABLE api_endpoints (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    backend_module_id UUID REFERENCES backend_modules(id) ON DELETE CASCADE,
    endpoint_path VARCHAR(500) NOT NULL,
    http_method VARCHAR(10) NOT NULL,
    description TEXT,
    version VARCHAR(20),
    status VARCHAR(20) DEFAULT 'development' CHECK (status IN ('development', 'testing', 'production', 'deprecated')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- QA AND BUG TRACKING
-- =============================================

-- Bugs
CREATE TABLE bugs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    bug_type VARCHAR(50) CHECK (bug_type IN ('art', 'ui', 'frontend', 'backend', 'design', 'performance', 'crash')),
    priority VARCHAR(20) DEFAULT 'medium' CHECK (priority IN ('low', 'medium', 'high', 'critical')),
    severity VARCHAR(20) DEFAULT 'medium' CHECK (severity IN ('low', 'medium', 'high', 'critical')),
    status VARCHAR(20) DEFAULT 'open' CHECK (status IN ('open', 'assigned', 'in_progress', 'testing', 'resolved', 'closed')),
    assigned_to UUID REFERENCES users(id),
    reported_by UUID REFERENCES users(id),
    linked_asset_id UUID REFERENCES assets(id),
    linked_ui_component_id UUID REFERENCES ui_components(id),
    linked_unity_module_id UUID REFERENCES unity_modules(id),
    linked_backend_module_id UUID REFERENCES backend_modules(id),
    estimated_fix_hours DECIMAL(5,2),
    actual_fix_hours DECIMAL(5,2),
    due_date DATE,
    resolved_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bug Comments
CREATE TABLE bug_comments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    bug_id UUID REFERENCES bugs(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id),
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Test Cases
CREATE TABLE test_cases (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    test_type VARCHAR(50) CHECK (test_type IN ('unit', 'integration', 'ui', 'performance', 'regression')),
    assigned_tester_id UUID REFERENCES users(id),
    status VARCHAR(20) DEFAULT 'draft' CHECK (status IN ('draft', 'ready', 'in_progress', 'passed', 'failed')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- FINANCE & ESTIMATION
-- =============================================

-- Rate Cards
CREATE TABLE rate_cards (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id),
    role VARCHAR(50) NOT NULL,
    hourly_rate DECIMAL(10,2) NOT NULL,
    effective_date DATE NOT NULL,
    end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Cost Tracking
CREATE TABLE cost_tracking (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    asset_id UUID REFERENCES assets(id),
    design_task_id UUID REFERENCES design_tasks(id),
    ui_component_id UUID REFERENCES ui_components(id),
    unity_module_id UUID REFERENCES unity_modules(id),
    backend_module_id UUID REFERENCES backend_modules(id),
    bug_id UUID REFERENCES bugs(id),
    cost_type VARCHAR(50) CHECK (cost_type IN ('labor', 'materials', 'software', 'hardware', 'external')),
    amount DECIMAL(10,2) NOT NULL,
    description TEXT,
    date_incurred DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payment Milestones
CREATE TABLE payment_milestones (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id),
    milestone_name VARCHAR(200) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'paid')),
    paid_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- PERFORMANCE & REVIEW ENGINE
-- =============================================

-- Performance Reviews
CREATE TABLE performance_reviews (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id),
    reviewer_id UUID REFERENCES users(id),
    review_period_start DATE NOT NULL,
    review_period_end DATE NOT NULL,
    overall_rating INTEGER CHECK (overall_rating >= 1 AND overall_rating <= 5),
    quality_score DECIMAL(3,2),
    productivity_score DECIMAL(3,2),
    collaboration_score DECIMAL(3,2),
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Effort Tracking
CREATE TABLE effort_tracking (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    date DATE NOT NULL,
    hours_worked DECIMAL(5,2) NOT NULL,
    task_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- NOTIFICATION & DELAY ENGINE
-- =============================================

-- Notifications
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id),
    notification_type VARCHAR(50) CHECK (notification_type IN ('delay', 'review', 'deadline', 'blocker', 'milestone')),
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    related_entity_type VARCHAR(50),
    related_entity_id UUID,
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Alert Rules
CREATE TABLE alert_rules (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    rule_name VARCHAR(200) NOT NULL,
    rule_type VARCHAR(50) CHECK (rule_type IN ('delay', 'inactivity', 'review', 'budget')),
    conditions JSONB NOT NULL,
    notification_channels JSONB,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- AI MODULES
-- =============================================

-- AI Summaries
CREATE TABLE ai_summaries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL,
    entity_id UUID NOT NULL,
    summary_type VARCHAR(50) CHECK (summary_type IN ('daily', 'weekly', 'sprint', 'project')),
    summary_content TEXT NOT NULL,
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Delay Predictions
CREATE TABLE delay_predictions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL,
    entity_id UUID NOT NULL,
    predicted_delay_days INTEGER,
    confidence_score DECIMAL(3,2),
    factors JSONB,
    predicted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- INDEXES FOR PERFORMANCE
-- =============================================

-- User indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_users_department ON users(department);

-- Asset indexes
CREATE INDEX idx_assets_project_id ON assets(project_id);
CREATE INDEX idx_assets_status ON assets(status);
CREATE INDEX idx_assets_assigned_artist_id ON assets(assigned_artist_id);
CREATE INDEX idx_assets_due_date ON assets(due_date);

-- Task indexes
CREATE INDEX idx_design_tasks_project_id ON design_tasks(project_id);
CREATE INDEX idx_design_tasks_status ON design_tasks(status);
CREATE INDEX idx_ui_components_project_id ON ui_components(project_id);
CREATE INDEX idx_ui_components_status ON ui_components(status);
CREATE INDEX idx_unity_modules_project_id ON unity_modules(project_id);
CREATE INDEX idx_backend_modules_project_id ON backend_modules(project_id);

-- Bug indexes
CREATE INDEX idx_bugs_project_id ON bugs(project_id);
CREATE INDEX idx_bugs_status ON bugs(status);
CREATE INDEX idx_bugs_priority ON bugs(priority);
CREATE INDEX idx_bugs_assigned_to ON bugs(assigned_to);

-- Performance indexes
CREATE INDEX idx_effort_tracking_user_id ON effort_tracking(user_id);
CREATE INDEX idx_effort_tracking_date ON effort_tracking(date);
CREATE INDEX idx_notifications_user_id ON notifications(user_id);
CREATE INDEX idx_notifications_is_read ON notifications(is_read);

-- =============================================
-- TRIGGERS FOR UPDATED_AT
-- =============================================

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_projects_updated_at BEFORE UPDATE ON projects FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_assets_updated_at BEFORE UPDATE ON assets FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_design_tasks_updated_at BEFORE UPDATE ON design_tasks FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_ui_components_updated_at BEFORE UPDATE ON ui_components FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_unity_modules_updated_at BEFORE UPDATE ON unity_modules FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_backend_modules_updated_at BEFORE UPDATE ON backend_modules FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_bugs_updated_at BEFORE UPDATE ON bugs FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_test_cases_updated_at BEFORE UPDATE ON test_cases FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- =============================================
-- SAMPLE DATA INSERTION
-- =============================================

-- Insert sample asset types
INSERT INTO asset_types (name, description, estimated_hours) VALUES
('Character Model', '3D character model with textures', 40.0),
('Environment Prop', 'Environmental object or decoration', 8.0),
('UI Element', 'User interface graphic element', 4.0),
('VFX Asset', 'Visual effects particle system or animation', 12.0),
('Audio Asset', 'Sound effect or music track', 6.0);

-- Insert sample asset categories
INSERT INTO asset_categories (name, description) VALUES
('Characters', 'Player characters, NPCs, enemies'),
('Environments', 'Levels, buildings, landscapes'),
('UI/UX', 'Interface elements, menus, HUD'),
('VFX', 'Particle effects, animations'),
('Props', 'Interactive and decorative objects');

-- Insert sample users
INSERT INTO users (username, email, password_hash, first_name, last_name, role, department, hourly_rate) VALUES
('admin', 'admin@sgpt.com', '$2a$10$hash', 'Admin', 'User', 'admin', 'production', 0.00),
('producer1', 'producer@sgpt.com', '$2a$10$hash', 'John', 'Producer', 'producer', 'production', 0.00),
('artist1', 'artist@sgpt.com', '$2a$10$hash', 'Alice', 'Artist', 'artist', 'art', 45.00),
('designer1', 'designer@sgpt.com', '$2a$10$hash', 'Bob', 'Designer', 'designer', 'design', 50.00),
('developer1', 'dev@sgpt.com', '$2a$10$hash', 'Carol', 'Developer', 'developer', 'frontend', 55.00);