# Shoe Store

This ruby application is designed to be a place where users can go to look at what stores are carrying specific brands of shoes at their location. There is also an admin section where a user is able to then manage the stores as well as the brands available to them.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Installing

Complete the steps below to clone the project on to your personal machine and get the application running.

Clone the repo from github to your machine

```
git clone https://github.com/reeseglasscock/shoe-store.git
```

Make sure that you have postgres installed on your machine. You can run bundle (if you have bundler) to install all gems on your machine

```
bundle install
```

You will then need to create the databases locally on your system.

```
rake db:migrate
```

To run the application you will now need to have sinatra also installed on your system. You can then go to the project folder within terminal and run the command below to have the project start

```
ruby app.rb
```

Lastly point your web browser to localhost port 4567 to open the project.

```
open http://localhost:4567
```

## Deployment

Additionally you can deploy this code to your own app on Heroku.com for free. You can check out a live app by going to https://gentle-reef-60476.herokuapp.com/. You can also find documentation for how to deploy your app on the Heroku website.

## Built With

* [Ruby](https://www.ruby-lang.org/en/news/2018/03/28/ruby-2-5-1-released/) - 2.5.1
* [Postgres](https://www.postgresql.org/) - 1.0.0
* [ActiveRecord](http://guides.rubyonrails.org/active_record_basics.html) - 5.2.0
* [Sinatra](http://sinatrarb.com/) - 2.0.3

## Authors

* **Reese Glasscock** [Github](https://github.com/reeseglasscock)

## License

This project is licensed under the MIT License

## Acknowledgments

* Thanks to Franz Knupfer for being an awesome mentor! [Github](https://github.com/franzknupfer)
