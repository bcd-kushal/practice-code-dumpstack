import os
from PIL import Image

# Set the target dimensions and image mode
target_width, target_height = 128, 128
mode = 'L'

# Set the directory path
dir_path = "C:/Users/91912/Downloads/ImSpliceDataset/"

# Loop through each file in the directory
for filename in os.listdir(dir_path):
    # Check if the file is an image
    if filename.endswith('.bmp') or filename.endswith('.tif'):
        # Open the image
        img_path = os.path.join(dir_path, filename)
        img = Image.open(img_path)

        # Check if the image has the target dimensions
        if img.size != (target_width, target_height):
            # Resize the image
            img = img.resize((target_width, target_height))

        # Convert the image to grayscale
        img = img.convert(mode)

        # Save the modified image
        img.save(img_path)
