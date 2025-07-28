import streamlit as st
import pandas as pd

# Configure the Streamlit page
st.set_page_config(
    page_title="Hello World - Snowflake Streamlit",
    page_icon="👋",
    layout="wide"
)

def main():
    """Main application function"""
    
    # Header section
    st.title("👋 Hello World!")
    st.subheader("Welcome to Snowflake Streamlit")
    
    # Welcome message
    st.markdown("""
    This is a simple hello world application deployed to Snowflake using Git integration.
    
    **Features:**
    - Streamlit web interface
    - Snowflake database connection
    - Real-time data from Snowflake
    """)
    
    # Snowflake connection section
    st.markdown("---")
    st.header("🏔️ Snowflake Connection")
    
    try:
        # Get Snowflake session
        session = st.connection("snowflake").session()
        
        # Display connection status
        st.success("✅ Successfully connected to Snowflake!")
        
        # Get current timestamp and database info
        with st.spinner("Fetching data from Snowflake..."):
            # Query current timestamp and database info
            query = """
            SELECT 
                CURRENT_TIMESTAMP() AS current_time,
                CURRENT_DATABASE() AS current_database,
                CURRENT_SCHEMA() AS current_schema,
                CURRENT_WAREHOUSE() AS current_warehouse,
                CURRENT_USER() AS current_user,
                CURRENT_ROLE() AS current_role
            """
            
            result = session.sql(query).collect()
            
            if result:
                data = result[0]
                
                # Display information in columns
                col1, col2 = st.columns(2)
                
                with col1:
                    st.metric("Current Time", data['CURRENT_TIME'])
                    st.metric("Database", data['CURRENT_DATABASE'])
                    st.metric("Schema", data['CURRENT_SCHEMA'])
                
                with col2:
                    st.metric("Warehouse", data['CURRENT_WAREHOUSE'])
                    st.metric("User", data['CURRENT_USER'])
                    st.metric("Role", data['CURRENT_ROLE'])
                
                # Show raw data
                st.markdown("### 📊 Raw Data")
                st.json({
                    "timestamp": str(data['CURRENT_TIME']),
                    "database": data['CURRENT_DATABASE'],
                    "schema": data['CURRENT_SCHEMA'],
                    "warehouse": data['CURRENT_WAREHOUSE'],
                    "user": data['CURRENT_USER'],
                    "role": data['CURRENT_ROLE']
                })
        
    except Exception as e:
        st.error(f"❌ Failed to connect to Snowflake: {str(e)}")
        st.info("Please ensure your Snowflake connection is properly configured.")
    
    # Footer
    st.markdown("---")
    st.markdown("*Deployed via Git integration to Snowflake* 🚀")

if __name__ == "__main__":
    main() 