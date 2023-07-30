# Get That Home API

### Clone the repository

```shell
git clone git@github.com:kevinronu/get-that-home-api.git
cd get-that-home-api
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.1.4`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.1.4
```

## Install

```shell
bundle install
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Init server

```shell
rails s
```

## Import to Insomnia

To test the API import this file into insomnia: [get-that-home-insomnia](https://github.com/kevinronu/get-that-home-api/blob/main/get-that-home-insomnia.json).
