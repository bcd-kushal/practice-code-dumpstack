import os
from PIL import Image

# Specify the path of the directory containing the images
directory = "C:/Users/91912/Downloads/ImSpliceDataset/authentic"

# Loop through all files in the directory
for file in os.listdir(directory):
    if file.endswith('.tif') or file.endswith('.bmp'):
        # Open the image
        image = Image.open(os.path.join(directory, file))
        
        # Rotate the image by 90 degrees
        rotated_image = image.rotate(90, expand=True)
        
        # Get the new filename
        filename, ext = os.path.splitext(file)
        new_filename = f"{filename}_rotated{ext}"
        
        # Save the rotated image in the same directory with a new filename
        rotated_image.save(os.path.join(directory, new_filename))
