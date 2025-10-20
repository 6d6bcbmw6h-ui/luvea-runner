FROM ubuntu:22.04

RUN apt update && apt install -y xvfb wine wget unzip && \
    echo "Wine installed successfully" && \
    mkdir /root/mt4 && cd /root/mt4 && \
    wget https://download.mql5.com/cdn/web/metaquotes.software.corp/mt4/mt4setup.exe && \
    wine mt4setup.exe /silent || true

CMD bash -c "xvfb-run winecfg && sleep infinity"
