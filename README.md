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

