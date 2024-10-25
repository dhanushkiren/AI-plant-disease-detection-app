from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
import uvicorn
import cv2
import numpy as np
import tensorflow as tf
import pandas as pd
import os

app = FastAPI()

# Enable CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Load your model and CSV file
model = tf.keras.models.load_model('./myModel.h5')
df = pd.read_csv('./p4.csv')

# Preprocess image as per model's requirement
def preprocess_image(image_path):
    image = cv2.imread(image_path)
    image = cv2.resize(image, (224, 224))
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    image = image.astype(np.float32)
    image = np.expand_dims(image, axis=0)
    return image

@app.get("/get")
async def get():
    return JSONResponse(content={"message": "API is hitting perfectly"})

@app.post("/predict")
async def predict(image: UploadFile = File(...)):
    image_path = f"./{image.filename}"
    
    # Save the uploaded image
    with open(image_path, "wb") as image_file:
        content = await image.read()
        image_file.write(content)
    print(f"Image saved at: {image_path}")
    
    # Preprocess the image and make a prediction
    processed_image = preprocess_image(image_path)
    prediction = model.predict(processed_image)

    # Get the top 3 predictions
    top3_indices = np.argsort(prediction[0])[-3:][::-1]
    top3_class_names = [df.iloc[i]['Label'] for i in top3_indices]
    top3_scores = prediction[0][top3_indices]
    top3_percentages = top3_scores / np.sum(top3_scores) * 100

    # Prepare the response
    response = {}
    for i in range(3):
        index = top3_indices[i]
        treatment = df.iloc[index]['Treatment']
        if pd.isna(treatment):
            treatment = "No treatment needed"

        response[f"prediction_{i+1}"] = {
            "class_name": top3_class_names[i],
            "confidence": f"{top3_percentages[i]:.2f}%",
            "example_picture": df.iloc[index]['Example Picture'],
            "description": df.iloc[index]['Description'],
            "prevention": df.iloc[index]['Prevention'],
            "treatment": treatment
        }
    
    # Delete the saved image after processing
    os.remove(image_path)

    return JSONResponse(content=response)

if __name__ == "_main_":
    uvicorn.run(app, host="0.0.0.0", port=80)