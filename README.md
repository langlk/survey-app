# Survey App

#### _Epicodus Practice in Ruby, Sinatra, and ActiveRecord, September 27, 2017_

#### By Kelsey Langlois

## Description

_A Ruby Web App for creating and taking surveys. On the design side, users can create surveys, adding multiple choice questions to them, and track the number of times each answer for a question has been chosen. Once a survey has been made and has at least one question with answers, it can be taken by other users._

## Setup/Installation Requirements

* Clone this repository
* Ensure you have Postgres installed and running ([instructions here](https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef))
* Create a database ```survey_app_development``` by running the command ```createdb -T template0 survey_app_development```
* Run the command ```psql survey_app_development < my_database.sql``` in the project root directory
* Run the command ```ruby app.rb``` in the project root directory
* Open ```localhost:4567``` in your web browser

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Sinatra
* Postgres
* ActiveRecord

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*
