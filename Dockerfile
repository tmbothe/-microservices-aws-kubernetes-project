FROM python:3.10-slim-buster

ENV APP_PORT=5153

ENV DB_USERNAME=USERNAME
ENV DB_PASSWORD=PASSWORD

ENV DB_HOST=127.0.0.1

ENV DB_PORT=5432

ENV DB_NAME=postgres

WORKDIR /FlaskApp

COPY /analytics /FlaskApp/analytics

COPY /db /FlaskApp/db

RUN pip install --no-cache-dir -r /FlaskApp/analytics/requirements.txt

EXPOSE 5153

CMD ["python", "/FlaskApp/analytics/app.py"]
