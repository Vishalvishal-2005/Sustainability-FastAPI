# Use the official Python image
FROM python:3.9

# Set environment variables to avoid buffering issues
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Expose the port FastAPI runs on
EXPOSE 8000

# Ensure the app starts correctly
CMD ["uvicorn", "emission_model:app", "--host", "0.0.0.0", "--port", "8000"]
