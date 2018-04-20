# #FreeYourBio

#FreeYourBio is a solution to social media profile bios being cluttered with usernames and links. #FreeYourBio lets you create your own page, with your own links and/or and embedded url, such as a YouTube video. Most social media websites have a spot for a single link, so if you put all your links onto that link...now you have a whole bio to write about yourself.

![homepage](https://i.imgur.com/zQbON56.png)

The home page of the site, check out the site [here](http://freeyourbio.com/).

# Technologies

* Ruby on Rails Full Stack
* Javascript on some of the front end
* Devise for authentication

# Features

* Links use metadata or other means to set the image for you when possible
* Users can embed a url on their page
* Users can change their page settings to update their page title, bio, and the embedded url.
* Admin accounts can edit/delete regular users profiles/links
* Regular user accounts can only modify their own stuff
* Sign up
* Sign in with username or email
* When you sign up your profile is setup with defaults
* Very responsive as it's going to be used often on mobile

# How to run locally

Feel free to look at, get ideas from, or play with my site's code. But please, don't steal it.

To get it running locally is fairly simple just follow these steps:

1.  Fork/Clone down this repo
2.  cd into the app and run `bundle install`
3.  Run `rails db:drop db:create db:migrate db:seed` in terminal
4.  Run `rails s` to start the server
5.  Visit [http://localhost:3000/](http://localhost:3000/) in your browser

# Gotchas I discovered building a full rails app

### Deploying

This is a huge gotcha when using heroku, I'm not sure of other providers. You have to precompile the css before deploying or a lot of it won't work on heroku mainly any @media queries or SASS/SCSS. You should be able to run `rails assets:precompile`, don't forget to git add/commit after that.

By default Uglifier (a JS compressor that comes with rails) does not like ES6, it only runs when you are in the production environment so you won't notice it until you try to deploy. To make it work with ES6, in your config/environments/production.rb, replace
`config.assets.js_compressor = :uglifier` with `config.assets.js_compressor = Uglifier.new(harmony: true)`. Harmony: true is a peaceful thing to say out loud after you spend a 20 minutes trying to figure out why a ' in javascript is breaking your deploy.

### Other Gotchas

The default application html doesn't have a meta tag for the viewport, which causes problems trying to make a responsive site that works well on mobile. You can fix it by adding this to your `<head> </head>` section in application.html.erb:
`<meta name="viewport" content="width=device-width, initial-scale=1.0">`

The rails image tag helper does not work the same as regular html image tags, if you give a rails image tag something that isn't a url it breaks the site. HTML image tags simply display a broken image even if you pass in a string that isn't a url.

Some helpers are more strict than others on adding attributes. For instance `<%= f.select(:site, ['Snapchat', 'YouTube', 'Facebook', 'Twitter', 'Other'], {}, :class => 'form-select') %>` that empty object in the middle is required because it looks for options with select and options for html, as [this answer](https://stackoverflow.com/a/4081944) explains.

ES6 only half works, const and let will cause 'Identifier _variableName_ has already been declared' syntax errors.

# Future plans

* Lots of refactoring the code in the future, especially the CSS.
* Report system
* Admin panel to manage users/reports
* Better profiles, option to use the images or minimalistic icons
* Customize some profile css
* Mobile version of site instead of relying solely on media queries since this will be heavily used on mobile
* Social media feed integrations
* Signup with oauth or phone
* Moving forms out of their own pages, signup will be on its own but signin will be in nav. New link and edit profile will be on the profile page itself, displayed when clicking buttons for them
* Make profile pictures pulled from meta tags automatically update
