/****** Script for Analysis Nawy dashboard ******/

--cleaning phase with SQL
--some data cleaning  done by this Sql quiry 
update Status_Names 
set category_name = 'No Category'
where  category_name = 'Unkwon'


-- Analysis part
-- the top 15 campaign and how many lead genrated 
select top 15 L.campaign , count(L.id) as leads_count from Leads L
where L.campaign <> '(none)'
group by L.campaign 
order by  2 desc

-- what is the most comunecated channel by customer 
select L.method_of_contact , count(*) as leads_count from leads  L
group by L.method_of_contact 
order by 2 desc

-- when is the best time to lunch a campaign  ##under progrce 
select L.date_of_last_request , count(*) from Leads L
where date_of_last_request between '2000-01-01' and '2017-12-08'
group by L.date_of_last_request 
order by 2 desc

select  L.campaign  ,
rank() over (partition by date_of_last_request order by campaign  desc) as max_date 
from Leads L
where L.campaign <> '(none)'
--where date_of_last_request between '2000-01-01' and '2024-12-08'
group by date_of_last_request, L.campaign , method_of_contact 
order by  method_of_contact asc


select L.campaign, L.date_of_last_request , 
rank() over (partition by campaign order by date_of_last_request ) as leads_counter
from Leads L
where L.campaign <> '(none)'
and L.date_of_last_request  between '2017-01-01' and '2019-12-31'
group by  campaign , date_of_last_request
order by 2 asc


-- how many lead per location 
select L.[location] , count(id)from leads L
group by L.[location] 
order by 2 desc

-- what is the most status did the egent choose it 

select S.[status] , count(*) as catg_count from Leads L left join Status_Names S
on L.status_id = S.id
group by S.[status]
order by 2 desc

-- stored proceduer to find out the most statuse with each agent ID
alter proc Lead_status_tracker (@Agent_ID int) 
as
begin 
if @Agent_ID in (select L.[user_id] from Leads L) 
 select S.[status] ,COUNT(*) as as_count from Leads L left join Status_Names S 
on S.id = L.status_id
left join change_the_status C
on C.lead_id = L.id
where L.[user_id] = @Agent_ID
group by [status] , L.[user_id]
order by 2 desc 
else 
print 'Wrong agent id or not found'
end

exec Lead_status_tracker 81
go


-- the best TTC for the customer need to make it more categorical 
-- if we  sipcfy the time that the customer need to be contacted to it will be more usfull for opreational purpose  

select L.best_time_to_call , COUNT(*) from leads L
group by L.best_time_to_call 
order by 2 desc


-- how many leads handed by agents 
select L.[user_id] ,count(*) from leads L
group by L.[user_id]
order by 2 desc

-- the most agents who change the status on leads 
select S.[user_id], count(new_status_id) as new_status_count from status_change_history S
group by  [user_id] 
order by 2 desc

-- what is the most caes are chnaged and by who 
alter view change_the_status  as 
select S.[user_id],S.lead_id, count(new_status_id) as new_status_count from status_change_history S
group by  [user_id] , S.lead_id
order by 3 desc

select * from change_the_status
where new_status_count >= 6
order by 3 desc




