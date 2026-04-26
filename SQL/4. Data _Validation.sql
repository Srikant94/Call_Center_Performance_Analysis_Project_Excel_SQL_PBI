SELECT * FROM call_center_data_analysis.call_center_dataset_raw;

-- Validating data in the raw dataset
-- Checking total count of dataset 
select 
	count(*)  
from call_center_dataset_raw ;  # 12000

-- Checking important column null checks
select 
	count(*) as Total_Rows,
	count(*) - count(Ticket_ID) as Missing_Ticket_ID,
    count(*) - count(Channel) as Missing_Channel,
    count(*) - count(Created_at) as Missing_Created_at,
    count(*) - count(Agent_name) as Missing_Agent_name,
    count(*) - count(Status) as Missing_Status,
    count(*) - count(Priority) as Missing_Priority
from call_center_dataset_raw ;

-- Duplicate check on primary key
select 
	ticket_id,
	count(*)
from call_center_dataset_raw
group by ticket_id
having count(*) >  0 ;

-- Distinct value check on col - channel, status, priority check, 
-- Handled_Flag, Resolved_Flag, Resolved_Within_SLA, First_Contact_Resolved, Escalated_Flag, Reopened_Flag, Repeat_Contact_Flag

select 
		distinct ( channel )
from call_center_dataset_raw ;

select 
	distinct ( status )
from call_center_dataset_raw ;

select 
	distinct ( priority )
from call_center_dataset_raw ;

select 
	distinct ( handled_flag )
from call_center_dataset_raw ;

select 
	distinct ( Resolved_Flag )
from call_center_dataset_raw ;

select 
	distinct ( Reopened_Flag )
from call_center_dataset_raw ;

select 
	distinct ( First_Contact_Resolved )
from call_center_dataset_raw ;

select 
	distinct ( Escalated_Flag )
from call_center_dataset_raw ;

select 
	distinct ( Repeat_Contact_Flag )
from call_center_dataset_raw ;

-- checking numeric columns
select *
from call_center_dataset_raw
where 
    Handle_Time_Minutes < 0
    or Talk_Time_Minutes < 0
    or Hold_Time_Minutes < 0
    or Queue_Time_Minutes < 0;
  
-- checking for outliers
select
    max(Handle_Time_Minutes) as max_handle_time,
    min(Handle_Time_Minutes) as min_handle_time,
    round(avg(Handle_Time_Minutes),2 ) as avg_handle_time
from call_center_dataset_raw;

-- checking date columns
select 
	created_at,
    First_Response_At,
    Resolved_At
from call_center_dataset_raw ;

SELECT 
    Created_At,
    STR_TO_DATE(Created_At, '%Y-%m-%d %H:%i:%s') AS Converted_Date
FROM call_center_dataset_raw;

-- checking invalid dates
select 
	created_at
from call_center_dataset_raw
where 
	created_at in ( null , '' )	 ;
    
-- checking date logic - created_at <= first_response_at <= resolved_at
select 
	* 
from call_center_dataset_raw
where 
	Created_At > First_Response_At or 
    First_Response_At > Resolved_At ; # showing values where first_response_aty & resolved_at is null 
-- Validate chronological order only for records where relevant datetime fields are present.
-- Open or unresolved tickets may have NULL / blank First_Response_At or Resolved_At, so those rows should be excluded from sequence validation.

-- checking resolved column logic
select
	*
from call_center_dataset_raw
where 
	Resolved_At = Null and
    status = 'Resolved' ; 
    
-- checking csat column
select 
	distinct ( csat_score )
from call_center_dataset_raw 
order by CSAT_Score ; # zero coming in place of null

select 
	*
from call_center_dataset_raw
where
	CSAT_Score < 1 or
    CSAT_Score > 5 ; # zero coming in place of null
    
select 
	csat_score,
    count(*)
from call_center_dataset_raw
group by csat_score
order by CSAT_Score ;

select 
	sum(case when csat_score between 1 and 5 then 1 else 0 end) as Valid_CSAT,
	sum(case when csat_score is null or csat_score = 0 then 1 else 0 end) as Invalid_CSAT,
    count(*) as Total_Rows
from call_center_dataset_raw ;
-- CSAT_Score shows 0 for some rows because blank values from the CSV were imported into a numeric column as 0 instead of NULL.
-- For analysis, 0 should be treated as missing CSAT and excluded from valid score checks.

--------------------------------------------------------------------------

-- Validating data in the clean dataset
-- Checking total count of dataset
select
	count(*)
from call_center_dataset_clean ;

-- validating flag
select 
	distinct (Handled_Flag) 
from call_center_dataset_clean ;

-- validating csat_score
select 
	distinct(csat_score)
from call_center_dataset_clean 
order by csat_score ;

-- date validation
select 
	Created_At,
    First_Response_At,
    Resolved_At
from call_center_dataset_clean ;

