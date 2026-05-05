FROM python:3.10-slim
WORKDIR /app

RUN apt-get update && apt-get install -y wget curl unzip gnupg ca-certificates && rm -rf /var/lib/apt/lists/*

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt install -y ./google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb

RUN wget https://storage.googleapis.com/chrome-for-testing-public/142.0.7444.162/linux64/chromedriver-linux64.zip && unzip chromedriver-linux64.zip && mv chromedriver-linux64/chromedriver /usr/bin/chromedriver && chmod +x /usr/bin/chromedriver && rm -rf chromedriver-linux64.zip chromedriver-linux64

RUN pip install --no-cache-dir selenium

COPY firsttest.py .

CMD ["python", "firsttest.py"]
