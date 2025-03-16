# Project Management API

A Laravel-based REST API for project management with timesheet tracking, featuring dynamic attributes (EAV model) and user management.

## Features

- User Authentication (Laravel Passport)
- Project Management with Dynamic Attributes
- Timesheet Tracking
- Role-based Access Control
- RESTful API Design
- Comprehensive Data Validation
- Efficient Batch Operations

## Requirements

- PHP 8.1 or higher
- MySQL 5.7 or higher
- Composer
- Node.js & NPM (for frontend assets)

## Setup Instructions

1. Clone the repository:
```bash
git clone <repository-url>
cd <project-directory>
```

2. Install PHP dependencies:
```bash
composer install
```

3. Create environment file:
```bash
cp .env.example .env
```

4. Configure your `.env` file with database credentials:
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database_name
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

5. Generate application key:
```bash
php artisan key:generate
```

6. Run migrations and seeders:
```bash
php artisan migrate:fresh --seed
```

7. Install Passport:
```bash
php artisan passport:install
```

## Test Credentials

Admin User:
- Email: admin@example.com
- Password: password

Regular User:
- Email: user1@example.com
- Password: password

## API Collection

A Postman collection is available for testing the API endpoints. The collection includes all available endpoints with example requests and environment variables.

### Importing the Collection

1. Download [Postman](https://www.postman.com/downloads/)
2. Import the collection file:
   ```
   postman/ASTUDIO-Assessment.postman_collection.json
   ```

### Setting Up Environment

1. Create a new environment in Postman
2. Add the following variables:
   - `base_url`: Your API base URL (e.g., `http://localhost:8000`)
   - `token`: Leave empty (will be automatically set after login)

### Using the Collection

1. Select your environment
2. Execute the "Login" request first to get the authentication token
3. The token will be automatically set for subsequent requests
4. Use the organized folders to find and test different endpoints:
   - Authentication
   - Projects
   - Timesheets

### Available Endpoints

| Folder | Endpoint | Method | Description |
|--------|----------|--------|-------------|
| Authentication | `/api/auth/login` | POST | Login to get access token |
| Authentication | `/api/auth/logout` | POST | Logout and invalidate token |
| Authentication | `/api/auth/user` | GET | Get current user profile |
| Projects | `/api/projects` | GET | List all projects with pagination |
| Projects | `/api/projects/{id}` | GET | Get a specific project |
| Projects | `/api/projects` | POST | Create a new project |
| Projects | `/api/projects/{id}` | PUT | Update an existing project |
| Projects | `/api/projects/{id}` | DELETE | Delete a project |
| Timesheets | `/api/timesheets` | GET | List all timesheets with pagination |
| Timesheets | `/api/timesheets/{id}` | GET | Get a specific timesheet |
| Timesheets | `/api/timesheets` | POST | Create a timesheet entry |
| Timesheets | `/api/timesheets/{id}` | PUT | Update a timesheet entry |
| Timesheets | `/api/timesheets/{id}` | DELETE | Delete a timesheet entry |
| Timesheets | `/api/timesheets/bulk` | POST | Bulk create timesheet entries |

## API Documentation

### Authentication

This API uses Laravel Passport for authentication. All protected routes require a Bearer token.

#### Register a new user
```http
POST /api/auth/register
Content-Type: application/json

{
    "first_name": "John",
    "last_name": "Doe",
    "email": "john@example.com",
    "password": "password123",
    "password_confirmation": "password123"
}
```

Response:
```json
{
    "user": {
        "id": 1,
        "first_name": "John",
        "last_name": "Doe",
        "email": "john@example.com"
    },
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGc...",
    "token_type": "Bearer"
}
```

#### Login
```http
POST /api/auth/login
Content-Type: application/json

{
    "email": "john@example.com",
    "password": "password123"
}
```

Response:
```json
{
    "user": {
        "id": 1,
        "first_name": "John",
        "last_name": "Doe",
        "email": "john@example.com"
    },
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGc...",
    "token_type": "Bearer"
}
```

#### Logout
```http
POST /api/auth/logout
Authorization: Bearer {token}
```

### Protected Routes

All the following routes require authentication. Include the token in the Authorization header:
```http
Authorization: Bearer {your_token}
```

#### Projects

- List all projects
  ```http
  GET /api/projects?page=1&per_page=15&sort_by=created_at&sort_direction=desc
  ```

- Create a project
  ```http
  POST /api/projects
  Content-Type: application/json

  {
      "name": "Project Name",
      "status": "active",
      "attributes": {
          "client": "Client Name",
          "deadline": "2024-12-31"
      },
      "user_ids": [1, 2, 3]
  }
  ```

- Get a project
  ```http
  GET /api/projects/{id}
  ```

- Update a project
  ```http
  PUT /api/projects/{id}
  Content-Type: application/json

  {
      "name": "Updated Project Name",
      "status": "completed",
      "attributes": {
          "client": "Updated Client Name"
      },
      "user_ids": [1, 4, 5]
  }
  ```

- Delete a project
  ```http
  DELETE /api/projects/{id}
  ```

#### Timesheets

- List all timesheets
  ```http
  GET /api/timesheets?page=1&filters[project_id]=1&date_from=2024-01-01&date_to=2024-01-31
  ```

- Create a timesheet entry
  ```http
  POST /api/timesheets
  Content-Type: application/json

  {
      "project_id": 1,
      "task_name": "Development",
      "date": "2024-01-15",
      "hours": 8
  }
  ```

- Get a timesheet entry
  ```http
  GET /api/timesheets/{id}
  ```

- Update a timesheet entry
  ```http
  PUT /api/timesheets/{id}
  Content-Type: application/json

  {
      "project_id": 1,
      "task_name": "Code Review",
      "date": "2024-01-15",
      "hours": 4
  }
  ```

- Delete a timesheet entry
  ```http
  DELETE /api/timesheets/{id}
  ```

### Error Responses

The API returns appropriate HTTP status codes:

- 200: Success
- 201: Created
- 400: Bad Request
- 401: Unauthorized
- 403: Forbidden
- 404: Not Found
- 422: Validation Error
- 500: Server Error

Example error response:
```json
{
    "message": "The given data was invalid.",
    "errors": {
        "email": ["The email field is required."],
        "password": ["The password field is required."]
    }
}
```

## Postman Collection

A Postman collection is available in the `postman` directory. To use it:

1. Import the collection into Postman
2. Create an environment with the following variables:
   - `base_url`: Your API base URL (e.g., http://localhost:8000)
   - `token`: Will be automatically set after successful login

The collection includes pre-request scripts that handle authentication automatically.

## Creating Database Dump

To create a SQL dump of your database:

### Using Laravel Command (Recommended)

Basic Usage:
```bash
# Create dump with auto-generated filename (database_dump_YYYY-MM-DD_HHMMSS.sql)
php artisan db:dump

# Create dump with custom filename
php artisan db:dump my_backup.sql
```

Advanced Options:
```bash
# Create compressed dump (adds .gz extension automatically)
php artisan db:dump --compress

# Dump structure only (no data)
php artisan db:dump --no-data

# Dump specific tables
php artisan db:dump --tables=users,projects,timesheets

# Dump all tables except specified ones
php artisan db:dump --exclude-tables=failed_jobs,password_resets

# Combine options
php artisan db:dump backup.sql --compress --exclude-tables=failed_jobs
```

For Windows users:
1. If mysqldump is not found, add the MySQL bin directory to your system PATH, or
2. Add the full path to mysqldump in your `.env` file:
```
MYSQL_DUMP_PATH="C:\xampp\mysql\bin\mysqldump.exe"
```

Common mysqldump locations:
- XAMPP: `C:\xampp\mysql\bin\mysqldump.exe`
- WAMP: `C:\wamp64\bin\mysql\mysql8.0.31\bin\mysqldump.exe`
- MySQL Server: `C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe`

### Using MySQL Command Line
```bash
# Windows
"C:\xampp\mysql\bin\mysqldump.exe" -u your_username -p your_database_name > database_dump.sql

# Linux/Mac
mysqldump -u your_username -p your_database_name > database_dump.sql

# With compression (all platforms)
mysqldump -u your_username -p your_database_name | gzip > database_dump.sql.gz
```

### Importing the Dump

For uncompressed dumps:
```bash
# Windows
"C:\xampp\mysql\bin\mysql.exe" -u your_username -p your_database_name < database_dump.sql

# Linux/Mac
mysql -u your_username -p your_database_name < database_dump.sql
```

For compressed dumps:
```bash
# Windows (using Git Bash or similar)
gunzip < database_dump.sql.gz | mysql -u your_username -p your_database_name

# Linux/Mac
zcat database_dump.sql.gz | mysql -u your_username -p your_database_name
```

### Troubleshooting

If you encounter issues:

1. **Command Not Found**
   - Ensure MySQL is installed
   - Add MySQL bin directory to PATH
   - Or specify full path in .env: `MYSQL_DUMP_PATH="path/to/mysqldump"`

2. **Permission Denied**
   - Check file write permissions
   - Run command with appropriate privileges
   - Ensure MySQL user has sufficient privileges

3. **Connection Issues**
   - Verify database credentials in .env
   - Check if MySQL service is running
   - Ensure firewall isn't blocking connection

4. **Version Compatibility**
   - If using MySQL 8.0+ with MariaDB or older MySQL versions, the command automatically handles compatibility
   - The command includes `--column-statistics=0` to prevent statistics collection errors
   - If you see GTID-related errors, the command includes `--set-gtid-purged=OFF` to resolve them
   - For manual dumps with version mismatches, add these flags:
     ```bash
     mysqldump --column-statistics=0 --set-gtid-purged=OFF [other options...]
     ```

## Testing

Run PHPUnit tests:
```bash
php artisan test
```

## License

[MIT License](LICENSE.md)
