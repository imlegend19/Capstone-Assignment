import unittest

from bookstore.app import *


class BookstoreTest(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        app.config['WTF_CSRF_ENABLED'] = False
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'bookstore.db')

        self.app = app.test_client()
        db.create_all()

    def tearDown(self):
        db.session.remove()
        db.drop_all()

    def test_crud_book(self):
        b1 = Book(title="Book #1")
        b2 = Book(title="Book #2")
        b3 = Book(title="Book #3")

        db.session.add(b1)
        db.session.add(b2)
        db.session.add(b3)
        db.session.commit()

        all_books = Book.query.all()
        self.assertEqual(len(set(all_books).intersection({b1, b2, b3})) == 3, True)

        b1.title = "Updated Book #1"
        db.session.commit()

        self.assertEqual(b1.title, "Updated Book #1")

        db.session.delete(b1)
        db.session.delete(b2)
        #db.session.delete(b3)
        
        db.session.commit()

        all_books = Book.query.all()
        self.assertEqual(len(set(all_books).intersection({b1, b2, b3})) == 0, True)


if __name__ == '__main__':
    unittest.main()
