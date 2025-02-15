# Use the official Python image
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Expose the port (not necessary for Render, but good practice)
EXPOSE 8000

# Run the FastAPI app with a dynamic port
CMD ["sh", "-c", "uvicorn emission_model:app --host 0.0.0.0 --port ${PORT:-8000}"]
