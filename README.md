# BLOG APP

This is a simple blog application that has been building using Ruby on Rails.

Things you may want to cover:

## 1 - Versions
 Ruby:
<pre>ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux-gnu]</pre>

 Rails:
<pre>Rails 6.1.4.4
</pre>

 Database SQLite3:
<pre>3.31.1 2020-01-27 19:55:54</pre>

## 2 - How can you run this application ?
A: You can run this application by folowing instuction on official web site [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html).
After install Ruby on Rails, clone this app, go inside to directory `/blog-app` and run the command into your terminal `rails server` then copy and past this address to your Browser URL `127.0.0.1:3000`.

## 3 - How is this app strutured?
### 3.1 - What models does the application has?
 A: It has an `Article`, `Category`, `ArticlesCategories` and `Users` model.
 
## 4 - Explaing theirs associations

An `Article` can have many `Categories`, and it result, `ArticlesCategories`. <br/>
```ruby
 class Article < ApplicationRecord

	belongs_to :user
	has_and_belongs_to_many :categories, join_table: 'articles_categories'

	validates :user_id, presence: true 
	validates :title, presence: true, length:{ minimum: 3}
	validates :description, presence:true, length: { minimum: 10, maximum:200 }
end
```

```ruby
class Category < ApplicationRecord

	has_and_belongs_to_many :articles, join_table: 'articles_categories'

	validates :name, presence: true, uniqueness:true, length:{ minimum: 3, maximum: 30 }
end
```

```ruby
class ArticlesCategory < ApplicationRecord
end
`````````````
An `Article` can have one `User`.

