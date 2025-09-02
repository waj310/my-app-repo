# Start from a lightweight Python base
FROM python:3.9-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements first (better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app code
COPY . .

# Expose port (Flask default 5000 → we map to 80 in Kubernetes)
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]

