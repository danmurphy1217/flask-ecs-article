from api.test import bp as test_bp
from flask import Flask
import os

app = Flask(__name__)
app.register_blueprint(test_bp)
app.secret_key = os.urandom(24)