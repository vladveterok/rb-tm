# SQL Tasks

### get all statuses, not repeating, alphabetically ordered:
    SELECT DISTINCT tasks.completed FROM tasks ORDER BY tasks.completed ASC;

### get the count of all tasks in each project, order by tasks count descending:
    SELECT name, tasks_count FROM projects ORDER BY projects.tasks_count DESC;

### get the count of all tasks in each project, order by projects names:
    SELECT name, tasks_count FROM projects ORDER BY projects.name;

### get the tasks for all projects having the name beginning with "N" letter:
    SELECT tasks.name FROM tasks, projects WHERE project_id = projects.id AND projects.name ~ '^[nN]';

### get the list of project names having more than 10 tasks in status 'completed'. Order by project_id:
    SELECT projects.name FROM projects JOIN tasks ON tasks.project_id = projects.id WHERE tasks.completed GROUP BY projects.id HAVING COUNT(tasks) > 10 ORDER BY projects.id;
    
### get list of tasks having several exact matches of both name and status, from the project 'Garage'. Order by matches count:
    SELECT tasks.name, tasks.completed, COUNT(*) AS "matches" FROM projects JOIN tasks ON tasks.project_id = projects.id WHERE projects.name = 'Garage' GROUP BY tasks.name, tasks.completed HAVING COUNT(*) > 1 ORDER BY "matches" DESC;

### get the list of tasks with duplicate names. Order alphabetically:
    SELECT * FROM tasks WHERE tasks.name IN(SELECT tasks.name FROM tasks GROUP BY tasks.name HAVING (count(*) > 1)) ORDER BY tasks.name;

### get the list of all projects containing the 'a' letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id = NULL:
    SELECT name, tasks_count FROM projects WHERE name LIKE '%a%';

