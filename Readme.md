# Travel Chatbot developed with Kogno

This flight search chatbot was developed with Kogno for an educational purpose.

Learn how to develop conversational apps in Kogno by reading the documentation at https://docs.kogno.io

### Try this app on the following messaging platforms:

`Messenger:` <https://m.me/kognoTravel>

`Telegram:` <https://t.me/KognoTravelBot>

`WhatsApp:` <https://wa.me/13218005873>


## Setup

### Install Kogno's gem

    $ gem install kogno

#### Installing Dependencies
    
    $ bundle install

### Database

---
**MySQL Devel**

Make sure you have installed MySQL Development Library.

---


#### 1 - Configure the database

Open the file `config/database.yml` and configure your database.
```ruby
adapter: mysql2
pool: 5
username: your_user_name
password: your_password
host:  localhost
database: your_database_name
encoding: utf8mb4
collation: utf8mb4_unicode_ci
```

#### 2 - Create Kogno database tables.

    $ kogno install

#### 3 - Create project database tables.

Execute the SQL contained in the file [`installation/travel_bot.sql`](installation/travel_bot.sql)

Alternatively you can run this in order to do the same operation:
    
    $ kogno runner "File.read('installation/travel_bot.sql').split(';').each { |query| ActiveRecord::Base.connection.execute(query)}"


#### 4 - Testing

You can easily test the database by running the Kogno console with `kogno c`.

```ruby
travel_chatbot/ kogno c
Loading development environment (Kogno 1.0.1)
2.7.0 :001 > Country.first.cities.first
  Country Load (0.9ms)  SELECT `countries`.* FROM `countries` ORDER BY `countries`.`id` ASC LIMIT 1
  City Load (4.4ms)  SELECT `cities`.* FROM `cities` WHERE `cities`.`country_id` = 1 ORDER BY `cities`.`id` ASC LIMIT 1
 => #<City id: 742, name: "Salzburg", code: "SZG", lat: 0.4780949e2, lon: 0.1305501e2, time_zone: "Europe/Vienna", country_code: "AT", country_id: 1, created_at: "2022-07-05 09:50:13.000000000 +0000", updated_at: "2022-07-05 09:50:13.000000000 +0000"> 
 ```


### Configure and start the web server

The web server is needed to receive incoming updates via an outgoing webohoks from the messaging platforms like Messenger, Telegram or WhatsApp.

[Read how to configure the web server](https://docs.kogno.io/installation/configuration "Configure Kogno")

#### Start the server 

##### In Background

    $ kogno http start
    
##### in Foregrond

    $ kogno http fg
    

### Platforms

You can configure some or all of the messaging platforms currently supported by the framework. See how bellow:

- [Configure Messenger](https://docs.kogno.io/installation/messenger-configuration)
- [Configure Telegram](https://docs.kogno.io/installation/telegram-configuration)
- [Configure WhatsApp](https://docs.kogno.io/installation/whatsapp-configuration)

### Configure The NLP Engine

Currently Kogno only supports Wit.ai as NLP engine and this project, due to the fact that it is multi-language (English and Spanish) needs to be connected to two Wit.ai apps which are public and can be accessed through the following links:

- English: https://wit.ai/apps/3293800800852131 
- Spanish: https://wit.ai/apps/1080623005888459

Create both Wit.ai apps using these [backups files](installation/wit.ai-backups/).
