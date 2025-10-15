FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y ffmpeg git curl wget imagemagick build-essential gcc g++ libpq-dev libssl-dev pkg-config libsndfile1 && rm -rf /var/lib/apt/lists/*
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
COPY pyproject.toml ./
RUN pip install --no-cache-dir .
COPY . .
CMD ["python","-m","opencontext.cli"]