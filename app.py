from flask import Flask, jsonify
from flask_cors import CORS, cross_origin

app = Flask(__name__)
cors = CORS(app)
app.config['JSONIFY_PRETTYPRINT_REGULAR'] = False
app.config['CORS_HEADERS'] = 'Content-Type'

@app.route('/')
@cross_origin()
def hello_world():
    response = jsonify({'data': 'Hey, am from cloud. Welcome to world'})
    return response

if __name__=='__main__':
        app.run(debug=True, host='0.0.0.0')

