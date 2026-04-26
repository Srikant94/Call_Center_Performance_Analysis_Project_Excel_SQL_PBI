-- Import data in table - call_center_dataset_raw

load data local infile '‪C:/Users/Srikant Verma/Desktop/Data_Analytics/End_To_End_Data_Analytics_Project/Call_Center_Analysis/Raw_CSV_Files/call_center_dummy_dataset.csv'
into table call_center_dataset_raw
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
( 
	Ticket_ID,
    Customer_ID, 
    Channel, 
    Created_At, 
    First_Response_At, 
    Resolved_At, 
    Handled_Flag, 
    Resolved_Flag, 
    Resolved_Within_SLA, 
    First_Contact_Resolved, 
    Escalated_Flag, 
    Reopened_Flag, 
    Repeat_Contact_Flag, 
    CSAT_Score, 
    CES_Score, 
    Queue_Time_Minutes, 
    Handle_Time_Minutes, 
    Talk_Time_Minutes, 
    Hold_Time_Minutes, 
    After_Call_Work_Minutes, 
    Productive_Time_Minutes, 
    Wait_Time_Seconds, 
    Agent_ID, 
    Agent_Name, 
    Status, 
    Team, 
    Shift, 
    Language, 
    Issue_Category, 
    Priority, 
    Customer_Region, 
    Product, 
    Resolution_Code
) ;


show variables like 'local_infile' ;
set global local_infile = 1 ;
show variables like 'local_infile' ;

-- Importing / inserting the dataset in clean table while performing data cleaning from raw dataset
insert into call_center_dataset_clean
select
	trim(Ticket_ID),
    trim(Customer_ID), 
    trim(Channel),
    
    str_to_date(nullif(trim(Created_At),''), '%Y-%m-%d %H:%i:%s'),   
    str_to_date(nullif(trim(First_Response_At),''), '%Y-%m-%d %H:%i:%s'), 
    str_to_date(nullif(trim(Resolved_At),''), '%Y-%m-%d %H:%i:%s'),
    
    -- Yes/No conversion to 1/0 
    case 
		when lower(trim(Handled_Flag)) = 'yes' then 1 
        when lower(trim(Handled_Flag)) = 'no' then 0 
        else Null end, 
    
    case
		when lower(trim(Resolved_Flag)) = 'yes' then 1
        when lower(trim(Resolved_Flag)) = 'no' then 0
        else Null end,
        
    case 
		when lower(trim(Resolved_Within_SLA)) = 'yes' then 1
        when lower(trim(Resolved_Within_SLA)) = 'no' then 0
        else Null end,
        
	case
		when lower(trim(First_Contact_Resolved)) = 'yes' then 1
        when lower(trim(First_Contact_Resolved)) = 'no' then 0
        else Null end,
        
    case
		when lower(trim(Escalated_Flag)) = 'yes' then 1
        when lower(trim(Escalated_Flag)) = 'no' then 0
        else Null end,
        
	case 
		when lower(trim(Reopened_Flag)) = 'yes' then 1
        when lower(trim(Reopened_Flag)) = 'no' then 0
        else Null end,
        
    case
		when lower(trim(Repeat_Contact_Flag)) = 'yes' then 1
        when lower(trim(Repeat_Contact_Flag)) = 'yes' then 0
        else Null end,
    
    -- CSAT/CES cleaning
    case	
		when trim(CSAT_Score) = '' or cast(trim(CSAT_Score) as unsigned) = 0 then Null
        else cast(trim(CSAT_Score) as unsigned)
        end,
        
    case
		when trim(CES_Score) = '' or cast(trim(CES_Score) as unsigned) = 0 then Null
        else cast(trim(CES_Score) as unsigned)
        end,
    
    -- Numeric Fields
    cast(nullif(trim(Queue_Time_Minutes), '') as decimal(10,2)), 
    cast(nullif(trim(Handle_Time_Minutes), '') as decimal(10,2)), 
    cast(nullif(trim(Talk_Time_Minutes), '') as decimal(10,2)),
    cast(nullif(trim(Hold_Time_Minutes), '') as decimal(10,2)),
    cast(nullif(trim(After_Call_Work_Minutes), '') as decimal(10,2)), 
    cast(nullif(trim(Productive_Time_Minutes), '') as decimal(10,2)), 
    
    cast(nullif(trim(Wait_Time_Seconds), '') as unsigned), 
    
    trim(Agent_ID), 
    trim(Agent_Name), 
    trim(Status), 
    trim(Team), 
    trim(Shift), 
    trim(Language), 
    trim(Issue_Category), 
    trim(Priority), 
    trim(Customer_Region), 
    trim(Product), 
    trim(Resolution_Code)
	
from call_center_dataset_raw ; 