# Book Review Application

Welcome to the Book Review Application, where users can add books and reviews for those books.
Overview

### This application allows users to:

- Add new books with details such as name, author, year, genre, and price.
- Write reviews for each book, including a textual review and a rating.
- View books and their associated reviews.



## Setup Instructions

### Prerequisites

Before setting up the application, ensure you have the following installed:

- [Ruby](https://www.ruby-lang.org/en/downloads/) (version 3.2.3)
- [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) (version 7.1.3.4)


Make sure you have the following software installed [Node.js](https://nodejs.org/) (which includes npm)
- (Mac) use [Homebrew](https://brew.sh/) to install Node.js and npm:
```sh
brew install node
```

- (Windows) use [Chocolatey](https://chocolatey.org/) to install Node.js and npm:
```sh
choco install nodejs
```

- (Linux) use your package manager to install Node.js and npm:
```sh
sudo apt install nodejs
```

- You can manually download the appropriate installer from the official website: [Download](https://nodejs.org/en/download/)

### Installing Dependencies

After cloning the repository, navigate to the project directory and run the following command to install the project dependencies:
```sh
npm install
```
- This command will install all the required packages listed in the `package.json` file.

Before running the Rails server or tests, you need to install the necessary Ruby gems (dependencies) listed in the Gemfile. 
```bundle
bundle install
```
- This command reads the Gemfile in your project directory and installs all the specified gems along with their dependencies. 

### Run the Development Server
```rails
rails server
```

Thankyou for checking out my appliction
