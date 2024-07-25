from fastapi import FastAPI, UploadFile, File
from fastapi.responses import JSONResponse
import tensorflow as tf
from fluency_meter_eng import prediction, visualize, vidtoaudio
import uvicorn

app = FastAPI()
new_model = tf.keras.models.load_model('my_model.h5')

@app.get('/')
def check():
    return {"hello world"}

@app.post('/fluency')
async def fluency(file: UploadFile = File(...)):
    try:
        if file.filename.endswith('.mp3'):
            file_location = f"temp_{file.filename}"
            with open(file_location, "wb") as f:
                f.write(await file.read())

            n = await prediction(file_location, new_model)
            data = visualize(n)
            return JSONResponse(status_code=200, content={"Fluency Result": data})

        elif file.filename.endswith('.mp4'):
            file_location = f"temp_{file.filename}"
            with open(file_location, "wb") as f:
                f.write(await file.read())

            vidtoaudio(file_location)
            n = await prediction('output.mp3', new_model)
            data = visualize(n)
            return JSONResponse(status_code=200, content={"Fluency Result": data})

        else:
            return JSONResponse(status_code=500, content={"Good words": "MKL dhangh ki file bejh de"})
    except Exception as e:
        return JSONResponse(status_code=500, content={"error": str(e)})

if __name__ == "__main__":
    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)