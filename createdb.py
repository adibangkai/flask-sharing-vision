import psycopg2
conn = psycopg2.connect(
        host="dpg-cgf6bbo2qv28tc5vlfcg-a.singapore-postgres.render.com",
        database="sharingvisiontest",
        user='sharingvisiontest_user',
        password='MO5X7y0Zs0RvxcuhEalnwFltSRw7VSZ9')

# Open a cursor to perform database operations
cur = conn.cursor()

# Execute a command: this creates a new table

cur.execute('CREATE TABLE posts ('
'id serial  PRIMARY KEY,'
'title VARCHAR(255),'
'content TEXT,'
'category VARCHAR(100),'
'created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,'
'updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,'
'status VARCHAR(100))'
)

conn.commit()

cur.close()
conn.close()