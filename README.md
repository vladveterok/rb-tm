# SIMPLE TODO LIST

For Ruby Garage

## Disclaimer
This is the very first project I've ever made. So, let's get this straight: if inexperienced rookies are not in the scope of your educational program, please, PLEASE, under any circumstances do not open this project. It's ugly, it's messed up, it's Frankensteinian, it can kill you. So, for the love of God, for anyone's sake, and for your eyes and sanity, just don't. Otherwise, best of luck to you in this journey.

https://rubydobido.herokuapp.com/

## Requirements

- ruby -- '2.7.0'
- rails -- '~> 6.0.2', '>= 6.0.2.1'
- PostgreSQL -- '>= 0.18', '< 2.0'
- webpacker -- '~> 4.0'

## Installation

To get the initial code please clone your fork of this repo to your machine and execute the following command in your top-level projects directory:

```bash
$ git clone https://github.com/vladveterok/rb-tm.git
```

Once you have the clone of the repo:

1. Change into the actual project directory: ```cd rb-tm ```

2. Run ```bundle install``` to make sure all gems are properly installed.
3. Run

```bash
bundle exec rake db:migrate
```
to apply database migrations.

4. Run ```yarn install``` to install local JavaScript packages. Sadly, it's super important (I guess) to have Webpacker installed properly on your local machine to run bootstrap in this project. If your version of Rails doesn't include Webpacker by default, please, [read](https://github.com/rails/webpacker) how to install Webpacker and local JavaScript packages. I didn't get into Webpacker very well, but people a bit smarter than I say, it's better to read this stuff.

Optional: To fix "unmet peer dependency" warnings,
```bash
yarn upgrade
```


5. Run ```bin/rails s```
6. Go to ```http://localhost:3000/```
7. Enjoy the masterpiece of ugliness, perfection of imperfection, Frankenstein of web development.   

## Tests
To carry out the couple of tests that I actually made run ```bin/rails test test/models```

## What is not done
- It does absolutely NOT look like on referential screen.
- Only silly simple tests are done covering CRUD functionality for existing models. Reall, efficient, like dead-serious tests are not. Sadly. 
- SQL tasks are not implemented as API (and I'm not sure you wanted them as API, but, again, they are not). To see the implementation, check ```count_projects``` method in ```projects_controller.rb``` or simply check out the [SQL-tasks.md](https://github.com/vladveterok/rb-tm/blob/master/SQL-tasks.md). To see the result, use ```sql tasks``` link on the ```/projects``` page.
- SQL task "get all statuses, not repeating, alphabetically ordered" is not done. I just didn't get it for I have only two statuses for my tasks and they are: completed: true and completed: false.

## Known bugs and issues
- **FIXED**. When you want to drag-n-drop a newly created or edited task, it is not responding on the first click on it, only on the next one.
- **FIXED**. External jquery and jquery-ui.
- **FIXED**. JS functions in html.erb.
- **FIXED**. Custom SCSS files linked from layout html.erb.
- **FIXED**. Wrong shade of edited project buttons.
- Forms for editing projects and tasks are too small. I hate it. But css and bootstrap kicked my arse.
- Date_selector for task-deadlines is ugly as f... well, very, very ugly. As ugly...
- ...as sign-in/sign-up pages.
- Application is not tested properly on physical devises, and still, chrome responsive mode shows a slight problem with a page positioning on an iPhone SE sized screen.

Well, that's it, let's call it a day now.
Have a good one! :)
