from flask import Flask, request, jsonify,json
from flask_marshmallow import Marshmallow
import psycopg2.extras
from marshmallow import Schema, fields, validate, validates, validates_schema, ValidationError
from flask_cors import CORS
import os
app = Flask(__name__)

# marshmallow untuk validasi
ma = Marshmallow(app)

# cors
CORS(app)

# sebelum dirun, sesuaikan ini dengan port terlebih dahulu 
def get_db_connection():
    conn = psycopg2.connect(
        host=os.getenv('HOST'),
        database=os.getenv('DBNAME'),
        user=os.getenv('USER'),
        password=os.getenv('PWD'))
    return conn

# setting agar nama field otomatis include di response 



# schema untuk validasi 
project_status = ['Publish', 'Draft', 'Trash']
class articleSchema(Schema):
    id = fields.Int(required=False)
    title = fields.Str(required=True, validate=validate.Length(min=20, max=100))
    content = fields.Str(required=True, validate=validate.Length(min=200))
    category = fields.Str(required=True, validate=validate.Length(min=3))
    status = fields.Str(required=True, validate=validate.OneOf(project_status))

@app.route('/',methods=['GET'])
def intro_handler():
    return jsonify({"messages":"hallo! ini adalah url backend untuk test sharing vision - adi bangkit"})

@app.route('/article/', methods=['POST','GET'])
def article_handler():
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory = psycopg2.extras.RealDictCursor)
    if request.method == "POST":
        # validasi input
        errors = articleSchema().validate(request.json)
        if errors:
            return jsonify({"error":"sorry, there's an error..","message":errors}),422
        _title = request.json['title']
        _content = request.json['content']
        _category = request.json['category']
        _status = request.json['status']
        

        # execute query
        cursor.execute('INSERT INTO posts(title,content,category,status) VALUES (%s,%s,%s,%s)',(_title,_content,_category,_status))

        conn.commit()
        return jsonify({'message': 'success'}), 201
    if request.method == 'GET':
        cursor.execute('SELECT title,content,category,status,id from posts')
        res = cursor.fetchall()
        return jsonify({'data': res}), 201

@app.route('/article/<int:limit>/<int:offset>', methods=['GET'])
def article_pagination(limit,offset):
    conn = get_db_connection()
    cursor =conn.cursor(cursor_factory = psycopg2.extras.RealDictCursor)
    cursor.execute('SELECT title,content,category,status,id  FROM posts LIMIT %s OFFSET %s',(limit,offset))
    res = cursor.fetchall()
    return jsonify({'data':res})

# saya tambahkan satu route untuk list artikel yang di publish, untuk halaman list artikel/preview
@app.route('/status/<string:status>/<int:limit>/<int:offset>', methods=['GET'])
def publish_pagination(status,limit,offset):
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory = psycopg2.extras.RealDictCursor)
    cursor.execute('SELECT title,content,category,status,id  FROM posts WHERE status=%s LIMIT %s OFFSET %s ',(status,limit,offset))
    res = cursor.fetchall()
    return jsonify({'data':res})

@app.route('/status/<string:status>', methods=['GET'])
def publish_all(status):
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory = psycopg2.extras.RealDictCursor)
    cursor.execute('SELECT title,content,category,status,id  FROM posts WHERE status=%s',status)
    res = cursor.fetchall()
    return jsonify({'data':res})

@app.route('/article/<id>', methods=['GET'])
def article_single_handler(id):
    conn = get_db_connection()
    cursor = conn.cursor(cursor_factory = psycopg2.extras.RealDictCursor)
    cursor.execute('SELECT title,content,category,status FROM posts WHERE id = %s',id)
    res = cursor.fetchone()
    if res:
        return jsonify(res)
    else:
        return jsonify({"message":"article not found"})

@app.route('/article/<int:id>', methods=['POST','PUT','PATCH'])
def article_edit_handler(id):
    conn = get_db_connection()
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
     
@app.route('/article/<id>', methods=['DELETE'])
def article_delete_handler(id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM posts WHERE id = %s',[id])
    conn.commit()
    return jsonify({"message":"item deleted"})
     
@app.errorhandler(404)
def handle_404(e):
    # handle all other routes here
    return jsonify({'message':'oops not found'})

if __name__ == '__main__':
    app.run(debug=True)