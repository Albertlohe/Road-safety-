# 🔄 Gemini Implementation Guide

## What Changed from Claude to Gemini

This chatbot was rebuilt to use **Google Gemini API** instead of Claude. Here's what's different:

---

## Key Differences

### 1. API Client
**Claude:**
```javascript
const anthropic = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY
});
```

**Gemini:**
```javascript
const genAI = new GoogleGenerativeAI(
  process.env.GEMINI_API_KEY
);
```

### 2. Making API Calls
**Claude:**
```javascript
const response = await anthropic.messages.create({
  model: 'claude-sonnet-4-20250514',
  max_tokens: 1024,
  system: systemPrompt,
  messages: messages
});
const text = response.content[0].text;
```

**Gemini:**
```javascript
const model = genAI.getGenerativeModel({
  model: 'gemini-1.5-flash-latest',
  systemInstruction: systemPrompt
});
const chat = model.startChat({ history: chatHistory });
const result = await chat.sendMessage(message);
const text = result.response.text();
```

### 3. Message Format
**Claude:** Uses `role: 'user'` and `role: 'assistant'`
```javascript
{ role: 'user', content: 'Hello' }
{ role: 'assistant', content: 'Hi there!' }
```

**Gemini:** Uses `role: 'user'` and `role: 'model'`
```javascript
{ role: 'user', parts: [{ text: 'Hello' }] }
{ role: 'model', parts: [{ text: 'Hi there!' }] }
```

### 4. Dependencies
**Claude:**
```json
"@anthropic-ai/sdk": "^0.32.1"
```

**Gemini:**
```json
"@google/generative-ai": "^0.21.0"
```

---

## Gemini-Specific Features

### 1. Multiple Models
```javascript
const MODELS = {
  'gemini-pro': 'gemini-1.5-pro-latest',      // Most capable
  'gemini-flash': 'gemini-1.5-flash-latest'   // Fastest
};
```

**When to use Flash:**
- Quick responses needed
- High volume of requests
- Cost-sensitive applications
- General chat

**When to use Pro:**
- Complex reasoning required
- Long context needed (up to 1M tokens)
- High accuracy needed
- Complex analysis

### 2. System Instructions
Gemini calls them "systemInstruction" instead of "system prompt":
```javascript
const model = genAI.getGenerativeModel({ 
  model: modelName,
  systemInstruction: "You are a helpful assistant..."
});
```

### 3. Generation Config
Fine-tune responses:
```javascript
generationConfig: {
  maxOutputTokens: 1024,    // Response length
  temperature: 0.7,         // Creativity (0-1)
  topP: 0.9,               // Diversity
  topK: 40                 // Vocabulary range
}
```

---

## API Key Setup

### Get Your Gemini API Key
1. Go to https://aistudio.google.com/app/apikey
2. Sign in with Google account
3. Click "Create API Key"
4. Copy the key (starts with `AIza...`)

### Add to Your Code
Option 1 - Direct (for learning):
```javascript
const genAI = new GoogleGenerativeAI('AIzaSy...');
```

Option 2 - Environment Variable (recommended):
```bash
# Create .env file
GEMINI_API_KEY=AIzaSy...
```

```javascript
require('dotenv').config();
const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY);
```

---

## Error Handling

### Common Errors

**"API key not valid"**
```
Solution: Get new key from aistudio.google.com
Make sure it starts with 'AIza'
```

**"Quota exceeded"**
```
Free tier limits:
- Flash: 15 requests/minute
- Pro: 2 requests/minute

Solution: Wait a minute or upgrade to paid
```

**"Model not found"**
```
Solution: Use correct model names:
- gemini-1.5-pro-latest
- gemini-1.5-flash-latest
```

---

## Performance Comparison

### Speed Test (average response time)
- **Gemini Flash:** ~1-2 seconds ⚡⚡⚡
- **Gemini Pro:** ~2-4 seconds ⚡⚡
- **Claude Sonnet:** ~2-3 seconds ⚡⚡
- **Claude Opus:** ~4-6 seconds ⚡

### Cost per 1000 messages (typical)
- **Gemini Flash:** $0.01 💰
- **Gemini Pro:** $0.50 💰💰
- **Claude Sonnet:** $1.50 💰💰💰
- **Claude Opus:** $7.50 💰💰💰💰

### Free Tier
- **Gemini Flash:** 15 req/min, 1M tokens/day ✅✅✅
- **Gemini Pro:** 2 req/min ✅
- **Claude:** Limited free trial ⚠️

---

## Advanced Gemini Features

### 1. Streaming Responses
For real-time typing effect:
```javascript
const result = await model.generateContentStream(message);
for await (const chunk of result.stream) {
  const text = chunk.text();
  // Send to frontend in real-time
}
```

### 2. Safety Settings
Control content filtering:
```javascript
safetySettings: [
  {
    category: HarmCategory.HARM_CATEGORY_HARASSMENT,
    threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE
  }
]
```

### 3. Function Calling
Let AI call your functions:
```javascript
tools: [{
  functionDeclarations: [{
    name: "get_weather",
    description: "Get current weather",
    parameters: { /* ... */ }
  }]
}]
```

---

## Migration Checklist

If you want to switch back to Claude or add support for both:

- [ ] Keep both SDKs installed
- [ ] Add model selector in UI
- [ ] Create adapter layer
- [ ] Handle different response formats
- [ ] Update error handling
- [ ] Test both APIs
- [ ] Monitor costs

---

## Why Gemini?

✅ **Faster** - Flash model is super quick
✅ **Cheaper** - Lower cost per token
✅ **Free tier** - More generous limits
✅ **Long context** - Up to 1M tokens
✅ **Multimodal** - Images, audio (future)
✅ **Easy API** - Simple integration

---

## Resources

- **Official Docs:** https://ai.google.dev/docs
- **API Reference:** https://ai.google.dev/api/rest
- **Cookbook:** https://github.com/google-gemini/cookbook
- **Pricing:** https://ai.google.dev/pricing
- **Community:** r/GoogleGemini

---

## Support

Having issues? Check:
1. API key is correct
2. Internet connection works
3. Dependencies installed (`npm install`)
4. Using latest SDK version
5. Check quota at aistudio.google.com

---

**Happy coding with Gemini! 🚀**
