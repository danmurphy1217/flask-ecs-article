from flask import Blueprint

bp = Blueprint('test', __name__, url_prefix='/test')
@bp.route('/ping')
def test():
    return {"foo": "bar"}