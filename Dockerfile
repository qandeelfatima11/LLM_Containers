# Use a smaller base image like python:3.9-slim
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py

# Copy the requirements file into the container
COPY requirements.txt ./

# Install Python dependencies, including PyTorch
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app/main.py
ENV PYTHONPATH=/usr/src/app

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]
