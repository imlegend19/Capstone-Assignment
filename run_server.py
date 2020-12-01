from sys import path 
path.append("src/main/python")

from bookstore.app import app
app.run(host='0.0.0.0', port=5000, debug=True)
