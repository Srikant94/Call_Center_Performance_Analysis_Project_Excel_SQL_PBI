-- A. Volume KPI's
-- 1. Total Tickets
select 
	count(distinct (Ticket_ID)) as Total_Tickets
from call_center_dataset_clean ; 

-- 2. Total Handled Tickets
select 
	sum(Handled_Flag) as Total_Handled_Tickets
from call_center_dataset_clean
where Handled_Flag = 1 ;

-- 3. Total Abandoned Tickets
select 
	count(*) - sum(Handled_Flag) as Total_Abandoned_Tickets
from call_center_dataset_clean ;

-- 4. Total Open Tickets 
select 
	count(*) as Total_Open_Tickets
from call_center_dataset_clean
where Status = "Open" ; 

-- 5. Total Pending Tickets 
select 
	count(*) as Total_Pending_Tickets
from call_center_dataset_clean
where Status = "Pending" ; 

-- Total Escalated Tickets
select 
	sum(Escalated_Flag) as Total_Escalated_Tickets
from call_center_dataset_clean
where Handled_Flag = 1 ;

-- Total Reopen Tickets
select 
	sum(Reopened_Flag) as Total_Reopen_Tickets
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- 5. Abandonment Rate %
select
	round((count(*) - sum(Handled_Flag)) * 100.00 / count(*), 2) as Abandonment_Rate_Pct
from call_center_dataset_clean ;

-- 6. Handle Rate %
select 
	sum(case when Handled_Flag = 1 then 1 else 0 end) as Total_Tickets_Handled,
    count(Ticket_ID) as Total_Tickets,
    round(sum(case when Handled_Flag = 1 then 1 else 0 end) * 100.00 / count(Ticket_ID),2) as Handle_Rate_Pct
from call_center_dataset_clean ;		
    
-- B. Operational Efficiency KPI's
-- 1. Average Handle Time (AHT)
select 
	sum(Handle_Time_Minutes) as Total_Handling_Time,
    count(Ticket_ID) as Total_Tickets_Handled,
	round(sum(Handle_Time_Minutes) / count(Ticket_ID), 2) as Average_Handling_Time
from call_center_dataset_clean 
where Handled_Flag = 1 ;
    
-- 2. Average Talk Time
select 
	sum(Talk_Time_Minutes) as Total_Talk_Time,
    count(Ticket_ID) as Total_Tickets_Handled,
    round(sum(Talk_Time_Minutes) / count(Ticket_ID), 2) as Average_Talk_Time
from call_center_dataset_clean
where Handled_Flag = 1 ;

-- 3. Average Hold Time
select 
	sum(Hold_Time_Minutes) as Total_Hold_Time,
    count(Ticket_ID) as Total_Tickets_Handled,
    round(sum(Hold_Time_Minutes) / count(Ticket_ID), 2) as Average_Hold_Time
from call_center_dataset_clean
where Handled_Flag = 1 ;

-- 4. Average ACW Time
select 
	sum(After_Call_Work_Minutes) as Total_ACW_Time,
    count(Ticket_ID) as Total_Tickets_Handled,
    -- round(avg(After_Call_Work_Minutes), 2) as Avg_ACW,
    round(sum(After_Call_Work_Minutes) / count(Ticket_ID), 2) as Average_ACW_Time
from call_center_dataset_clean
where Handled_Flag = 1 ;

-- 5. Average Wait Time 
select 	
	round(avg(Wait_Time_Seconds), 2) as Average_Wait_Time
from call_center_dataset_clean
where Handled_Flag = 1 ;

-- C. SLA & Performance KPI's
-- 1. Total Resolved Tickets
select 
	sum(Resolved_Flag) as Total_Resolved_Tickets
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- Total SLA Resolved Tickets
select 
	sum(Resolved_Within_SLA) as Total_Resolved_Tickets
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- 2. Total FCR Tickets
select 
	sum(First_Contact_Resolved) as Total_FCR_Tickets
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- 2. Resolution Rate %
select 
	sum(Resolved_Flag) as Total_Resolved_Tickets,
    count(Ticket_ID) as Total_Tickets,
    round(sum(Resolved_Flag) * 100.00 / count(Ticket_ID), 2) as Resolution_Rate_Pct
from call_center_dataset_clean 
where Handled_Flag = 1;

-- SLA Resolution Rate %
select 
	sum(Resolved_Within_SLA) as Total_Resolved_Tickets,
    count(Ticket_ID) as Total_Tickets,
    round(sum(Resolved_Within_SLA) * 100.00 / count(Ticket_ID), 2) as Resolution_Rate_Pct
from call_center_dataset_clean 
where Handled_Flag = 1;

-- 3. First Contact Resolution %
select 
	sum(First_Contact_Resolved) as Total_First_Contact_Resolved_Tickets,
    count(Ticket_ID) as Total_Tickets,
    round(sum(First_Contact_Resolved) * 100.00 / count(Ticket_ID), 2) as First_Contact_Resolution_Pct
from call_center_dataset_clean
where Handled_Flag = 1 ; 

-- 4. Escalation Rate %
select 
	sum(Escalated_Flag) as Total_Escalated_Tickets,
    count(Ticket_ID) as Total_Tickets,
    round(sum(Escalated_Flag) * 100.00 / count(Ticket_ID), 2) as Escalation_Rate_Pct
from call_center_dataset_clean
where Handled_Flag =1  ; 

-- 5. Reopen Rate %
select 
	sum(Reopened_Flag) as Total_Reopened_Tickets,
    count(Ticket_ID) as Total_Tickets,
    round(sum(Reopened_Flag) * 100.00 / count(Ticket_ID), 2) as Reopened_Rate_Pct
from call_center_dataset_clean 
where Handled_Flag =1 ; 

-- D. Customer Experience KPI's
-- 1. Total Quality Responses
select 
	count(CSAT_Score) as Total_Quality_Responses
from call_center_dataset_clean
where Handled_Flag = 1 ;

-- 1. Average Quality
select 
	round(avg(CSAT_Score), 2) as Average_Quality
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- Total CSAT
select
	sum(case when CSAT_Score >= 4 then 1 else 0 end) as Total_CSAT
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- DSAT
select
	sum(case when CSAT_Score <= 3 then 1 else 0 end) as Total_Negative_CSAT
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- 2. CSAT %
select
	sum(case when CSAT_Score >= 4 then 1 else 0 end) as Total_Positive_CSAT,
    count(CSAT_Score) as Total_CSAT,
    round(sum(case when CSAT_Score >= 4 then 1 else 0 end) * 100.00 / count(CSAT_Score), 2) as CSAT_Pct
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- 3. DSAT %
select
	sum(case when CSAT_Score <= 3 then 1 else 0 end) as Total_Negative_CSAT,
    count(CSAT_Score) as Total_CSAT,
    round(sum(case when CSAT_Score <= 3 then 1 else 0 end) * 100.00 / count(CSAT_Score), 2) as CSAT_Pct
from call_center_dataset_clean 
where Handled_Flag = 1 ;  

-- 1. Total Effort Responses
select 
	count(CES_Score) as Total_Effort_Responses
from call_center_dataset_clean
where Handled_Flag = 1 ;

-- 3. Average CES
select 
	round(avg(CES_Score), 2) as Average_CES_Score
from call_center_dataset_clean ; 

-- E. Agent Productivity KPI's
-- 1. Total Agents
select
	count(distinct(Agent_ID)) as Total_Agents
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- 2. Average Tickets Handled per Agent
select
	count(Ticket_ID) as Total_Handled_Tickets,
    count(distinct(Agent_ID)) as Total_Agents,
    round(count(Ticket_ID) / count(distinct(Agent_ID)), 2) as Average_Ticket_Handled_Per_Agent
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- 2. Average Tickets Resolved per Agent
select
	sum(case when Resolved_Flag = 1 then 1 else 0 end) as Total_Resolved_Tickets,
    count(distinct(Agent_ID)) as Total_Agents,
    round(sum(case when Resolved_Flag = 1 then 1 else 0 end) / count(distinct(Agent_ID)), 2) as Average_Ticket_Resolved_Per_Agent
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- 2. Average SLA Resolved Tickets per Agent
select
	sum(case when Resolved_Within_SLA = 1 then 1 else 0 end) as Total_Resolved_Tickets,
    count(distinct(Agent_ID)) as Total_Agents,
    round(sum(case when Resolved_Within_SLA = 1 then 1 else 0 end) / count(distinct(Agent_ID)), 2) as Average_Ticket_Resolved_Per_Agent
from call_center_dataset_clean 
where Handled_Flag = 1 ;

-- 3. Tickets per Agent
select 
	Agent_Name,
    count(Ticket_ID) as Total_Tickets
from call_center_dataset_clean
where Handled_Flag = 1
group by Agent_Name
order by Total_Tickets desc ; 

-- 4. Agent AHT
select
	Agent_Name,
    round(avg(Handle_Time_Minutes), 2) as Average_Handling_Time
from call_center_dataset_clean
where Handled_Flag = 1
group by Agent_Name
order by Average_Handling_Time desc ;

-- 5 Average Queue Time 
select 
	round(avg(Queue_Time_Minutes), 2) as Average_Queue_Time
from call_center_dataset_clean ; 

-- Average Speed Of Answering
select
	round(avg(Wait_Time_Seconds), 2) as Average_Speed_Of_Answering
from call_center_dataset_clean
where Handled_Flag = 1 and
	  Channel = "Voice" ;

-- Channel Performance
select
	Channel,
    count(Ticket_ID) as Total_Tickets,
    sum(Handled_Flag) as Total_Tickets_Handled,
    round(avg(Handle_Time_Minutes), 2) as Average_Handling_Time,
    round(avg(CSAT_Score), 2) as Average_CSAT_Score
from call_center_dataset_clean
where Handled_Flag = 1
group by Channel ; 

-- Priority Analysis
select 
	Priority,
    count(Ticket_ID) as Total_Tickets,
    round(avg(Handle_Time_Minutes), 2) as Average_Handling_Time,
    round(avg(CSAT_Score), 2) as Average_CSAT_Score
from call_center_dataset_clean
where Handled_Flag = 1
group by priority ; 

-- Team Performance
select 
	Team,
    count(Ticket_ID) as Total_Tickets,
    sum(Handled_Flag) as Total_Tickets_Handled,
    round(avg(Handle_Time_Minutes), 2) as Average_Handling_Time,
    round(avg(CSAT_Score), 2) as Average_CSAT_Score
from call_center_dataset_clean
where Handled_Flag = 1
group by Team ; 


-- Creating a View 
create or replace view `call_center_view` as
select
	*,
    round(timestampdiff( second, Created_At, First_Response_At) / 60, 2) as First_Response_Time_Minutes,
    round(timestampdiff( second, Created_At, Resolved_At) / 60, 2) as Resolution_Time_Minutes,
    case 
		when Channel = "Voice" and
        Wait_Time_Seconds <= 20 and
        Handled_Flag = 1
	then 1
		when Channel = "Chat" and
        timestampdiff( second, Created_At, First_Response_At) / 60 <= 1 and
        Handled_Flag = 1
	then 1
		when Channel = "Email" and
        timestampdiff( second, Created_At, Resolved_At) / 60 <= 1440 and
        Handled_Flag = 1
	then 1
    else 0
    end as Final_Service_Level_Flag
from call_center_dataset_clean ;

-- Validating view
select
	Channel,
	Created_At,
    First_Response_At,
    Resolved_At,
    First_Response_Time_Minutes,
    Resolution_Time_Minutes,
    Wait_Time_Seconds,
    Final_Service_Level_Flag
from call_center_view ; 


