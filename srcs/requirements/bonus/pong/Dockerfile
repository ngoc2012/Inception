# Use Debian Buster as the base image
FROM debian:buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        python3 \
        python3-pip \
        python3-dev \
        libffi-dev \
        libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY ./conf/requirements.txt /app/
RUN pip3 install --upgrade pip \
    && pip3 install Django && \
    pip3 install channels daphne \
    && pip3 install requests

# Set the working directory
WORKDIR /app/backend

# Expose the port that Daphne will run on
EXPOSE 8000

# Run Daphne as the default command
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]