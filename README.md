# Members Only

This is a simple forum where only signed in users can see the details of fellow members or authors.

## Overview
In this project, authentication has been implemented for members of the forum using the `Devise` ruby gem. The `Member` model is used to create the members of the forum, while the `Post` model is used to create a post which must be linked to a `Member` through it's `member_id` field, a post object also has `title` and `body` fields.

This is the simple representation of the Association between the `Member` and `Post` models
```
class Member < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :posts
end

class Post < ApplicationRecord
  belongs_to :member
end

```

## Live Demo
Checkout the live demo at [Live](https://clubsville.herokuapp.com/)

## Built With
- Rails
- Bootstrap 5
- HTML
- CSS (SCSS)
- Database (SQLite3)


## Getting Started
To run the project in your local machine follow this step by step instruction:
1. Open your terminal and run `git clone git@github.com:cyonii/members-only.git`
2. Once the repo is cloned, navigate into it's directory with `cd members-only`
3. Run `bundle install` to install dependencies
4. Run `yarn install`
5. Run `rails db:migrate`
6. After your run the previous operations, run `rails server`

## Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](../../issues).

## Show your support

Give a ⭐️ if you like this project!

## Authors

👤 **CY Kalu**

- GitHub: [@cyonii](https://github.com/cyonii)
- Twitter: [@theOnuoha](https://twitter.com/theOnuoha)
