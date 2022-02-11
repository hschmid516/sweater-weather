# Sweater Weather

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project
  <p>
  This was a solo project completed during the final week of module 3 of 4 at Turing School of Software & Design. The goal of this project was to create a successful web application to plan road trips. This app allows users to see the current weather for any given location, as well as the forecasted weather at the destination during the estimated time of arrival.

  This project was completed with a focus on service-oriented architecture. It was designed to aggregate data from multiple endpoints of three different external APIs, and expose a token-authenticated API that satisfied the requirements given from the front-end team.
  </p>

<p align="right">(<a href="#top">back to top</a>)</p>


### Built With
#### Framework
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/-postman-orange" />

</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/faker-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/rubocop-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
</br>
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/orderly-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />

  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/factory--bot-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />

  <img src="https://img.shields.io/badge/json_api_serializer-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
</p>

#### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />
</p>


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

### Installation

1. Clone the repo
   ```sh
   git clone git@github.com/hschmid516/sweater-weather.git
   ```
3. Run bundle
   ```sh
   bundle install
   ```
4. Run migrations
   ```sh
   rails db:{create,migrate}
   ```
5. Install Figaro
   ```sh
   bundle exec figaro:install
   ```
6. Get API keys for the following APIs
    - [Open Weather](https://openweathermap.org/api/one-call-api)
    - [MapQuest](https://developer.mapquest.com/documentation/directions-api/)
    - [Unsplash](https://unsplash.com/documentation#search-photos)
7. Add API keys to application.yml

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

<h3>GET /api/v1/forecast?location={location}</h3>

Get weather data for a given location

#### Response

  ```json
  {
     "data": {
          "id": null,
          "type": "forecast",
          "attributes": {
              "current_weather": {
                  "datetime": "2021-11-16T20:29:34.000-07:00",
                  "sunrise": "2021-11-16T05:26:08.000-07:00",
                  "sunset": "2021-11-16T15:30:52.000-07:00",
                  "temperature": 60.19,
                  "feels_like": 60.1,
                  "humidity": 89,
                  "uvi": 0,
                  "visibility": 10000,
                  "conditions": "broken clouds",
                  "icon": "04n"
              },
              "daily_weather": [
                  {
                      "date": "2021-11-16",
                      "sunrise": "2021-11-16T05:26:08.000-07:00",
                      "sunset": "2021-11-16T15:30:52.000-07:00",
                      "max_temp": 64.22,
                      "min_temp": 38.52,
                      "conditions": "broken clouds",
                      "icon": "04d"
                 },
                  ...
              ],
              "hourly_weather": [
                  {
                      "time": "20:00:00",
                      "temperature": 60.19,
                      "conditions": "broken clouds",
                      "icon": "04n"
                  },
                  ...
              ]
          }
       }
  }
  ```

<h3>GET /api/v1/backgrounds?location={location}</h3>

Get image for a given city

#### Response

  ```json
  {
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "location": "Denver Colorado",
                "image_url": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU0ODR8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMDkzNjQ&ixlib=rb-1.2.1&q=80&w=1080",
                "credit": {
                    "source": "https://unsplash.com/",
                    "user": "dillydallying",
                    "user_url": "https://unsplash.com/@dillydallying",
                    "name": "Dillon Wanner"
                }
            }
        }
    }
  }
  ```

<h3>POST /api/v1/users</h3>

Register a user

- Content-Type: application/json
- Accept: application/json
  
#### Request Body
  
  ```json
  {
     "email": "whatever@example.com",
     "password": "password",
     "password_confirmation": "password"
  }
  ```
#### Response
  
  ```json
  {
     "data": {
     "type": "users",
     "id": "1",
     "attributes": {
       "email": "whatever@example.com",
       "api_key": "jgn983hy48thw9begh98h4539h4"
      }
    }
  }
  ```

<h3>POST /api/v1/sessions</h3>

User login

- Content-Type: application/json
- Accept: application/json
  
#### Request Body
    
  ```json
  {
    "email": "whatever@example.com",
    "password": "password"
  }
  ```
#### Response

  ```json
  {
    "data": {
      "type": "users",
      "id": "1",
      "attributes": {
        "email": "whatever@example.com",
        "api_key": "jgn983hy48thw9begh98h4539h4"
      }
    }
  }
  ```

<h3>POST /api/v1/road_trip</h3>

Create a road trip

- Content-Type: application/json
- Accept: application/json
  
#### Request Body

  ```json
  {
    "origin": "Denver,CO",
    "destination": "Pueblo,CO",
    "api_key": "53ZqhpECyRoKUheAX6v6hXCc"
  }
  ```
#### Response
  
  ```json
  {
    "data": {
      "id": null,
      "type": "roadtrip",
      "attributes": {
        "start_city": "Denver, CO",
        "end_city": "Estes Park, CO",
        "travel_time": "2 hours, 13 minutes"
        "weather_at_eta": {
          "temperature": 59.4,
          "conditions": "partly cloudy with a chance of meatballs"
        }
      }
    }
  }
  ```
  
</br>

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

<p>
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</p>

- [Henry Schmid](https://www.linkedin.com/in/henry-schmid)

<p>
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />
</p>

- [Henry Schmid](https://github.com/hschmid516)


<p align="right">(<a href="#top">back to top</a>)</p>
