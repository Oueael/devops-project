FROM python:3.10

# Set environment variables to prevent Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libssl-dev \
    libffi-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install setuptools and wheel
RUN python -m pip install --upgrade pip setuptools wheel

# Set the working directory in the container to /app
WORKDIR /app

# Copy the requirements.txt file into the working directory
COPY requirements.txt .

# Install the dependencies specified in the requirements.txt file with verbose output
RUN pip install --no-cache-dir -v -r requirements.txt

# Copy all the project files into the working directory
COPY . .

# Expose port 5000 to the host
EXPOSE 5000

# Command to run the Flask application
CMD ["python", "app.py"]
