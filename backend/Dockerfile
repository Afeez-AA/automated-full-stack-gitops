FROM python:3.10

WORKDIR /app/

RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

COPY ./pyproject.toml ./poetry.lock* /app/

RUN poetry install --no-root --only main

ENV PYTHONPATH=/app

COPY ./alembic.ini /app/
COPY ./prestart.sh /app/
COPY ./app /app/app

# Ensure prestart.sh is executable
RUN chmod +x /app/prestart.sh

# Override the CMD to run the prestart.sh script and then start Uvicorn
CMD ["/bin/bash", "-c", "/app/prestart.sh && uvicorn app.main:app --host 0.0.0.0 --port 8000"]