<a name="readme-top"></a>

<div align="center">

</div>


# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 vehicle booking app ](#-vehicle-booking-app-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Frontend Repository](#frontend-repository)
    - [ERD Image](#erd-image)
    - [API Documentation](#api-documentation)
    - [Usage](#usage)
    - [Run tests](#run-tests)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

# 📖 vehicle booking app <a name="about-project"></a>

**vehicle booking app** is a Booking app made connectively with Ruby in Rails and React for front-end [vehicle booking app](https://github.com/tan12082001/Vehicle-Booking-App-Backend.git) React frontend App in JSON format through an API endpoint.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
  <details>
  <summary>Client</summary>
      <ul>
        <li><a href="https://react.dev/">React</a></li>
        <li><a href="https://react-redux.js.org/">React-Redux</a></li>
        <li><a href="https://redux-toolkit.js.org/">Redux Toolkit</a></li>
      </ul>
  </details>

  <details>
  - <summary>Server</summary>
      <ul>
        <li><a href="https://guides.rubyonrails.org/">Ruby on Rails</a></li>
        <li><a href="https://www.postgresql.org/docs/">PostgreSQL</a></li>
      </ul>
  </details>

### Key Features <a name="key-features"></a>

- Rails API backend
- React Front-end
- Redux Toolkit used to consume the backend api

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps:

### Prerequisites

In order to run this project you need:
  - A text editor of your choice ([VS Code](https://code.visualstudio.com/download) works well).
  - [Ruby and Rails](https://gorails.com/setup/windows/10)
  - [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Setup

Use the following URL to clone this project:

  ```
  git clone https://github.com/tan12082001/Vehicle-Booking-App-Backend.git

  ```

### Install
Open the terminal in the root directory of the project and run the following command to install all dependencies.

    - bundle install
    - secret_base_key generation
      In terminal: 
      * rm credentials.yml.enc
      * $ EDITOR="mate --wait" bin/rails credentials:edit

    - configure database
      In terminal: 
      * run `rails db:create`
      * run `db:migrate`

    - Rspec
      In terminal: 
      * bundle exec rails db:schema:load RAILS_ENV=test

### Frontend Repository
Reference the [Frontend Repository](https://github.com/tan12082001/Vehicle-Booking-App-Frontend.git) for the corresponding frontend.

### ERD Image
[ERD image to visualize the database schema](https://drawsql.app/teams/wineshuga/diagrams/book-appointment)

### API Documentation
For details on how to interact with the API, view the API documentation. Follow the steps below:

    - run server `rails s`
    - open in browser `http://localhost:4000/api-docs`

### Usage
To start the development server, run the following command then navigate to `localhost:4000` in your browser.

    rails s

Open [http://localhost:4000](http://localhost:4000) to view it in your browser.


### Run tests
To run tests, use the following command:

``` 
  rspec
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 👥 Authors <a name="authors"></a>


👤 **Suleiman Gacheru**

- GitHub: [@hetrox8](https://github.com/hetrox8)
- Twitter: [@suleimangacheru](https://twitter.com/suleimangacheru)


👤 **Tanmayi manku**

- GitHub: [@tan12082001](https://github.com/tan12082001)


👤 **Nweneary Uzochukwu Winnie**

- GitHub: [@wineshuga](https://github.com/Wineshuga)
- LinkedIn: [LinkedIn](https://linkedin.com/in/wineshuga)

👤 **Bolaji Toyib**

- GitHub: [@toyybi bolaji](https://github.com/Simpleshaikh1)


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Future Features <a name="future-features"></a>

- None planned


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

 
  If you like this project, please give it a star ⭐️ and share it with your friends.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank  <a href="https://www.microverse.org/">Microverse</a> for providing the resources and guidelines that enabled me to complete this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.
