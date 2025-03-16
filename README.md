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

## API Documentation

### Authentication

#### Login
```http
POST /api/auth/login
Content-Type: application/json

{
    "email": "admin@example.com",
    "password": "password"
}
```

Response:
```json
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9...",
    "user": {
        "id": 1,
        "first_name": "Admin",
        "last_name": "User",
        "email": "admin@example.com"
    }
}
```

### Projects

#### List Projects
```http
GET /api/projects
Authorization: Bearer {token}
```

Query Parameters:
- `page`: Page number (default: 1)
- `per_page`: Items per page (default: 15)
- `sort_by`: Field to sort by (default: created_at)
- `sort_direction`: asc or desc (default: desc)
- `filters[status]`: Filter by status (pending/active/completed)
- `filters[department]`: Filter by department attribute

Response:
```json
{
    "data": [
        {
            "id": 1,
            "name": "Marketing Campaign Project",
            "status": "active",
            "attribute_values": [
                {
                    "name": "department",
                    "value": "Marketing"
                },
                {
                    "name": "budget",
                    "value": 50000
                }
            ],
            "users": [
                {
                    "id": 1,
                    "first_name": "John",
                    "last_name": "Doe"
                }
            ]
        }
    ],
    "meta": {
        "current_page": 1,
        "total": 10,
        "per_page": 15
    }
}
```

#### Create Project
```http
POST /api/projects
Authorization: Bearer {token}
Content-Type: application/json

{
    "name": "New Project",
    "status": "pending",
    "attributes": {
        "department": "IT",
        "start_date": "2024-03-20",
        "end_date": "2024-06-20",
        "budget": 75000
    },
    "user_ids": [1, 2, 3]
}
```

### Timesheets

#### Create Timesheet Entry
```http
POST /api/timesheets
Authorization: Bearer {token}
Content-Type: application/json

{
    "project_id": 1,
    "task_name": "Feature Development",
    "date": "2024-03-20",
    "hours": 4.5
}
```

#### Bulk Create Timesheet Entries
```http
POST /api/timesheets/bulk
Authorization: Bearer {token}
Content-Type: application/json

{
    "timesheets": [
        {
            "project_id": 1,
            "task_name": "Feature Development",
            "date": "2024-03-20",
            "hours": 4.5
        },
        {
            "project_id": 2,
            "task_name": "Code Review",
            "date": "2024-03-20",
            "hours": 2.0
        }
    ]
}
```

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

## Error Handling

The API returns standard HTTP status codes:

- 200: Success
- 201: Created
- 400: Bad Request
- 401: Unauthorized
- 403: Forbidden
- 404: Not Found
- 422: Validation Error
- 500: Server Error

Example Error Response:
```json
{
    "message": "The given data was invalid.",
    "errors": {
        "name": ["The name field is required."],
        "status": ["The selected status is invalid."]
    }
}
```

## Testing

Run PHPUnit tests:
```bash
php artisan test
```

## License

[MIT License](LICENSE.md)
