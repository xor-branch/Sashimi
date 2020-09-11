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
###"loggin to heroku"
[] $ heroku login
###"conmpile the assets of projet, verify to be in the projet repositoring"
[] $ rails assets:precompile RAILS_ENV=production
###"push the projet in github, verify the repositoring exist on github"
[] $ git add -A 
[] $ $ git commit -m "projet commit"
###"create the application on heroku"
[] $ heroku create
###"Add Heroku build pack"
[] $ heroku buildpacks:set heroku/ruby
[] $ heroku buildpacks:add --index 1 heroku/nodejs
###"deply to heroku"
[]$ git push heroku master 
