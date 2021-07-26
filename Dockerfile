FROM python:3.9-alpine3.13 as base

WORKDIR /opt/python-api

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir gunicorn

COPY . .

CMD [ "gunicorn", "main:app", "--bind", "0.0.0.0:5000" ]

FROM base as local

COPY requirements-dev.txt ./
RUN pip install --no-cache-dir -r requirements-dev.txt

CMD [ "gunicorn", "main:app", "--bind", "0.0.0.0:5000", "--reload" ]

FROM base
