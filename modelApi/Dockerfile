# Use Python 3.10 as a parent image to be compatible with TensorFlow 2.15.0
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Install necessary system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements.txt file into the container
COPY ./requirements.txt /app/requirements.txt

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /app/requirements.txt

# Copy the rest of the FastAPI app code into the container
COPY . /app

# Expose the port that FastAPI will run on
EXPOSE 8000

# Command to run the FastAPI server
CMD ["uvicorn", "predict:app", "--host", "0.0.0.0", "--port", "8000"]
