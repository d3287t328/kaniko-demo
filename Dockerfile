# Use a minimal base image
FROM python:3.11-slim

# Create a non-root user
RUN useradd -m myuser
USER myuser

# Install Flask without saving package cache
RUN pip install --no-cache-dir flask

# Set the working directory
WORKDIR /app

# Copy the application into the container as non-root user
COPY --chown=myuser:myuser app.py .

# Use an array for the entrypoint to ensure signals are passed correctly
ENTRYPOINT ["python", "app.py"]
