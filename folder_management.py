from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

import json
import os
import time

class ManageResource(FileSystemEventHandler):
    def whenReceived(self,event):
        print("in def method...")
        for filename in os.listdir(sourceFolder):
            ogPath = sourceFolder + "/" + filename
            newPath = destinationFolder + "/" + filename
            os.rename(ogPath,newPath)
            print("renamed")

sourceFolder = "C:/Users/91912/Downloads/srcFolder"
destinationFolder = "C:/Users/91912/Downloads/destFolder"

eventHandler = ManageResource()
observer = Observer()

observer.schedule(eventHandler,path=sourceFolder,recursive=True)
print("1\n")
observer.start()
print("2\n")


try:
    print("Monitoring")
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    observer.stop()
    print("Ceased")
observer.join()