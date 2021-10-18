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

<code> $ heroku login

"conmpile the assets of projet, verify to be in the projet repositoring"

$ rails assets:precompile RAILS_ENV=production

"push the projet in github, verify the repositoring exist on github"

$ git add -A
$ git commit -m "projet commit"

"create the application on heroku"

$ heroku create
  
"Add Heroku build pack"

$ heroku buildpacks:set heroku/ruby
 $ heroku buildpacks:add --index 1 heroku/nodejs

$ heroku stack:set heroku-18 
 $ heroku stack 
 $ rm Gemfile.lock </code>
 gem install bundler -v 2.2.11  
 bundle exec bundle -v  
 $ bundler _2.2.11_ install  
 $ bundle lock --add-platform x86_64-linux  
$ git add .  </code>
 $ git commit -m 'Add platform' 
 $ git push heroku master  </code>

"deply to heroku"
<code>$ git push heroku master </code>


"Migrate database"
<code>$ heroku run rails db:migrate </code>

##"Pour supprimer la base de données sur heroku, si vous utilisez SHARED_DATABASE_URL :"

<code>$ heroku pg:reset DATABASE_URL</code>

"Maintenant recréer la base de données avec rien en elle:"

<code>$ heroku run rake db:migrate</code>  

"peupler la base de données avec vos données de graine:"

<code>$ heroku run rake db:seed</code>
