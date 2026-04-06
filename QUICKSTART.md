# ⚡ Quick Start - Gemini Edition

## Get Your API Key
1. Go to https://aistudio.google.com/app/apikey
2. Click "Create API Key"
3. Copy your key (starts with `AIza...`)

## Setup (3 Steps)

### 1. Install Dependencies
```bash
cd ai-chatbot/backend
npm install
```

### 2. Add Your API Key
Edit `backend/server.js` line 17:
```javascript
const genAI = new GoogleGenerativeAI('YOUR_KEY_HERE');
```

### 3. Run It!
```bash
npm start
```
Then open `frontend/index.html` in your browser!

---

## Gemini vs Claude vs ChatGPT

| Feature | Gemini Flash | Gemini Pro | Claude | ChatGPT |
|---------|-------------|-----------|---------|----------|
| **Speed** | ⚡⚡⚡ Fastest | ⚡⚡ Fast | ⚡⚡ Fast | ⚡⚡ Fast |
| **Cost** | 💰 Cheapest | 💰💰 Medium | 💰💰💰 Higher | 💰💰 Medium |
| **Free Tier** | ✅ 15 req/min | ✅ 2 req/min | ✅ Limited | ✅ Limited |
| **Best For** | Chat, Q&A | Analysis | Writing | Code |
| **Context** | 1M tokens | 1M tokens | 200K | 128K |

**Recommendation:** Start with **Gemini Flash** - it's fast, free, and perfect for chatbots!

---

## Why Gemini?

✅ **FREE to start** - Generous free tier  
✅ **Super fast** - Flash model is lightning quick  
✅ **Long context** - Up to 1 million tokens  
✅ **Multimodal** - Text, images, audio (future)  
✅ **Easy API** - Simple to use  

---

## Common Mistakes

❌ Using wrong API key type (must be Gemini API key)  
❌ Forgetting to run `npm install`  
❌ Not starting backend before opening frontend  
❌ Adding extra spaces in API key  

---

## Need Help?

- Check main README.md for full guide
- Visit https://ai.google.dev/docs
- Check backend terminal for errors
- Verify API key at aistudio.google.com

---

**You're all set! Start building! 🚀**
