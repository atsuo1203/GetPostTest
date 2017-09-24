from flask import request, redirect, url_for, make_response, jsonify
from flaskr import app, db
from flaskr.models import User


@app.route('/', methods=['GET', 'POST'])
def show_users():
    if request.method == 'POST':
        name = request.data.get('name', '')
        description = request.data.get('description', '')
        user = User(
            name=name,
            description=description
        )
        db.session.add(user)
        db.session.commit()

    # if method == get
    users = User.query.all()
    results = []
    for user in users:
        result = {
            "id": user.id,
            "name": user.name,
            "description": user.description
        }
        results.append(result)
    return make_response(jsonify(results))


@app.route('/<int:user_id>', methods=['GET', 'PUT', 'DELETE'])
def show_user(user_id):
    # if request == get
    user = User.query.filter_by(id=user_id).first()
    result = {
        "id": user.id,
        "name": user.name,
        "description": user.description
    }
    return make_response(jsonify(result))


@app.route('/add_sample')
def add_sample_user():
    user_id = User.query.count() + 1
    user = User(
        name=str(user_id),
        description='description'
    )
    db.session.add(user)
    db.session.commit()
    return redirect(url_for('show_users'))


@app.route('/delete_all')
def delete_all_user():

    for user in User.query.all():
        db.session.delete(user)
        db.session.commit()

    return redirect(url_for('show_users'))

