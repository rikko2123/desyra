FROM python:3.12 

WORKDIR /app

# Set environment variables 
# Prevents Python from writing pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1
#Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1 

#run aggiornamenti dei pacchetti linux
RUN  apt-get update && apt-get install -y \
    #installo curl
    && apt-get install -y curl \
    #installo compilatore di c, senza i pacchetti raccomandati
    && apt-get install -y --no-install-recommends gcc \
    #quando compilo un programma in c mi serve questa dipendenza per far capire al compilatore dove trovare librerie e header
    pkg-config \
    default-libmysqlclient-dev \
    build-essential \
    #rimuovo file inutili che appesantiscono la build
    && rm -rf /var/lib/apt/lists/*

#copy dependencies file
COPY requirements.txt .

# Upgrade pip
RUN pip install --upgrade pip

# Copy the Django project  and install dependencies
COPY . /app

# run this command to install all dependencies 
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Django port
EXPOSE 8000

# Run Django’s development server 
#todo DA CAMBIARE QUANDO FARO IL DEPLOY SU CLOUD
# Start the application using Gunicorn
#CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "3", "my_docker_django_app.wsgi:application"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]




