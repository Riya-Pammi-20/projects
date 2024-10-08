FROM python:3.9

WORKDIR /app

COPY ./app /app

RUN pip install -r requirements.txt

EXPOSE 5000

ENV FLASK_ENV=dev

CMD ["python","app.py"]