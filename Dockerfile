FROM python:3.12-slim
WORKDIR /app

# get curl for healtcheck and update package list, rm /var/lib/apt/lists to reduce final image size
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*


# Copy the current directory contents into the container at /app
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8080 for the Flask server
EXPOSE 8080

# Command to run the Flask server
CMD ["sh", "-c", "flask run -h 0.0.0.0 -p 8080 --debug"]

# Healthcheck configuration
HEALTHCHECK --interval=10s --timeout=5s --retries=5 --start-period=60s \
    CMD curl --fail http://127.0.0.1:8080/test/ping || exit 1
