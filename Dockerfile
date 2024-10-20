FROM python:3.7.12-slim-buster

WORKDIR /app

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y ffmpeg && \
    apt-get install -y gcc ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 8501

ENTRYPOINT [ "streamlit", "run" ]

CMD ["main.py"]