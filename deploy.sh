#!/bin/bash

# Hello World Streamlit Deployment Script
# This script deploys the Streamlit app to Snowflake using Git integration

set -e  # Exit on any error

echo "🚀 Starting Hello World Streamlit deployment..."
echo "=================================================="

# Check if Snowflake CLI is installed and configured
if ! command -v snow &> /dev/null; then
    echo "❌ Snowflake CLI is not installed or not in PATH"
    echo "Please install it from: https://docs.snowflake.com/en/developer-guide/snowflake-cli/installation/installation"
    exit 1
fi

# Test Snowflake connection
echo "🔍 Testing Snowflake connection..."
if ! snow connection test --connection default; then
    echo "❌ Snowflake connection test failed"
    echo "Please ensure your connection is configured with: snow connection add"
    exit 1
fi

echo "✅ Snowflake connection verified"

# Deploy infrastructure and app
echo "🗄️ Setting up Snowflake infrastructure and deploying app..."
if snow sql -f setup.sql --connection default; then
    echo "✅ Infrastructure setup completed successfully"
else
    echo "❌ Infrastructure setup failed"
    exit 1
fi

echo "=================================================="
echo "🎉 Deployment completed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Go to your Snowflake UI (Snowsight)"
echo "2. Navigate to 'Streamlit' in the left sidebar"
echo "3. Find 'hello_world_app' and click to open"
echo "4. Your Hello World app should be running!"
echo ""
echo "🔗 Note: The app will automatically update when you push changes to the main branch"
echo "==================================================" 