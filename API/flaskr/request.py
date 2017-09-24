from flask import redirect, url_for, make_response, jsonify
from flaskr import app, db
from flaskr.models import Entry


@app.route('/')
def show_entries():
    entries = Entry.query.all()
    results = []

    for entry in entries:
        result = {
            "name": entry.name,
            "description": entry.description
        }
        results.append(result)

    return make_response(jsonify(results))


@app.route('/add', methods=['GET', 'POST'])
def add_entry():
    entry_id = Entry.query.count() + 1
    entry = Entry(
        name=str(entry_id),
        description='description'
    )
    db.session.add(entry)
    db.session.commit()
    return redirect(url_for('show_entries'))


@app.route('/delete_all', methods=['GET', 'POST'])
def delete_all_entry():

    for entry in Entry.query.all():
        db.session.delete(entry)
        db.session.commit()

    return redirect(url_for('show_entries'))

