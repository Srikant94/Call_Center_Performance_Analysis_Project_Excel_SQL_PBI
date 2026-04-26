-- Creating raw table for testing  

create table call_center_dataset_raw	
( 	
	Ticket_ID varchar(50),
    Customer_ID varchar(50), 
    Channel varchar(50), 
    Created_At varchar(50), 
    First_Response_At varchar(50), 
    Resolved_At varchar(50), 
    Handled_Flag varchar(50), 
    Resolved_Flag varchar(50), 
    Resolved_Within_SLA varchar(50), 
    First_Contact_Resolved varchar(50), 
    Escalated_Flag varchar(50), 
    Reopened_Flag varchar(50), 
    Repeat_Contact_Flag varchar(50), 
    CSAT_Score int, 
    CES_Score int, 
    Queue_Time_Minutes decimal(10,2), 
    Handle_Time_Minutes decimal(10,2), 
    Talk_Time_Minutes decimal(10,2), 
    Hold_Time_Minutes decimal(10,2), 
    After_Call_Work_Minutes decimal(10,2), 
    Productive_Time_Minutes decimal(10,2), 
    Wait_Time_Seconds int, 
    Agent_ID varchar(50), 
    Agent_Name varchar(50), 
    Status varchar(50), 
    Team varchar(50), 
    Shift varchar(50), 
    Language varchar(50), 
    Issue_Category varchar(50), 
    Priority varchar(50), 
    Customer_Region varchar(50), 
    Product varchar(50), 
    Resolution_Code varchar(50)
)  ;

-- Creating clean table for analysis

-- 1. Drop table if already exists
drop table if exists call_center_dataset_clean ;

-- 2. Create table - call_center_dataset_clean

create table call_center_dataset_clean
( 	
	Ticket_ID varchar(50),
    Customer_ID varchar(50), 
    Channel varchar(20),
    
    Created_At datetime, 
    First_Response_At datetime, 
    Resolved_At datetime, 
    
    Handled_Flag tinyint, 
    Resolved_Flag tinyint, 
    Resolved_Within_SLA tinyint, 
    First_Contact_Resolved tinyint, 
    Escalated_Flag tinyint, 
    Reopened_Flag tinyint, 
    Repeat_Contact_Flag tinyint, 
    
    CSAT_Score tinyint, 
    CES_Score tinyint,
    
    Queue_Time_Minutes decimal(10,2), 
    Handle_Time_Minutes decimal(10,2), 
    Talk_Time_Minutes decimal(10,2), 
    Hold_Time_Minutes decimal(10,2), 
    After_Call_Work_Minutes decimal(10,2), 
    Productive_Time_Minutes decimal(10,2), 
    
    Wait_Time_Seconds int, 
    
    Agent_ID varchar(50), 
    Agent_Name varchar(100), 
    Status varchar(50), 
	Team varchar(50), 
    Shift varchar(50), 
    Language varchar(50), 
    Issue_Category varchar(100), 
    Priority varchar(50), 
    Customer_Region varchar(50), 
    Product varchar(100), 
    Resolution_Code varchar(100)
)  ;

 
