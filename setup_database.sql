-- PostgreSQL Database Setup Script
-- Run this manually in pgAdmin or psql

-- Create database
CREATE DATABASE votingdb;

-- Create user
CREATE USER voting_user WITH PASSWORD 'voting_password';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE votingdb TO voting_user;

-- Connect to votingdb and grant schema privileges
\c votingdb;
GRANT ALL ON SCHEMA public TO voting_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO voting_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO voting_user;