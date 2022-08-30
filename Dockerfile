FROM python:3.10-alpine as base
RUN apk add --update --virtual .build-deps \
    build-base \
    postgresql-dev \
    python3-dev \
    libpq

COPY requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt

# Now multistage build
FROM python:3.10-alpine
RUN apk add libpq
RUN mkdir /code/
WORKDIR /code/
COPY --from=base /usr/local/lib/python3.10/site-packages/ /usr/local/lib/python3.10/site-packages/
COPY --from=base /usr/local/bin/ /usr/local/bin/
COPY . /code
ENV PYTHONUNBUFFERED 1
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]