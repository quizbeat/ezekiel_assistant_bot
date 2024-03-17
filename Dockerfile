FROM python:3.8-slim

ENV PYTHONFAULTHANDLER=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONHASHSEED=random
ENV PYTHONDONTWRITEBYTECODE 1
ENV PIP_NO_CACHE_DIR=off
ENV PIP_DISABLE_PIP_VERSION_CHECK=on
ENV PIP_DEFAULT_TIMEOUT=100

ENV ALLOWED_TELEGRAM_USERNAMES=${ALLOWED_TELEGRAM_USERNAMES}
ENV BOT_ADMIN_ID=${BOT_ADMIN_ID}
ENV NEW_DIALOG_TIMEOUT=${NEW_DIALOG_TIMEOUT}

ENV EPISODES_CHAT_ID=${EPISODES_CHAT_ID}
ENV EPISODES_TOC_MESSAGE_ID=${EPISODES_TOC_MESSAGE_ID}

ENV LOG_LEVEL=${LOG_LEVEL}

ENV TELEGRAM_TOKEN=${TELEGRAM_TOKEN}
ENV OPENAI_API_KEY=${OPENAI_API_KEY}
ENV FIREBASE_CREDENTIALS=${FIREBASE_CREDENTIALS}

RUN apt-get update
RUN apt-get install -y python3 python3-pip build-essential python3-venv ffmpeg

RUN mkdir -p /code
ADD . /code
WORKDIR /code

RUN pip3 install -r requirements.txt

CMD ["python3", "bot/bot.py"]