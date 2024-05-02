# Use the official Python image with version 3.11.9-slim
FROM python:3.11.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt /app/requirements.txt

# Install dependencies from the requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application's code to the working directory
COPY . /app

# Command to run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=80", "--debug"]
