pertama clone repository ini dan  buat virtual enviroment, bisa dilihat code berikut:

```bash
$ git clone https://github.com/adibangkai/flask-sharing-vision.git
$ mkdir myproject
$ cd myproject
$ #mac
$ python3 -m venv venv 
$ . venv/bin/activate
$ #windows
$ py -3 -m venv venv
$ venv\Scripts\activate
```

1. setelah masuk ke venv install library yang dibutuhkan dengan cara menjalankan perintah "pip install -r requirements.txt" pada console
2. untuk migrasi database pertama buka file "create-db.py" kemudian sesuaikan variable host,user,dan password 
3. setelah melakukan setting, migrasi dapat dijalankan dengan perintah "python create_db.py"
4. sebelum server dijalankan buka "app.py" dan setting variable untuk koneksi sql.
5. server bisa dijalankan dengan perintah "flask run" pada console
6. bila terjadi kesalahan bisa hubungi saya atau bisa mencoba versi yang sudah dideploy di url berikut

link backend : https://flask-sharing-vision-production.up.railway.app/

link fronteend : https://frontend-sharing-vision.vercel.app/home

terimakasih banyak.

- adi bangkit
