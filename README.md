<a name="readme-top"></a>

<div align="center">
  <img src="./app/assets/images/BUDGETTO.svg" alt="logo" width="140"  height="auto" />
  <br/>

  <h3><b>The Budgetting App</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 \[Bugetto\] ](#-bugetto-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [🚀 Live Demo ](#-live-demo-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 [Bugetto] <a name="about-project"></a>

**[Bugetto]** is a is a mobile web application where you can manage your budget: you have a list of transactions associated with a category, so that you can see how much money you spent and on what.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

- Ruby
- Rails
- Postgresql

### Key Features <a name="key-features"></a>

Build models for:
- **[USERS]**
- **[Expenses]**
- **[Groups]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🚀 Live Demo <a name="live-demo"></a>

 This is the [Live Demo Link](https://www.loom.com/share/04200dcc64434227b3ae9aa3cb290351?sid=fc245384-f83e-46a3-bbc3-41350c9533fc)

 This is the link to my deployed website: [Click here](https://budgetto-dqno.onrender.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- VScode
- Ruby
- Rails
- Postgres

### Setup

Clone this repository to your desired folder:

```sh
  git clone git@github.com:George7h/Budget-App.git
  cd Recipe-app
```

### Install

Install this project with:

```sh
  cd Budget-App
  bundle install
  
```

Create the local database:

 Edit databasy.yml and rename the database name and username and password according to your local environment then run:

```sh
  rails db:create
  rails migrate
```


### Usage

To run the project, execute the following command:


```sh
  rails server
```

### Run tests

To run the project tests, execute the following command:

```sh
  rspec .\spec\features\ 
```
```sh
  rspec .\spec\models\  
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 👥 Authors <a name="authors"></a>

👤 **George Hamman**

- GitHub: [@githubhandle](https://github.com/George7h)
- LinkedIn: <a href="https://www.linkedin.com/in/george-hamman-95b98224b/">George Hamman</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Desktop_Styling_and_other_visual_improvements]**
- [ ] **[Cap_on_image_upload_size]**
- [ ] **[pop_up_confirmations]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/George7h/Budget-App/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project feel free to leave a star and/or follow me on Github.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank all my code reviewers for their time in reviewing my project.

I would also like to thank [Gregoire Vella on Behance](https://www.behance.net/gregoirevella) for the design insperation.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
