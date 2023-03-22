import mysql.connector
import os

# sebelum dijalankan, sesuaikan ini port, user dan password terlebih dahulu
mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    passwd='',
)


my_cursor = mydb.cursor()

# perintah create db
my_cursor.execute('CREATE DATABASE articledb')
mydb.commit()

# perintah use db
my_cursor.execute("""USE articledb""")
mydb.commit()

# perintah buat table posts

my_cursor.execute("""CREATE TABLE posts (
id INTEGER AUTO_INCREMENT,
title VARCHAR(255),
content TEXT,
category VARCHAR(100),
created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
status ENUM("Publish","Draft","Trash"),
PRIMARY KEY (id)
)""")
mydb.commit()

# cek database berhasil dibuat atau tidak
my_cursor.execute('SHOW DATABASES')
for db in my_cursor:
    print(db)