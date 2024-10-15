# MTG Card List Manager

## Overview
This project consists of a Flask backend application and a React frontend application for managing card lists for Magic: The Gathering (MTG). The backend provides API endpoints for creating, retrieving, and updating card lists, as well as uploading CSV files containing card information. The frontend offers a user-friendly interface for interacting with these features.

## Backend

### Prerequisites
- Python 3.x
- PostgreSQL database

### Installation
1. Clone the repository
2. Navigate to the project directory
3. Install dependencies:
   ```
   pip install -r requirements.txt
   ```
4. Set up environment variables:
   Create a `.env.flask` file in the project root with the following variables:
   ```
   DATABASE_URI=your_postgresql_database_uri
   SECRET_KEY=your_secret_key
   ```

### Running the Backend
For development:
```
python main.py
```
The backend will run on `http://0.0.0.0:5000` by default.

For production, you may want to run the Flask application in the background or as a service. Here's an example using `nohup`:
```
nohup python main.py > output.log 2>&1 &
```
This will run the application in the background and redirect output to `output.log`.

## API Endpoints

### 1. Get Card List
- **URL**: `/api/card-list/<uuid:card_list_id>`
- **Method**: GET
- **Description**: Retrieves a specific card list by its UUID.

### 2. Update Card List Name
- **URL**: `/api/card-list/<string:id>`
- **Method**: PATCH
- **Description**: Updates the name of a specific card list.

### 3. Upload CSV File
- **URL**: `/api/upload`
- **Method**: POST
- **Description**: Uploads a CSV file containing card information and creates a new card list.

### 4. Get Local IP
- **URL**: `/api/get-local-ip`
- **Method**: GET, POST
- **Description**: Retrieves the local IP address of the server.

### 5. Health Check
- **URL**: `/api/health`
- **Method**: GET
- **Description**: Checks the health status of the application and database.

## Key Backend Components

### Models
1. **CardList**: Represents a list of cards.
2. **CardListItem**: Represents an individual card in a card list.

### Features
- CSV file processing
- Integration with Scryfall API for fetching card data
- Database operations using SQLAlchemy
- CORS support
- Error handling and logging
- Serving of static files (for frontend integration)

### Backend Dependencies
Key dependencies include:
- Flask
- Flask-SQLAlchemy
- Flask-CORS
- requests
- python-dotenv
- netifaces

## Frontend

The frontend is a React application built with TypeScript and Vite. It provides a user interface for interacting with the MTG Card List Manager.

### Key Frontend Features
- File uploading for CSV processing
- Display of card lists and individual cards
- QR code generation for sharing card lists

For more details on the frontend, including setup and running instructions, please refer to the [Frontend README](./frontend/README.md).

## Error Handling
The application includes global error handlers for database errors and operational errors. It also logs detailed information about requests and errors for debugging purposes.

## Security Considerations
- Uses environment variables for sensitive information
- Implements CORS
- Uses secure filename handling for uploaded files

## Deployment and Nginx Configuration

### Building the Frontend
1. Navigate to the frontend directory:
   ```
   cd frontend
   ```
2. Install dependencies:
   ```
   npm install
   ```
3. Build the frontend:
   ```
   npm run build
   ```
   This will create a `dist` folder with the built frontend files.

### Running the Backend
For production, run the Flask application in the background:
```
nohup python main.py > output.log 2>&1 &
```
This will run the application in the background and redirect output to `output.log`.

### Nginx Configuration
1. Ensure the Flask application is running (see "Running the Backend" above).
2. Copy the provided Nginx configuration file to your Nginx configuration directory:
   ```
   sudo cp mtg_qr_nginx.conf /etc/nginx/sites-available/
   ```
3. Create a symbolic link to enable the site:
   ```
   sudo ln -s /etc/nginx/sites-available/mtg_qr_nginx.conf /etc/nginx/sites-enabled/
   ```
4. Edit the configuration file to update the paths:
   ```
   sudo nano /etc/nginx/sites-available/mtg_qr_nginx.conf
   ```
   Update the `alias` directives to point to the correct paths of your frontend `dist` folder.
5. Test the Nginx configuration:
   ```
   sudo nginx -t
   ```
6. If the test is successful, reload Nginx:
   ```
   sudo systemctl reload nginx
   ```

Now, your MTG Card List Manager should be accessible at `http://192.168.1.126/qr-generator`.

### Updating the Application
To update the application:
1. Pull the latest changes from the repository
2. Rebuild the frontend (follow the "Building the Frontend" steps)
3. Restart the Flask application:
   ```
   pkill -f "python main.py"
   nohup python main.py > output.log 2>&1 &
   ```
4. Reload Nginx if there were any changes to the Nginx configuration:
   ```
   sudo systemctl reload nginx
   ```

For any issues or feature requests, please contact the development team.
