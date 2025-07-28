-- Snowflake Hello World Setup Script
-- This script sets up the infrastructure and deploys the Streamlit app from Git

-- Note: The following must be created manually first by a user with appropriate privileges:
-- 1. API Integration for GitHub
-- 2. Git credentials secret
-- See comments below for the required setup commands

/*
-- MANUAL SETUP REQUIRED (run these commands manually with appropriate privileges):

-- 1. Create API Integration for GitHub
CREATE OR REPLACE API INTEGRATION git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/')
  ENABLED = TRUE
  COMMENT = 'API integration for GitHub repositories';

-- 2. Create Git credentials secret (replace with your GitHub username and token)
CREATE OR REPLACE SECRET git_creds
  TYPE = password
  USERNAME = 'your-github-username'
  PASSWORD = 'your-github-personal-access-token'
  COMMENT = 'Git credentials for repository access';
*/

-- Use existing warehouse (CUBE_TESTING from your connection)
USE WAREHOUSE CUBE_TESTING;

-- Use existing database (CUBE_TESTING from your connection)
USE DATABASE CUBE_TESTING;

-- Create schema for our app in the existing database
CREATE SCHEMA IF NOT EXISTS HELLO_WORLD_SCHEMA
  COMMENT = 'Schema for Hello World Streamlit app';

USE SCHEMA HELLO_WORLD_SCHEMA;

-- Create Git repository (update the ORIGIN URL with your actual GitHub repository)
CREATE OR REPLACE GIT REPOSITORY hello_world_repo
  API_INTEGRATION = SFC_GH_MAKUKREJA_INTEGRATION
  ORIGIN = 'https://github.com/sfc-gh-makukreja/streamlit-hello-world.git'
  COMMENT = 'Git repository for Hello World Streamlit app';

-- Create stage for the application files
CREATE STAGE IF NOT EXISTS hello_world_stage
  ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE')
  COMMENT = 'Stage for Hello World Streamlit app files';

-- Deploy Streamlit app from Git repository
CREATE OR REPLACE STREAMLIT hello_world_app
  FROM @hello_world_repo/branches/main/
  MAIN_FILE = 'streamlit_app.py'
  QUERY_WAREHOUSE = CUBE_TESTING
  TITLE = 'Hello World - Snowflake Streamlit'
  COMMENT = 'Hello World Streamlit app deployed from Git';


-- Show the created Streamlit app
SHOW STREAMLITS;

-- Display app URL (you'll need to get this from the Snowflake UI)
SELECT 'Streamlit app created successfully! Check Snowflake UI for the app URL.' AS status; 