
## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :users
- has_many: comments

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :groups,through:groups_users
- has_many :comments
- has_many :groups_users

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|image|text|
|user_id|integer|null: false,foreign_key: true|
|group_id|integer|null:false,foreign_key:true|


### Asociation
- belongs_to :user
- belongs_to :group