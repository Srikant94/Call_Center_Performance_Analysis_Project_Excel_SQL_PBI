-- Service Level KPI's
-- 1. Service Level %
select
	sum(Final_Service_Level_Flag) as Total_Service_Level_Met,
    sum(Handled_Flag) as Total_Handled_Flag,
    round(sum(Final_Service_Level_Flag) * 100.00 / sum(Handled_Flag), 2) as Service_Level_Pct
from call_center_view 
where Handled_Flag = 1 ; 

-- 2. Resolution SLA %
select 
	sum(Resolved_Within_SLA) as Total_Resolved_Within_SLA,
    count(Handled_Flag) as Total_Handled_Flag,
    round(sum(Resolved_Within_SLA) * 100.00 / sum(Handled_Flag), 2) as Resolution_SLA_Pct
from call_center_view
where handled_flag = 1 ;

-- 3. Service Level % By Channel
select
	Channel,
	sum(Final_Service_Level_Flag) as Total_Service_Level_Met,
    sum(Handled_Flag) as Total_Handled_Flag,
    round(sum(Final_Service_Level_Flag) * 100.00 / sum(Handled_Flag), 2) as Service_Level_Pct
from call_center_view
where handled_flag = 1 
group by Channel 
order by Service_Level_Pct desc ; 

-- 4 Resolution SLA % By Channel
select
	Channel,
	sum(Resolved_Within_SLA) as Total_Resolved_Within_SLA,
    count(Handled_Flag) as Total_Handled_Flag,
    round(sum(Resolved_Within_SLA) * 100.00 / sum(Handled_Flag), 2) as Resolution_SLA_Pct
from call_center_view
where handled_flag = 1 
group by Channel 
order by Resolution_SLA_Pct desc ;

-- Average FRT
select
	round(avg(First_Response_Time_Minutes), 2) as Average_FRT_Minutes
from call_center_view 
where First_Response_At is not null ; 

-- Average FRT By Channel
select 
	Channel,
    round(avg(First_Response_Time_Minutes), 2) as Average_FRT_Minutes
from call_center_view
where First_Response_At is not null 
group by Channel 
order by  Average_FRT_Minutes desc ; 

-- Average Resolution Time
select 
	round(avg(Resolution_Time_Minutes), 2) as Average_Resolution_Time
from call_center_view 
where Resolved_At is not null ; 

-- Average Resolution Time By Channel
select 
	Channel,
    round(avg(Resolution_Time_Minutes), 2) as Average_Resolution_Time
from call_center_view 
where Resolved_At is not null 
group by Channel 
order by Average_Resolution_Time desc ; 

-- SLA Trend
select
	year(created_at) as Year,
    month(created_at) as Month_Number,
    monthname(created_at) as Month_Name,
    week(created_at) as Week,
    sum(Final_Service_Level_Flag) as Total_Service_Level_Met,
    sum(Handled_Flag) as Total_Handled_Flag,
    round(sum(Final_Service_Level_Flag) * 100.00 / sum(Handled_Flag), 2) as Service_Level_Pct
from call_center_view
where handled_flag = 1 
group by Year, Month_Number, Month_Name, Week 
order by Year, Month_Number, Month_Name, Week ; 

-- Resolution SLA Trend
select
	year(created_at) as Year,
    month(created_at) as Month_Number,
    monthname(created_at) as Month_Name,
    week(created_at) as Week,
    sum(Resolved_Within_SLA) as Total_Service_Level_Met,
    sum(Handled_Flag) as Total_Handled_Flag,
    round(sum(Resolved_Within_SLA) * 100.00 / sum(Handled_Flag), 2) as Resolution_Service_Level_Pct
from call_center_view
where handled_flag = 1 
group by Year, Month_Number, Month_Name, Week 
order by Year, Month_Number, Month_Name, Week ; 

-- Average FRT Trend
select
	year(created_at) as Year,
    month(created_at) as Month_Number,
    monthname(created_at) as Month_Name,
    week(created_at) as Week,
	round(avg(First_Response_Time_Minutes), 2) as Average_FRT_Minutes
from call_center_view 
where First_Response_At is not null 
group by Year, Month_Number, Month_Name, Week 
order by Year, Month_Number, Month_Name, Week ;

-- Average Resolution Time Trend
select
	year(created_at) as Year,
    month(created_at) as Month_Number,
    monthname(created_at) as Month_Name,
    week(created_at) as Week,
	round(avg(Resolution_Time_Minutes), 2) as Average_Resolution_Time_Minutes
from call_center_view 
where First_Response_At is not null 
group by Year, Month_Number, Month_Name, Week 
order by Year, Month_Number, Month_Name, Week ;

-- SLA Breached
select
    sum(Final_Service_Level_Flag) as Total_SLA_Met,
    count(Ticket_ID) as Total_Tickets,
    count(Ticket_ID) - sum(Final_Service_Level_Flag) as SLA_Breached_Tickets,
	round((count(Ticket_ID) - sum(Final_Service_Level_Flag)) * 100.00 / count(Ticket_ID), 2) as SLA_Breached_Pct
from call_center_view 
where handled_flag = 1  ; 


-- SLA Breached By Channel
select
	Channel,
    sum(Final_Service_Level_Flag) as Total_SLA_Met,
    count(Ticket_ID) as Total_Tickets,
    count(Ticket_ID) - sum(Final_Service_Level_Flag) as SLA_Breached_Tickets,
	round((count(Ticket_ID) - sum(Final_Service_Level_Flag)) * 100.00 / count(Ticket_ID), 2) as SLA_Breached_Pct
from call_center_view 
where handled_flag = 1
group by Channel 
order by SLA_Breached_Tickets desc ; 
    