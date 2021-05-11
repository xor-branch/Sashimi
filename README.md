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

<code> $ heroku stack:set heroku-18 </code>
<code>  $ heroku stack </code>
<code> $ rm Gemfile.lock </code>
<code> gem install bundler -v 2.2.11  </code>
<code> bundle exec bundle -v  </code>
<code> $ bundler _2.2.11_ install  </code>
<code> $ bundle lock --add-platform x86_64-linux  </code>
<code> $ git add .  </code>
<code> $ git commit -m 'Add platform'  </code>
<code> $ git push heroku master  </code>

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
