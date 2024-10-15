#!/bin/bash
source venv/bin/activate  # Activate the venv
flask --app main run --host=0.0.0.0 --port=5050  # Run the app
