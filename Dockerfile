FROM ubuntu:22.04

# Imposta non interattivo e installa dipendenze minime
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y wget unzip xvfb xvfb-run wine && \
    rm -rf /var/lib/apt/lists/*

# Crea cartella per MT4
WORKDIR /opt/mt4

# Scarica MT4 portable
RUN wget -O mt4setup.exe "https://download.mql5.com/cdn/web/metaquotes.software.corp/mt4/mt4setup.exe" && \
    xvfb-run wine mt4setup.exe /silent || true

# Copia un semplice script che simula l'esecuzione del bot
COPY run.sh /opt/run.sh
RUN chmod +x /opt/run.sh

# Porta principale (per ping/status)
EXPOSE 8080

CMD ["/opt/run.sh"]
