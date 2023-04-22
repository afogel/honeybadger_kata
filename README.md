# README

This repository contains a Ruby on Rails application. Follow the steps below to download the repository, start the server, and set up the environment variable SLACK_API_TOKEN.

## Downloading the Repository

To download the repository, run the following command:

```bash
git clone https://github.com/your-username/your-repo.git
```

Make sure to replace your-username and your-repo with your own GitHub username and repository name.

## Starting the Server

To start the server, run the following commands:

```bash
bundle install
rails server
```

This will install all the necessary gems and start the Rails server on port 3000. You can access the application by navigating to http://localhost:3000 in your web browser.

## Setting the Environment Variable

To set the SLACK_API_TOKEN environment variable, follow these steps:

1. Create a .env file in the root directory of the application.

2. Add the following line to the .env file:

   ```bash
   SLACK_API_TOKEN=your-token-here
   ```

   Replace your-token-here with your actual Slack API token.

3. Save the .env file.

Note: Make sure not to commit the .env file to version control, as it contains sensitive information.

## Deploying to Heroku

To deploy the application to Heroku, follow these steps:

1. Create a new Heroku app:

   ```bash
   heroku create
   ```

2. Set the SLACK_API_TOKEN environment variable on Heroku:

   ```bash
   heroku config:set SLACK_API_TOKEN=your-token-here
   ```

   Replace your-token-here with your actual Slack API token.

3. Push the code to Heroku:

   ```bash
   git push heroku main
   ```

4. Migrate the database:

   ```bash
   heroku run rails db:migrate
   ```

5. Open the application:

   ```bash
   heroku open
   ```

   This will open the application in your web browser.
