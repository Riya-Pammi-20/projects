from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <html>
        <head>
            <title>Simple Flask App</title>
        </head>
        <body>
            <h1>Welcome to My Simple Flask App!</h1>
            <p>This is a sample web application running inside a Docker container.</p>
        </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
