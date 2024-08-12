# Grab the latest alpine image
FROM alpine:latest

# Install python, pip, and other dependencies
RUN apk add --no-cache --update python3 py3-pip bash

# Create a directory for the app
WORKDIR /opt/webapp

# Create a virtual environment and install dependencies
RUN python3 -m venv /venv
ADD ./webapp/requirements.txt /opt/webapp/requirements.txt
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

# Add the rest of the code
ADD ./webapp /opt/webapp/

# Change ownership to the non-root user
RUN adduser -D myuser && chown -R myuser:myuser /opt/webapp

# Switch to the non-root user
USER myuser

# Run the app with Gunicorn			
CMD /venv/bin/gunicorn --bind 0.0.0.0:$PORT wsgi 

