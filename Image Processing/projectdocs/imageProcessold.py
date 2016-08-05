import numpy as np
import cv2 
from array import array
from PIL import Image


class imageProcess():

	#ImgGlasses="g2.png"
	#ImgPhoto="5.jpg" #user
	#-------------------------
	#ImgChanged="gozluk.png"
	#ImgNew = "new.png"


	pwdHar ="/root/opencv/data/haarcascades/" #sabit degerler degistirilecek
	pwdImg="/root/" # sabit degerler degistirilcek

	def __init__(self, ImgGlasses, ImgPhoto, ImgChanged, ImgNew):
		self.ImgGlasses = ImgGlasses
		self.ImgPhoto = ImgPhoto	
		self.ImgChanged = ImgChanged
		self.ImgNew = ImgNew

	def resize_const(self, name, size):
		im = Image.open(self.name)
		width, height = im.size
		output = im.resize(self.size, Image.ANTIALIAS)
		output.save(self.pwdImg + self.ImgChanged) #adresi degistir
	

	def watermark(self, name, glasses, coordinate):#kullanici
		image = Image.open(name)
		logo = Image.open(glasses)#gozluk
		image.paste(logo,(coordinate[0],coordinate[1]),logo)
		image.save(self.pwdImg + self.ImgNew,'PNG')

	def resize_auto(self, name, size):
		im = Image.open(name)
		wpercent = (size/float(im.size[0]))
		hsize = int((float(im.size[1])*float(wpercent)))
		output = im.resize((size,hsize), Image.ANTIALIAS)
		output.save(self.pwdImg + self.ImgChanged) #adresi degistir

	def start(self):
		face_cascade = cv2.CascadeClassifier(self.pwdHar+'haarcascade_frontalface_default.xml')
		eye_cascade = cv2.CascadeClassifier(self.pwdHar+ 'haarcascade_eye.xml') 
		img = cv2.imread(self.pwdImg + self.ImgPhoto)

		gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
		eyeXY = ()
		faces = face_cascade.detectMultiScale(gray, 1.3, 5)
		for (x,y,w,h) in faces: 
		    cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)
		roi_gray = gray[y:y+h, x:x+w]
		roi_color = img[y:y+h, x:x+w] 
		eyes = eye_cascade.detectMultiScale(roi_gray)

		for (ex,ey,ew,eh) in eyes: 
			eyeXY = eyeXY +((ex+ex+ew)/2+5,(ey+ey+eh)/2)
		self.resize_auto(self.pwdImg + self.ImgGlasses,w)#gozluk orjinal
		self.watermark(self.pwdImg + self.ImgPhoto, self.pwdImg + self.ImgChanged,(x+4,y+ey))


if __name__ == "__main__":
	obj = imageProcess('g2.png','velet.jpg','gozluk.png','ayberk.png')
	obj.start()
