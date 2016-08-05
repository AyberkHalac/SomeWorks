import numpy as np
import cv2 
from array import array
from PIL import Image


pwdHar ="/root/opencv/data/haarcascades/"
pwdImg="/root/"
ImgGlasses="g2.png"
ImgPhoto="velet.jpg" #user
ImgChanged="gozluk.png"
ImgNew = "new.png"




def resize_const(name, size):
    im = Image.open(name)
    width, height = im.size
    output = im.resize(size, Image.ANTIALIAS)
    output.save(pwdImg + ImgChanged) #adresi degistir
	

def watermark(name, glasses, coordinate):#kullanici
    image = Image.open(name)
    logo = Image.open(glasses)#gozluk
    image.paste(logo,(coordinate[0],coordinate[1]),logo)
    image.save(pwdImg+ImgNew,'PNG')

def resize_auto(name, size):
    im = Image.open(name)
    wpercent = (size/float(im.size[0]))
    hsize = int((float(im.size[1])*float(wpercent)))
    output = im.resize((size,hsize), Image.ANTIALIAS)
    output.save(pwdImg + ImgChanged) #adresi degistir


face_cascade = cv2.CascadeClassifier(pwdHar+'haarcascade_frontalface_default.xml')
eye_cascade = cv2.CascadeClassifier(pwdHar+ 'haarcascade_eye.xml') 
img = cv2.imread(pwdImg + ImgPhoto)

gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
eyeXY = ()
faces = face_cascade.detectMultiScale(gray, 1.3, 5)
for (x,y,w,h) in faces: 
	cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)
	roi_gray = gray[y:y+h, x:x+w]
	roi_color = img[y:y+h, x:x+w] 
	eyes = eye_cascade.detectMultiScale(roi_gray)

	for (ex,ey,ew,eh) in eyes: 
		cv2.circle(roi_color,((ex+ex+ew)/2+5,(ey+ey+eh)/2), 5, (0,0,255), -1)#goz cerceve
		eyeXY = eyeXY +((ex+ex+ew)/2+5,(ey+ey+eh)/2)
		cv2.rectangle(roi_color,(ex,ey),(ex+ew,ey+eh),(0,75,0),2) #goz bebegi
		print('ex:',ex)
		print('ey:',ey)
		print('ew:',ew)
		print('eh:',eh)
		print('x:',x)
		print('y:',y)
		print('w:',w)
		print('h:',h)
		width = ey
	resize_auto(pwdImg + ImgGlasses,w)#gozluk orjinal
	watermark(pwdImg+ImgPhoto, pwdImg+ImgChanged,(x+4,y+ey))
	#'/home/ayberk/Desktop/gozluk.png' kuculmus gozluk
	#'/home/ayberk/Desktop/shl.jpg' upload olan resim


img2 = cv2.imread(pwdImg+ImgNew)	
cv2.circle(roi_color,((eyeXY[0]+eyeXY[2])/2,(eyeXY[1]+eyeXY[3])/2), 5, (0,0,255), -1)#orta nokta
cv2.imshow('img',img2) 
cv2.waitKey(0) 
cv2.destroyAllWindows()

