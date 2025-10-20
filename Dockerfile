FROM python:3.11-slim

# Installa dipendenze
RUN pip install fastapi uvicorn

# Copia il server
WORKDIR /app
COPY server.py /app/server.py

# Espone la porta
EXPOSE 8080

# Avvia l'app
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8080"]
