
# Automated Acceptance Tests

Repository with initial configuration for test automation with [Cucumber](https://cucumber.io/) and [Capybara](https://teamcapybara.github.io/capybara/).

## Requirements

-   [Ruby 2.6.5](https://www.ruby-lang.org/en/documentation/installation/)
    
-   Bundler
    
-   [Chrome Driver](https://sites.google.com/a/chromium.org/chromedriver/downloads)
    
    -   `wget https://chromedriver.storage.googleapis.com/78.0.3904.70/chromedriver_linux64.zip`
    -   `unzip chromedriver_linux64.zip`
    -   `sudo mv chromedriver /usr/bin/chromedriver`
    -   `sudo chown root:root /usr/bin/chromedriver`
    -   `sudo chmod +x /usr/bin/chromedriver`
-   Google Chrome Versão 78
    

## Setup

In this topic we will learn how to setup our project. It is necessary to clone the project and install all the _gems_ necessary to run the tests.

In your project folder, run:

-   If you use HTTPS:  `git clone https://github.com/ayslanmarcelino/automation-capybara-cucumber-ruby.git`
-   If you use SSH:  `git clone git@github.com:ayslanmarcelino/automation-capybara-cucumber-ruby.git`
-   After cloning, enter the project folder and run the following commands:  `bundle install`

During the bundle install, if you get the error `An error occurred while installing capybara-webkit (1.15.1)`, follow [this tutorial](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit)  to install the dependencies required by the cabybara-webkit gem.

## Execution of Tests

To run all tests, just run the following command within the project:

-   `cucumber`

By default the tests are being executed by opening the browser, to run with the browser in the background change the option in the `env.rb` file.

```
config.default_driver = :selenium_chrome #runs in the browser

config.default_driver = :selenium_chrome_headless #runs with the browser in the background

```

NOTE: To run a specific test, use the following command:

-   `cucumber -t @name_tag`  or  `cucumber features/specifications/nome_da_feature.feature`

Using _tag_ is a great way to organize _features_ and _scenarios_, always define _tags_ for the tests you are responsible for.

## Folder Structure

The structure created works as follows:

-   **features**: Stores the test specifications.
-   **features/pages**: Stores the `.rb` files with the implementation of the pages using the "Page Objects" standard using SitePrism, a DSL (Domain Specific Language) created to facilitate the creation of page objects for automated tests in Ruby, using Capybara.
- **features/reports**: Stores reports of test runs.
- **features/specifications**: Stores the test specifications.
- **features/step_definitions**: Stores the files with the implementation of the automation steps.
- **features/support**: Stores a file `env.rb` and` hooks.rb` that serve as support for the test configurations.

## Steps for creating tests

To create the tests, follow these steps:

- **Step 1**: Write the test scenarios using Cucumber syntax following the BDD principles in a `.feature` file inside the` feature/specifications` folder.
- **Step 2**: Run the command `cucumber` in the terminal inside the root folder of the project, and copy the steps generated automatically by the tool and paste it into a` .rb` file inside the `features/step_definitions` folder.
- **Step 3**: Create the page following the "Page Object" pattern using SitePrism inside the `features/pages` folder, identifying all the items and/or attributes of the page and the methods that will be needed to perform the tests.
- **Step 4**: Implement the _Steps_ of the `.rb` file in the` features/step_definitions` folder using capybara.
- **Step 5**: Run the command `cucumber` in the terminal inside the project's root folder, and check that all tests are running correctly.
