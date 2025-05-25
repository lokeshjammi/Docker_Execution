FROM python:3.10-slim

RUN apt-get update && apt-get install -y firefox-esr curl unzip xvfb \
    && rm -rf /var/lib/apt/lists/*

RUN GECKO_VER=$(curl -s https://api.github.com/repos/mozilla/geckodriver/releases/latest | grep '"tag_name":' | cut -d '"' -f 4) && \
    curl -L "https://github.com/mozilla/geckodriver/releases/download/${GECKO_VER}/geckodriver-${GECKO_VER}-linux64.tar.gz" | tar xz && \
    mv geckodriver /usr/local/bin/

WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt

CMD ["behave"]