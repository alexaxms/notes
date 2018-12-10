# Notes

Simple note app for reminders

Live demo: ![favicon-16x16](https://github.com/heroku/favicon/raw/master/favicon.iconset/icon_16x16.png) https://amznotescmmtest.herokuapp.com/



## Getting Started

If you want to copy and customize the app with changes that are only useful for your own project, you can clone the GitHub repo. You’ll need to search-and-replace the project name throughout the application. You probably should generate the app instead (see below). To clone:
```
$ git clone git@github.com:alexaxms/notes.git
```
You’ll need git on your machine.

### Prerequisites

To run this app you need to have already installed in your machine:

```
- Ruby 2.5.1
- Rails 5.2.2
- Postgresql 9+
```

### Installing

Run the bundle install command to install the required gems on your computer:
```
$ bundle install
```
You can check which gems are installed on your computer with:
```
$ gem list
```
Keep in mind that you have installed these gems locally. When you deploy the app to another server, the same gems (and versions) must be available.

### Set the Database
If you’ve cloned the repo, prepare the database by running the commands:
```
rails db:create
rails db:migrate 
```

## Using the app

The notes change their background color depending on the time remaining: 

![#F08080](https://placehold.it/15/F08080/000000?text=+) Less than 1 hour to start

![#90EE90](https://placehold.it/15/90EE90/000000?text=+) More than 1 hour and less than 1 day to start

![#87CEFA](https://placehold.it/15/87CEFA/000000?text=+) More than 1 day to start

![#a9a9a9](https://placehold.it/15/a9a9a9/000000?text=+) Finished notes

### Current note

If a note is running in the current time it will be displayed with a ![#ffff7f](https://placehold.it/15/ffff7f/000000?text=+) background
 
## Authors

* **Alex Muñoz** - [alexaxms](https://github.com/alexaxms)

## License

This project is licensed under the MIT License.

