FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /app/data && chmod 777 /app/data
RUN mkdir -p /app/media && chmod 777 /app/media

RUN python -m playwright install chromium --with-deps

EXPOSE 8000

CMD ["python", "app.py"]