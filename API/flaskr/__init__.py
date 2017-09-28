from flask import Flask
from flask.ext.sqlalchemy import SQLAlchemy
app = Flask(__name__)
app.config.from_object('flaskr.config')

app.config['JSON_AS_ASCII'] = False   # 日本語文字化け対策
app.config["JSON_SORT_KEYS"] = False  # ソートをそのまま

db = SQLAlchemy(app)

from flaskr import request
