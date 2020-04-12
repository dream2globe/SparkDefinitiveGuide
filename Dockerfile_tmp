FROM python:3.7.6-buster
LABEL maintainer="shyeon.kang@gmail.com" 

## does not need to install at python 3.7.6 images
# RUN apt-get update && apt-get install -y \
#     python3-dev \
#     default-libmysqlclient-dev \
#     build-essential && rm -rf /var/lib/apt/lists/*

RUN pip --no-cache-dir install \
    flask \
    flask_restful \
    sqlalchemy \
    mysqlclient \
    bcrypt \
    PyJWT

# for development
RUN mkdir app
WORKDIR /app

## for releaseFrom
# COPY ./app /app/
# WORKDIR /app

## moved to docker-compose.yml
# ENTRYPOINT ["python"]
# CMD ["app.py"]