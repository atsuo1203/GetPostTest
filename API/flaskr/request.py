from flask import request, redirect, url_for, make_response, jsonify
from flaskr import app, db
from flaskr.models import Entry


@app.route('/', methods=['GET', 'POST'])
def show_entries():
    if request.method == 'POST':
        name = request.data.get('name', '')
        description = request.data.get('description', '')
        entry = Entry(
            name=name,
            description=description
        )
        db.session.add(entry)
        db.session.commit()

    # if method == get
    entries = Entry.query.all()
    results = []
    for entry in entries:
        result = {
            "name": entry.name,
            "description": entry.description
        }
        results.append(result)
    return make_response(jsonify(results))


@app.route('/<int:user_id>', methods=['GET', 'PUT', 'DELETE'])
def add_entry():
    entry_id = Entry.query.count() + 1
    entry = Entry(
        name=str(entry_id),
        description='description'
    )
    db.session.add(entry)
    db.session.commit()
    return redirect(url_for('show_entries'))


@app.route('/add_sample')
def add_sample_entry():
    entry_id = Entry.query.count() + 1
    entry = Entry(
        name=str(entry_id),
        description='description'
    )
    db.session.add(entry)
    db.session.commit()
    return redirect(url_for('show_entries'))


@app.route('/delete_all')
def delete_all_entry():

    for entry in Entry.query.all():
        db.session.delete(entry)
        db.session.commit()

    return redirect(url_for('show_entries'))

