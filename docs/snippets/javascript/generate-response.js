// Generate a response
const response = await fetch("https://api.atlasflux.my/v1/responses", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    Authorization: `Bearer ${process.env.ATLASFLUX_API_KEY}`,
  },
  body: JSON.stringify({
    input: "Hello, what can you do?",
    max_output_tokens: 256,
  }),
});

if (!response.ok) {
  const error = await response.json();
  throw new Error(error.error.message);
}

const data = await response.json();
console.log(data.output_text);

// Chat completions
const chatRes = await fetch("https://api.atlasflux.my/v1/chat/completions", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    Authorization: `Bearer ${process.env.ATLASFLUX_API_KEY}`,
  },
  body: JSON.stringify({
    messages: [
      { role: "system", content: "You are a helpful assistant." },
      { role: "user", content: "What is the capital of Malaysia?" },
    ],
    max_tokens: 256,
    temperature: 0.7,
  }),
});

const chatData = await chatRes.json();
console.log(chatData.choices[0].message.content);

// With web search
const searchRes = await fetch("https://api.atlasflux.my/v1/responses", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    Authorization: `Bearer ${process.env.ATLASFLUX_API_KEY}`,
  },
  body: JSON.stringify({
    input: "What happened in Malaysia today?",
    web_search: { mode: "auto", search_depth: "fast" },
    max_output_tokens: 512,
  }),
});

const searchData = await searchRes.json();
console.log(searchData.output_text);
console.log("Citations:", searchData.citations);
