from fastapi import FastAPI, UploadFile, File
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import tensorflow as tf
from fluency_meter_eng import prediction, visualize, vidtoaudio
import uvicorn
from pydub import AudioSegment
import os
from supabase.client import Client, create_client
from dotenv import load_dotenv
from pydantic import BaseModel

load_dotenv()

app = FastAPI()
new_model = tf.keras.models.load_model('my_model.h5')

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods
    allow_headers=["*"],  # Allows all headers
)

supabase_url = os.getenv("SUPABASE_URL")
supabase_key = os.getenv("SUPABASE_SERVICE_KEY")

supabase: Client = create_client(supabase_url, supabase_key)

@app.get('/')
def check():
    return {"hello world"}

class Job(BaseModel):
    title: str
    description: str
    salary: int
    description: str
    
@app.post('/jobs')
def create_job(Job: Job):
    data = {
        "title": Job.title,
        "location": Job.description,
        "salary": Job.salary,
        "description": Job.description
    }
    supabase.table("jobs").insert(data).execute()

@app.get('/jobs')
def get_jobs():
    response = supabase.table("jobs").select("*").execute()
    return response

@app.post('/signup')
def signup(email: str, password: str):
    data = {
        "email": email,
        "password": password
    }
    res = supabase.auth.sign_up(data)
    return res

@app.get('/login')
def login(email: str, password: str):
    data = {
        "email": email,
        "password": password
    }
    res = supabase.auth.sign_in_with_password(data)
    return res
    
@app.post('/fluency')
async def fluency(file: UploadFile = File(...)):
    try:
        if file.filename.endswith('.aac'):
            file_location = f"temp_{file.filename}"
            with open(file_location, "wb") as f:
                f.write(await file.read())

            try:
                wav_audio = AudioSegment.from_file(file_location, format="aac")
                print("Converted AAC to WAV successfully")
                
                mp3_location = file_location.replace('.aac', '.mp3')
                wav_audio.export(mp3_location, format="mp3")
                print("Converted WAV to MP3 successfully")
                
                raw_audio = AudioSegment.from_file(mp3_location, format="mp3")
                raw_audio = raw_audio.set_frame_rate(44100).set_channels(2).set_sample_width(2)
                print("Audio processing complete")
                
            except Exception as e:
                return JSONResponse(status_code=500, content={"error": f"Audio conversion failed: {str(e)}"})

            n = await prediction(mp3_location, new_model)
            data = visualize(n)
            
            # Clean up temporary files
            os.remove(file_location)
            os.remove(mp3_location)
            
            return JSONResponse(status_code=200, content={"Fluency Result": data})

        elif file.filename.endswith('.mp4'):
            file_location = f"temp_{file.filename}"
            with open(file_location, "wb") as f:
                f.write(await file.read())

            vidtoaudio(file_location)
            n = await prediction('output.mp3', new_model)
            data = visualize(n)
            os.remove(file_location)
            return JSONResponse(status_code=200, content={"Fluency Result": data})

        else:
            return JSONResponse(status_code=400, content={"error": "Unsupported file format"})
    except Exception as e:
        return JSONResponse(status_code=500, content={"error": str(e)})

if __name__ == "__main__":
    uvicorn.run("main:app", host="10.9.15.155", port=8000, reload=True)
