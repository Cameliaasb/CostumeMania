# CostumeMania

CostumeMania is a dynamic marketplace designed during a LeWagon project, where we brought our coding skills to life in just one week.

## Features

- Explore a Diverse Costume Library: Browse through a collection of costumes.
- Search: Find the right costume through search and filtering options.
- Rent or List Your Costumes: Whether you want to dress up for a special occasion or share your costumes with others, CostumeMania offers an easy-to-use renting and listing process.
- Review: Review a costume after you are done renting it.

----------

## Rails / Ruby version
Current Rails version is 7.0.7
Current Ruby version is 3.1.2

## Configuration

To configure the application, create a `.env` file and set the necessary environment variables.

## Dependencies

### Ruby gems
CostumeMania relies on a set of Ruby gems to function seamlessly. These gems are managed and installed using Bundler, a dependency management tool for Ruby projects.

If you're setting up CostumeMania for the first time or working on the project, you can install all the required gems by running the following command:

`bundle install`

### Algolia

[Algolia](https://www.algolia.com/) is used for efficient keyword search functionality in CostumeMania. To integrate Algolia with the project, follow these steps:

1. Sign up for an Algolia account and obtain your API credentials.
2. Configure your Algolia credentials in the project's `.env` file.

### Cloudinary

[Cloudinary](https://cloudinary.com/) is used for image and video management in CostumeMania. To use Cloudinary with the project, follow these steps:

1. Sign up for a Cloudinary account and obtain your API credentials.
2. Configure your Cloudinary credentials in the project's `.env` file.

Make sure to set up these external dependencies properly for the full functionality of the CostumeMania project.

---------- 

## Getting Started

To set up CostumeMania on your local machine, follow these steps:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/Cameliaasb/CostumeMania.git
   cd CostumeMania
   ```

2. **Install dependencies:**
   Make sure you have Ruby and Rails installed on your machine. Then, run:
   ```bash
   bundle install
   ```

3. **Database Setup:**

   Run the database migrations to set up the database schema:

   ```bash
   rails db:migrate
   ```

   Seed the database with initial data (optional):
   ```
   rails db:seed
   ```

4. **Start the Application:**
   ```
   rails server
   ```

5. **Access CostumeMania:**
  
   Open your web browser and navigate to http://localhost:3000 to access the CostumeMania application.
   Now you have CostumeMania running locally on your machine. Enjoy exploring and using it! 🎉





