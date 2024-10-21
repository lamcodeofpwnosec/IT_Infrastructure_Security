from flask import Flask, request, abort

app = Flask(__name__)

# Define bad patterns (for SQL injection, XSS, etc.)
BAD_PATTERNS = ["<script>", "SELECT *", "' OR 1=1", "DROP TABLE", "UNION SELECT"]

def is_malicious(payload):
    for pattern in BAD_PATTERNS:
        if pattern.lower() in payload.lower():
            return True
    return False

@app.route('/submit', methods=['POST'])
def submit():
    data = request.form['data']
    if is_malicious(data):
        abort(403)  # Forbidden
    return "Data received safely!"

if __name__ == '__main__':
    app.run(port=8080)
