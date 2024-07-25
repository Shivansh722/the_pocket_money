import moviepy.editor as mp
import librosa
import numpy as np
import matplotlib.pyplot as plt

def vidtoaudio(filename):
    video = mp.VideoFileClip(filename)
    video.audio.write_audiofile(r"output.mp3")

async def feature_extraction2(file_name):
    X, sample_rate = librosa.load(file_name, sr=None)
    if X.ndim > 1:
        X = X[:, 0]
    X = X.T

    mfccs = np.mean(librosa.feature.mfcc(y=X, sr=sample_rate, n_mfcc=20).T, axis=0)
    rmse = np.mean(librosa.feature.rms(y=X).T, axis=0)
    spectral_flux = np.mean(librosa.onset.onset_strength(y=X, sr=sample_rate).T, axis=0)
    zcr = np.mean(librosa.feature.zero_crossing_rate(y=X).T, axis=0)

    return mfccs, rmse, spectral_flux, zcr

async def prediction(fname, new_model):
    mfccs, rmse, spectral_flux, zcr = await feature_extraction2(fname)
    extracted_features = np.hstack([mfccs, rmse, spectral_flux, zcr])
    pp2 = extracted_features.reshape(1, -1)
    c = new_model.predict(pp2)
    return np.argmax(c)

def visualize(level):
    if level == 0:
        return "red"
    elif level == 1:
        return "yellow"
    else:
        return "green"