with remote_job_skills as(
SELECT 
    skill_id ,
    count(*) as skill_count
    FROM 
        skills_job_dim As skills_to_job
INNER JOIN 
    job_postings_fact as job_postings 
    on job_postings.job_id = skills_to_job.job_id
where
    job_postings.job_work_from_home = True
    and 
    job_postings.job_title_short = 'Data Analyst'
group by 
    skill_id    
)
SELECT *
FROM remote_job_skills
inner join skills_dim as skills on skills.skill_id = remote_job_skills.skill_id
order BY
    skill_count DESC
LIMIT 5;    