import requests
import os

API_KEY = os.environ["ATLASFLUX_API_KEY"]
BASE_URL = "https://api.atlasflux.my"

# Generate a response
response = requests.post(
    f"{BASE_URL}/v1/responses",
    headers={
        "Content-Type": "application/json",
        "Authorization": f"Bearer {API_KEY}",
    },
    json={
        "input": "Hello, what can you do?",
        "max_output_tokens": 256,
    },
)

if not response.ok:
    error = response.json()
    raise Exception(error["error"]["message"])

data = response.json()
print(data["output_text"])

# Chat completions
chat_response = requests.post(
    f"{BASE_URL}/v1/chat/completions",
    headers={
        "Content-Type": "application/json",
        "Authorization": f"Bearer {API_KEY}",
    },
    json={
        "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "What is the capital of Malaysia?"},
        ],
        "max_tokens": 256,
        "temperature": 0.7,
    },
)

chat_data = chat_response.json()
print(chat_data["choices"][0]["message"]["content"])

# With web search
search_response = requests.post(
    f"{BASE_URL}/v1/responses",
    headers={
        "Content-Type": "application/json",
        "Authorization": f"Bearer {API_KEY}",
    },
    json={
        "input": "What happened in Malaysia today?",
        "web_search": {"mode": "auto", "search_depth": "fast"},
        "max_output_tokens": 512,
    },
)

search_data = search_response.json()
print(search_data["output_text"])
print("Citations:", search_data["citations"])
