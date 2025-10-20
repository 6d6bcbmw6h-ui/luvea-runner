from fastapi import FastAPI
from fastapi.responses import JSONResponse
import datetime

app = FastAPI(title="LuvEA Runner")

@app.get("/")
def home():
    return {"status": "running", "time": str(datetime.datetime.utcnow())}

@app.post("/start")
def start_ea():
    print("EA started")
    return JSONResponse({"result": "EA started"})

@app.post("/stop")
def stop_ea():
    print("EA stopped")
    return JSONResponse({"result": "EA stopped"})
