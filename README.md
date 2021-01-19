## usersテーブル

| Column    | Type       | Options                    |
| --------- | ---------- | -------------------------- |
| email     | string     | null:false                 |
| password  | string     | null:false                 |
| name      | string     | null:false                 |
| profile   | text       | null:false                 |
| occupation| text       | null:false                 |
| position  | text       | null:false                 |

### Association
- has_many :prototypes


## prototypesテーブル

| Column    | Type       | Options                    |
| --------- | ---------- | -------------------------- |
| title     | string     | null:false                 |
| catch_copy| text       | null:false                 |
| concept   | text       | null:false                 |
| user      | references |                            |


### Association
- belongs_to :users
- has_many :users, through: comments

## commentsテーブル

| Column    | Type       | Options                    |
| --------- | ---------- | -------------------------- |
| text      | text       | null:false                 |
| user      | references |                            |
| prototype | references |                            |

### Association
- belongs_to :prototypes
- belongs_to :users
