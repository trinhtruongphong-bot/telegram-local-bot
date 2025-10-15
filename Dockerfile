FROM ubuntu:22.04

RUN apt update && apt install -y git build-essential cmake python3 python3-pip wget unzip

# Cài Telegram Bot API server
RUN git clone https://github.com/tdlib/telegram-bot-api.git /botapi
WORKDIR /botapi
RUN cmake . && cmake --build . --target install

# Cài bot Python
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt

# Chạy song song Local Bot API + bot
CMD /usr/local/bin/telegram-bot-api --api-id=$API_ID --api-hash=$API_HASH --http-port=8081 & python3 main.py
