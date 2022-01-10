# BLOG APP

This is a simple blog application that has been built using Ruby on Rails. 

Things you may want to cover:

## 1 - Versions
 Ruby:
<pre>ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]</pre>

 Rails:
<pre>Rails 6.1.4.4
</pre>

 Database SQLite3:
<pre>3.31.1 2020-01-27 19:55:54</pre>

## 2 - How can you run this application ?
A: You can run this application on [https://vicente-blogger.herokuapp.com/](https://vicente-blogger.herokuapp.com/) website or by following instructions on the official website [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html).
After installing Ruby on Rails, clone this app, go inside to directory `/blog-app` and run the command into your terminal `rails server` then copy and paste this address to your Browser URL `127.0.0.1:3000`.

## 3 - How is this app structured?
### 3.1 - What models does the application have?
 A: It has an `Article`, `Category`, `ArticlesCategories` and `Users` model. <br/>
    An `Article` can have many `Categories`, and it result, `ArticlesCategories`. <br/>
    An `User` can have many `Articles`. <br/>
    
    
 ## 4 - Explain theirs associations

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
```


An `User` can have many `Articles`. <br/>
```ruby
class User < ApplicationRecord

   has_many :articles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
```
### Done by Vicente Simão <br/>
### vicenteviciii@gmail.com
