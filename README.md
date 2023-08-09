# Get That Home API

Welcome to the Get That Home API repository! This backend powers the seamless interaction between users and properties for the Get That Home frontend application. Built with Ruby on Rails and leveraging the capabilities of PostgreSQL, this API delivers efficient and reliable data management for a delightful user experience.

## Table of Contents

- [Installation](#installation)
- [Database Setup](#database-setup)
- [Server Initialization](#server-initialization)
- [API Documentation](#api-documentation)
- [Technologies Used](#technologies-used)
- [Connect with Me](#connect-with-me)

## Installation

1. **Clone the Repository**: Start by cloning this repository to your local machine using the following command:

   ```shell
   git clone git@github.com:kevinronu/get-that-home-api.git
   cd get-that-home-api
   ```

2. **Check Your Ruby Version**: Ensure you have the correct Ruby version installed:

   ```shell
   ruby -v
   ```

   If you don't have the right version, no worries. You can install it using [rbenv](https://github.com/rbenv/rbenv):

   ```shell
   rbenv install 3.1.4
   ```

3. **Install Dependencies**: Run the following command to install the necessary dependencies:

   ```shell
   bundle install
   ```

## Database Setup

**Initialize the Database**: Create, migrate, and seed the database:

```shell
rails db:create db:migrate db:seed
```

## Server Initialization

Start the Rails server:

```shell
   rails s
```

## API Documentation

For detailed API documentation and endpoints, you can import the provided Insomnia collection to test and interact with the API. Simply import the collection from this file: [get-that-home-insomnia.json](https://github.com/kevinronu/get-that-home-api/blob/main/get-that-home-insomnia.json).

## Technologies Used

- Ruby on Rails: A robust framework for building web applications.
- PostgreSQL: A powerful relational database management system.
- Active Storage: Enables the association of file uploads with records in the database.
- Amazon Web Services (AWS): Utilized for hosting property images efficiently.
- Insomnia: The API client used for testing and interaction.

## Connect with Me

Feel free to connect with me on LinkedIn: [Kevin Robles](https://www.linkedin.com/in/kevinronu/).

With this robust backend API, Get That Home is equipped to provide a seamless experience for property seekers and landlords alike. Through advanced data management, efficient storage, and intuitive interactions, we aim to redefine the way users engage with real estate information. Explore the world of property with Get That Home today!
