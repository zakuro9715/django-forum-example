FROM python:3.5
MAINTAINER Takahiro Yaota <zakuro@yuzakuro.me>

RUN pip install --upgrade pip

copy requirements /tmp/requirements

RUN pip install -r /tmp/requirements/general.txt \
                -r /tmp/requirements/prod.txt \
                -c /tmp/requirements/constraints.txt

COPY . /app
RUN python /app/manage.py migrate

WORKDIR /app
CMD ["python", "/app/manage.py", "runserver", "0.0.0.0:8000"]
