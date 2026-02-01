from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    """Basic endpoint returning a text message."""
    return "Hello from the Azure AKS Flask app!"


if __name__ == "__main__":
    # Run the Flask development server
    app.run(host="0.0.0.0", port=5000)