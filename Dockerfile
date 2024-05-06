# Use the official Python base image
FROM python:3.11.9-bullseye

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Nginx and Supervisor
RUN apt-get update && \
    apt-get install -y nginx supervisor && \
    rm -rf /var/lib/apt/lists/*

# Copy the Flask application code
COPY app.py .

# Remove the default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/sites-available/app

# Create a symbolic link to the custom Nginx configuration
RUN ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app

# Copy the Supervisor configuration file
COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf

# Expose the port for the Nginx server
EXPOSE 80

# Start Supervisor and pass control to it
CMD ["/usr/bin/supervisord"]
