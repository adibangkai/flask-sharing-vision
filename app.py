from flask import Flask, request, jsonify,json
from flaskext.mysql import MySQL
from pymysql.cursors import DictCursor
from flask_marshmallow import Marshmallow
from marshmallow import Schema, fields, validate, validates, validates_schema, ValidationError
from flask_cors import CORS

app = Flask(__name__)

# marshmallow untuk validasi
ma = Marshmallow(app)

# cors
CORS(app)

# sebelum dirun, sesuaikan ini dengan port terlebih dahulu 
app.config['MYSQL_DATABASE_USER']='root'
app.config['MYSQL_DATABASE_PASSWORD']=''
app.config['MYSQL_DATABASE_DB']='articledb'
app.config['MYSQL_DATABASE_HOST']='localhost'

# setting agar nama field otomatis include di response 
mysql = MySQL(cursorclass=DictCursor)

mysql.init_app(app)
conn = mysql.connect()


# schema untuk validasi 
project_status = ['Publish', 'Draft', 'Trash']
class articleSchema(Schema):
    id = fields.Int(required=False)
    title = fields.Str(required=True, validate=validate.Length(min=20, max=100))
    content = fields.Str(required=True, validate=validate.Length(min=200))
    category = fields.Str(required=True, validate=validate.Length(min=3))
    status = fields.Str(required=True, validate=validate.OneOf(project_status))


@app.route('/article/', methods=['POST','GET'])
def article_handler():
    if request.method == "POST":
        # validasi input
        errors = articleSchema().validate(request.json)
        if errors:
            return jsonify({"error":"ada yang salah pada inputan anda","message":errors}),422
        _title = request.json['title']
        _content = request.json['content']
        _category = request.json['category']
        _status = request.json['status']
        
        cursor = conn.cursor()

        # execute query
        cursor.execute('INSERT INTO posts(title,content,category,status) VALUES (%s,%s,%s,%s)',(_title,_content,_category,_status))

        conn.commit()
        return jsonify({'message': 'sucess'}), 201
    if request.method == 'GET':
        cursor = conn.cursor()
        cursor.execute('SELECT title,content,category,status,id from posts')
        hasil = cursor.fetchall()
        return jsonify({'data': hasil}), 201

@app.route('/article/<int:limit>/<int:offset>', methods=['GET'])
def article_pagination(limit,offset):

    cursor = conn.cursor()
    cursor.execute('SELECT title,content,category,status,id  FROM posts LIMIT %s OFFSET %s',(limit,offset))
    hasil = cursor.fetchall()
    return jsonify({'data':hasil})

# saya tambahkan satu route untuk list artikel yang di publish, untuk halaman list artikel/preview
@app.route('/published/<int:limit>/<int:offset>', methods=['GET'])
def publish_pagination(limit,offset):

    cursor = conn.cursor()
    cursor.execute('SELECT title,content,category,status,id  FROM posts WHERE status="Publish" LIMIT %s OFFSET %s ',(limit,offset))
    hasil = cursor.fetchall()
    return jsonify({'data':hasil})

@app.route('/article/<int:id>', methods=['GET'])
def article_single_handler(id):
    cursor = conn.cursor()
    cursor.execute('SELECT title,content,category,status FROM posts WHERE id = %s',id)
    hasil = cursor.fetchone()
    return jsonify(hasil)

@app.route('/article/<int:id>', methods=['POST','PUT','PATCH'])
def article_edit_handler(id):
    errors = articleSchema().validate(request.json)
    if errors:
        return errors, 422
    _title = request.json['title']
    _content = request.json['content']
    _category = request.json['category']
    _status = request.json['status']
    cursor = conn.cursor()
    cursor.execute('UPDATE posts SET title = %s,content = %s,category = %s,status= %s  WHERE id = %s',(_title,_content,_category,_status,id))
    conn.commit()

    return jsonify({"message":"success"})
     
@app.route('/article/<int:id>', methods=['DELETE'])
def article_delete_handler(id):
    cursor = conn.cursor()
    cursor.execute('DELETE FROM posts WHERE id = %s',(id))
    conn.commit()

    return jsonify({"message":"item deleted"})
     


if __name__ == '__main__':
    app.run(debug=True)