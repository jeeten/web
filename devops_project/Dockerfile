# Dockerfile

# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image

#FROM --platform=$BUILDPLATFORM python:3.7-alpine AS builder
FROM python:3.10
LABEL maintainer="Jeeten <swain.jeeten@gmail.com>"

ENV PYTHONDONTWRITEBYTECODE 1

ENV PYTHONUNBUFFERED 1

RUN mkdir /code

WORKDIR /code

RUN pip install --upgrade pip

COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY . /code/

EXPOSE 8000

#ENTRYPOINT ["python","./manage.py migrate","./manage.py makemigrations", "./manage.py runserver 0.0.0.0:8000"]
#CMD ["python", "manage.py", "migrate"]
#CMD ["python", "manage.py", "makemigrations"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# ["python", "manage.py"]
#
#CMD [ "python", "manage.py runserver 0.0.0.0:8000 --settings=mysite1.settings.prod" ]
