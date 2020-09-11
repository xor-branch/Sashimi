# App schema
### Model : Task
"Task.new(task_name:string task_details:text task_statut:string task_priority:string)"

belongs_to:user
has_many:labels

| Colums | Description |
| --- | ----------- |
| task_name | string |
| task_detail | string |
| task_statut | string |
| task_priority | string |

### Model User
"User.new(name:string email:string password_digest:string image:text)"
has_many:tasks
| Colums | Description |
| --- | ----------- |
| name | string |
| email | string |
| image | text |
| password_digest | string |

### Model label
"Label.new(label_name:string)"
has_many:tasks
| Colums | Description |
| --- | ----------- |
| name | string |

# Heroku deployement 
"loggin to heroku"
<code> $ heroku login</code>

"conmpile the assets of projet, verify to be in the projet repositoring"
<code>$ rails assets:precompile RAILS_ENV=production</code>

"push the projet in github, verify the repositoring exist on github"
<code> $ git add -A</code>
<code> $ git commit -m "projet commit"</code>

"create the application on heroku"
<code>$ heroku create
  
"Add Heroku build pack"
<code>$ heroku buildpacks:set heroku/ruby</code>
<code> $ heroku buildpacks:add --index 1 heroku/nodejs</code>

"deply to heroku"
<code>$ git push heroku master </code>

"Migrate database"
<code>$ heroku run rails db:migrate </code>
