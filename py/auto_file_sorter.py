from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

import json
import os
import time



#under process----------------------
def whenCreated(event):
    print("created")
    
def whenDeleted(event):
    print("deleted")
    
def whenModified(event):
    print("modified")
    
def whenMoved(event):
    print("moved")

#--------------------------------------------





def onChange(event):
    print("in def method...")
    for filename in os.listdir(sourceFolder):
        ogPath = sourceFolder + "/" + filename
        newPath = destinationFolder + "/" + filename
        os.rename(ogPath,newPath)
        print("renamed")


""" 
class ManageResource(FileSystemEventHandler):
    def whenReceived(self,event):
        print("in def method...")
        for filename in os.listdir(sourceFolder):
            ogPath = sourceFolder + "/" + filename
            newPath = destinationFolder + "/" + filename
            os.rename(ogPath,newPath)
            print("renamed")
 """


sourceFolder = "C:/Users/91912/Downloads/srcFolder"
destinationFolder = "C:/Users/91912/Downloads/destFolder"

eventHandler = FileSystemEventHandler()
observer = Observer()

eventHandler.on_created = onChange
eventHandler.on_deleted = onChange
eventHandler.on_modified = onChange
eventHandler.on_moved = onChange

observer.schedule(eventHandler,sourceFolder,recursive=True)
observer.start()


try:
    print("Monitoring")
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    observer.stop()
    print("Ceased")
observer.join()