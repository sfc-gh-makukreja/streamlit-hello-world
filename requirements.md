# Hello World Streamlit in Snowflake - Requirements

## Project Overview
Create a simple "Hello World" Streamlit application that will be deployed to Snowflake using Git integration for automated deployment.

## Technical Requirements

### Application Features
- **Simple Streamlit Interface**: Display "Hello World" message
- **Basic Snowflake Connection**: Connect to Snowflake database
- **Simple Data Display**: Show current timestamp from Snowflake
- **Minimal UI Elements**: 
  - Title header
  - Welcome message
  - Current database information display

### Infrastructure Requirements

#### Git Repository Setup
- Initialize local Git repository
- Create GitHub repository for version control
- Set up Snowflake Git integration for automated deployment

#### Snowflake Environment Setup
- API Integration for GitHub access
- Git credentials secret management
- Git repository configuration in Snowflake
- Warehouse for compute operations

#### Deployment Architecture
- **Development**: Local testing environment
- **Production**: Streamlit app deployed via Git integration in Snowflake

### File Structure
```
streamlit-hello-world/
├── streamlit_app.py       # Main Streamlit application
├── environment.yml        # Snowflake Anaconda dependencies
├── setup.sql             # Infrastructure setup script
├── deploy.sh             # Deployment orchestration script
└── requirements.md       # This file
```

### Dependencies
- **Streamlit**: For web application framework
- **Snowflake-snowpark-python**: For Snowflake connectivity
- **Pandas**: For basic data handling

### Deployment Process
1. **Local Development**: Code and test the Streamlit app locally
2. **Git Integration**: Push to GitHub repository
3. **Snowflake Setup**: Configure Git integration and API connections
4. **Automated Deployment**: Deploy Streamlit app from Git repository

## Success Criteria
- [ ] Streamlit app displays "Hello World" message
- [ ] App successfully connects to Snowflake database
- [ ] App shows current timestamp from Snowflake
- [ ] Git repository is properly configured
- [ ] App deploys automatically from Git to Snowflake
- [ ] App is accessible via Snowflake Streamlit URL

## Security & Best Practices
- Use Snowflake secrets for Git credentials
- Follow Snowflake naming conventions
- Use API integration for secure Git access
- No hardcoded credentials in code

## Limitations & Scope
- **Simple functionality only**: No complex features or advanced UI
- **Single page application**: No multi-page navigation
- **Basic styling**: Minimal custom CSS or advanced layouts
- **Standard Snowflake warehouse**: No custom compute optimization

This is intentionally kept simple to establish the basic Git-to-Snowflake deployment pipeline before adding more complex features. 