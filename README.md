<a name="readme-top"></a>

<div align="center">
<img src="./app/assets/images/icon/Grandiose.png" alt="logo" width="140"  height="auto" />
  <br/>

  <!-- <h3><b>School Library</b></h3> -->

</div>

# 📗 Table of Contents
- [📗 Table of Contents](#-table-of-contents)
- [📖 Recipe App ](#-recipe-app-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)


# 📖 Recipe App <a name="about-project"></a>

**Recipe app** application that allows users to create, share, and discover recipes. It has the following features:
- Users can sign up and log in with Devise, a gem that provides user authentication functionality.
Users can create their own recipes with a name, description, ingredients, steps, and a public or private status. They can also edit or delete their recipes if they are the owners.
- Users can view a list of their own recipes or a list of all public recipes created by other users. They can also search for recipes by name or filter them by date.
- Users can view the details of a selected recipe, including the ingredients, steps, and a toggle button that allows them to make the recipe public or private. They can also see the name and email of the recipe owner if the recipe is public.
- Users can create a food list with the name, quantity, and price of the food items they have. They can also edit or delete their food items.
- Users can view a general shopping list that shows the food items that are missing for all their recipes. They can also see the total number of items and the total price of the missing food.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
  <details>
    <ul>
      <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
      <li><a href="https://rubyonrails.org/">Rails</li>
      <li><a href="https://www.postgresql.org/">Postgresql</li>
    </ul>
  </details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Key Features <a name="key-features"></a>

- **Login**
- **View the list own's recipes or a list of all public**
- **View the details of a selected recipe**
- **View a general shopping list**

## Getting Started

### Prerequisites
In order to run this project, you must have installed and configured ruby in your local environment:
You we also need to setup Postgres database



### Setup

Clone this repository to your desired folder:

<!--
Example commands:

```sh
  cd my-folder
  git clone https://github.com/Grandi0z/Recipe_app.git
```
 
--->
Before to run the program, verify that you have Ruby installed on your OS running the following command:
<!--
```sh
   ruby -v
```
--->

### Usage

Run the following command inside the project folder:
1. Open your terminal and navigate to the root directory of your project.
2. Run ```bundle install``` to install the required gems.
3. Run ```rails db:create``` and ```rails db:migrate``` to create and set up the database.
4. `rails server` to start the app on `http://localhost:3000`.
5. open your navigator
6. Go to ```http://localhost:3000/```
7. Enjoy

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Run tests

Before running tests, ensure you've set up the test database:

```sh
bin/rails db:migrate RAILS_ENV=test
```

```sh
bundle exec rspec ./spec

```

For linters test : 

```$
  rubocop
```

```$
    npx stylelint "**/*.{css,scss}"
```

### Deployment

You can deploy this project using: GitHub Pages Netifly or Render 

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 **Joseph L Kausi**

- GitHub: [@Grandi0z](https://github.com/Grandi0z)
- Twitter: [@Joseph_LSK](https://twitter.com/Joseph_LSK)
- LinkedIn: [Joseph L Kausi](https://www.linkedin.com/in/joskal/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>


- [ ] **Add API endpoint**
- [ ] **Create a mobile app**

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Grandi0z/Recipe_app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, I would like to Thank You!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

Special Thanks to the Microverse and Micronauts.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](https://github.com/Grandi0z/Recipe_app/blob/dev/LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
