# Real-time Search Box
 
The goal is to create a real-time search box, record user searches, and display analytics on search trends.

## Technologies Used

- Backend: Ruby on Rails
- Frontend: Vanilla JavaScript
- Testing: RSPEC
- Deployment: Render

## How to Run Locally

```bash
# 1. Clone the repository
git clone https://github.com/LiviaCalderan/research-box.git
cd searchbox

# 2. Install Ruby dependencies
bundle install

# 3. Set up the database
rails db:create db:migrate

# 4. Start the Rails server
rails server
```
## Running Tests
To run the test suite, use the command:
 
```bash
bundle exec rspec
```
## Live Demo

https://research-box-app.onrender.com

--- 
> **Note:** This project was developed as part of a programming test and is deployed on a free-tier platform (e.g., Render). As such, it may not support a high volume of concurrent requests or sustained traffic. For production-grade performance and scalability, it could be deployed on more robust cloud infrastructure like AWS, GCP, or Heroku Premium.