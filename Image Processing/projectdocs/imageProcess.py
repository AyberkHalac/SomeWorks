import numpy as np
import cv2 
from array import array
from PIL import Image
import os
import time
import MySQLdb


class imageProcess():

	#ImgGlasses="g2.png"
	#ImgPhoto="5.jpg" #user
	#-------------------------
	#ImgChanged="gozluk.png"
	#ImgNew = "new.png"


	pwdHar = "/root/opencv/data/haarcascades/" #sabit degerler degistirilecek
	pwdImg = "/var/www/html/uploads/" # sabit degerler degistirilcek
	pwdGlass = "/var/www/html/glassPNG/"
	pwdImgDest = '/var/www/html/users/'

	def __init__(self, ImgGlasses, ImgPhoto):
		print ImgPhoto+" islenecek"
		self.ImgGlasses = self.pwdGlass+ImgGlasses					#gozluk.jpg
		self.ImgPhoto = ImgPhoto									#pri.jpg
		self.ImgChanged = 'temp.png'								#kucultulmus gozluk

		self.ImgNew = ImgPhoto.split('.')[0] 						#pri	
		self.pwdImgDest = self.pwdImgDest + self.ImgNew + '/'		#/var/www/html/users/pri/


	def resize_const(self, name, size):
		im = Image.open(self.name)
		width, height = im.size
		output = im.resize(self.size, Image.ANTIALIAS)
		output.save(self.pwdImg + self.ImgChanged) #adresi degistir
	

	def watermark(self, name, glasses, coordinate, count):#kullanici
		image = Image.open(name)
		logo = Image.open(glasses)#gozluk
		image.paste(logo,(coordinate[0],coordinate[1]),logo)
		image.save(self.pwdImgDest+self.ImgNew+str(count)+'.png','PNG')


	def resize_auto(self, name, size):
		im = Image.open(name)
		wpercent = (size/float(im.size[0]))
		hsize = int((float(im.size[1])*float(wpercent)))
		output = im.resize((size,hsize), Image.ANTIALIAS)
		output.save(self.pwdImg + self.ImgChanged) #adresi degistir


	def start(self, count):
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

		self.resize_auto(self.ImgGlasses,w)#gozluk orjinal
		self.watermark(self.pwdImg + self.ImgPhoto, self.pwdImg + self.ImgChanged,(x+4,y+ey), count)
		print "-> "+self.ImgPhoto+" islendi"


def executeQuery(sql):
	# Open database connection
	db = MySQLdb.connect("localhost","root","uxVa6ZDrOh","proje" )
	# prepare a cursor object using cursor() method
	cursor = db.cursor()
	# Prepare SQL query to UPDATE required records
	#sql = "UPDATE picture SET userPic = 'uploads_backup/%s' WHERE user = '%s'" % (fname, fname.split('.')[0])
	try:
		# Execute the SQL command
		cursor.execute(sql)
		# Commit your changes in the database
		db.commit()
	except:
		# Rollback in case there is any error
		db.rollback()
		# disconnect from server
		db.close()


if __name__ == "__main__":

	while True:

		BASE_DIR = '/var/www/html/uploads/'

		try:

			for (dirpath, dirnames, filenames) in os.walk(BASE_DIR):
				fname = filenames[0]
				directory = '/var/www/html/users/'+fname.split('.')[0] 
				print filenames
				print directory

				if not os.path.exists(directory):
					os.makedirs(directory)

				if (fname =='temp.png'):	
					os.remove('/var/www/html/uploads/temp.png')

				if not (fname =='temp.png'):

					try:	
						for i in range(1,12):
							obj = imageProcess('g'+str(i)+'.png', fname)
							obj.start(i)
						os.rename(BASE_DIR+fname, '/var/www/html/uploads_backup/'+fname) #backup

						executeQuery("UPDATE picture SET userPic = 'uploads_backup/%s' WHERE user = '%s'" % (fname, fname.split('.')[0]))
						executeQuery("UPDATE user SET size='1' WHERE userName='%s'" % fname.split('.')[0])
					except:
						os.remove('/var/www/html/uploads/'+fname)
						print "exception yedik"
						executeQuery("UPDATE user SET size='-1' WHERE userName='%s'" % fname.split('.')[0])
						break
				break


		except IndexError:
			time.sleep(5)
			print "index error"
