# Generate a response
curl https://api.atlasflux.my/v1/responses \
  -H "Authorization: Bearer $ATLASFLUX_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "input": "Hello, what can you do?",
    "max_output_tokens": 256
  }'

# With reasoning
curl https://api.atlasflux.my/v1/responses \
  -H "Authorization: Bearer $ATLASFLUX_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "input": "Explain quantum computing",
    "reasoning": {"effort": "medium"},
    "max_output_tokens": 512
  }'

# With web search
curl https://api.atlasflux.my/v1/responses \
  -H "Authorization: Bearer $ATLASFLUX_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "input": "What happened in Malaysia today?",
    "web_search": {"mode": "auto", "search_depth": "fast"},
    "max_output_tokens": 512
  }'

# Chat completions (OpenAI-compatible)
curl https://api.atlasflux.my/v1/chat/completions \
  -H "Authorization: Bearer $ATLASFLUX_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [
      {"role": "system", "content": "You are a helpful assistant."},
      {"role": "user", "content": "What is the capital of Malaysia?"}
    ],
    "max_tokens": 256,
    "temperature": 0.7
  }'

# List models
curl https://api.atlasflux.my/v1/models \
  -H "Authorization: Bearer $ATLASFLUX_API_KEY"

# Streaming
curl https://api.atlasflux.my/v1/chat/completions \
  -H "Authorization: Bearer $ATLASFLUX_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [{"role": "user", "content": "Tell me a story"}],
    "stream": true
  }'
