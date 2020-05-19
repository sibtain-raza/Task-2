from flask import Flask, request, flash, url_for, redirect, render_template
from flask_sqlalchemy import SQLAlchemy
from flask_basicauth import BasicAuth
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///soldier.sqlite3'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = "random string"
app.config['BASIC_AUTH_USERNAME'] = 'sibtain'
app.config['BASIC_AUTH_PASSWORD'] = '773927'

basic_auth = BasicAuth(app)

db = SQLAlchemy(app)


class soldiers(db.Model):
   id = db.Column('soldier_id', db.Integer, primary_key = True)
   username = db.Column(db.String(100))
   date = db.Column(db.DateTime(), default=datetime.utcnow ) 
   complain = db.Column(db.String(200))
   Id = db.Column(db.String(10))
   
   def __init__(self, username, complain, Id):
       self.username = username
       self.complain = complain
       self.Id = Id
       
   def __str__(self):
       return "{} {} {} {}".format(self.username,self.complain,self.Id)
@app.route('/')
def home():
   return render_template('home.html', soldiers = soldiers.query.all()  )

@app.route('/cheif')
@basic_auth.required
def cheif():
   return render_template('cheif.html', soldiers = soldiers.query.all()  )

@app.route('/complain', methods = ['GET', 'POST'])

def complain():
   if request.method == 'POST':
      if not request.form['username'] or not request.form['complain']:
         flash('Please enter all the fields', 'error')
      else:
         soldier = soldiers(request.form['username'],
            request.form['complain'], request.form['Id'])
         
         db.session.add(soldier)
         db.session.commit()
         flash('Record was successfully added')
         return redirect(url_for('home'))
   return render_template('complain.html')

if __name__ == '__main__':
   db.create_all()
   app.run(debug = True,host='0.0.0.0' )

