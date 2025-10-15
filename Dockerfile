FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y ffmpeg git curl wget imagemagick build-essential gcc g++ libpq-dev libssl-dev pkg-config libsndfile1 && rm -rf /var/lib/apt/lists/*
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python","app.py"]