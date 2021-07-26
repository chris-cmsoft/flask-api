FROM python:3.9-alpine3.13

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN pip install --no-cache-dir gunicorn

CMD [ "gunicorn", "main:app", "--bind", "0.0.0.0:5000", "--reload" ]
