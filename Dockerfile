ARG PYTHON_VERSION=3.9.10

FROM python:${PYTHON_VERSION}

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-venv \
    python3-dev \
    python3-setuptools \
    python3-wheel

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .


EXPOSE 8080
ENTRYPOINT python manage.py runserver 0.0.0.0:8080
