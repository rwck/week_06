# Project 01: FMEA - notes as we go

## Initialise a new rails app

`rails new -database=postgresql`

## Get rails environment set up as you want it

### Extra gems for extra niceness

`gem 'bcrypt'` for secure login etc

Gemfile (this can all, i think, go in the development group)

```
gem 'pry-rails'
gem 'pry-stack_explorer'
gem 'annotate'
gem 'quiet_assets'
gem 'better_errors'
gem 'binding_of_caller'
gem 'meta_request'
```


Also for extra convenience

Gemfle (in the development group profile)


```
group :development do
  gem 'guard'
end
```

Then
`$ bundle exec guard init`


Then
`$ bundle exec guard`

And then
```
group :development do
  gem 'guard-livereload', '~> 2.4', require: false
end

```

and then

`$ guard init livereload`

## Generate a scaffold to get started

`rails generate scaffold user firstname lastname email:uniq password:digest firstname lastname picture phone`


## Create a migration for the database

`rails generate migration EditUserTable`

`rake db:migrate`

## Function to convert google drive share link into accessible picture url

```
def link_to_google_image(url)
    string = url.to_s
    string['https://drive.google.com/open?id='] = ''
    string = 'https://drive.google.com/uc?export=download&id=' + string
    string
  end
```

Then inside the create method in the controller, invoke the private method and bang, it gets stored where you want.

```
def create
    @user = User.new(user_params)
    @user["picture"] = link_to_google_image( @user["picture"])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    pp @user
    pp picture_param
    pp link_to_google_image(picture_param["picture"])
  end

```


### Reset CSS

```
/* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

```

# Using SASS & SCSS
## Partials

name the file '\_partial.scss'
then make 'application.css' into 'application.scss'
and do

`@import 'partial.scss'`

You can also do

`@import 'partials/*'`

or

`@import 'partials/**/*'`




## How to use Google fonts in Rails


In applicaition.html.erb

At the top use the `stylesheet_link_tag`

```
<%= stylesheet_link_tag  'https://fonts.googleapis.com/css?family=Raleway:400,600|Bitter:400,700', media: 'all' %>
```

# Model for Project

```
rails generate scaffold project name user:belongs_to
```


# Model for Issue

```
rails generate scaffold issue item function failure effect_of_failure cause_of_failure current_controls recommended_actions probability_estimate:integer severity_estimate:integer detection_indicators:integer detection_dormancy_period:integer risk_level:integer further_investigation user:belongs_to
```


## Command to add 'Problem' reference to existing 'Issue' table

```
rails generate migration AddProblemRefToIssues problem:references
```

## The model for 'Problem'

```
```

## Drop table from database

```
drop_table :issues
```



## Add connection
```
add_reference :issues, :problem, index: true, foreign_key: true
```




## Remove connection
```
add_reference :issues, :problem, index: true, foreign_key: true
```
