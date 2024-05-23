import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from flask import Flask, request, jsonify
from model.model import LLMModel

app = Flask(__name__)
model = LLMModel()

@app.route('/generate', methods=['POST'])
def generate():
    data = request.get_json()
    prompt = data['prompt']
    response = model.generate_text(prompt)
    return jsonify({'response': response})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
