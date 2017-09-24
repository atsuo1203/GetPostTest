from flaskr import db


class Entry(db.Model):
    __tablename__ = 'entries'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Text)
    description = db.Column(db.Text)

    def __repr__(self):
        return '<Entry id={id} name={name!r}>'.format(
                id=self.id, name=self.name)


def init():
    db.create_all()
