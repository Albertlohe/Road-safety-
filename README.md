# AI Chatbot - Complete Setup Guide (Google Gemini)

## What You've Built
A fully functional AI chatbot powered by **Google Gemini** with:
 Beautiful web interface
- Backend server using Node.js
- Integration with Gemini 1.5 Pro & Flash models
   Multiple AI personalities (Helpful, Creative, Professional, Teacher, Coder)
- Conversation memory
- Modern, responsive design

---

## Prerequisites (What You Need Installed)

1. **Node.js** (version 14 or higher)
   - Download from: https://nodejs.org/
   - Choose the LTS (Long Term Support) version
   - This includes npm (Node Package Manager)

2. **A Code Editor** (recommended)
   - VS Code: https://code.visualstudio.com/
   - Or any text editor you prefer

3. **Google Gemini API Key** ⭐
   - Sign up at: https://makersuite.google.com/app/apikey
   - Or go to: https://aistudio.google.com/app/apikey
   - Click "Create API Key"
   - **Keep this key secret!**

---

##  Step-by-Step Setup Instructions

### Step 1: Extract the Files
1. Download and extract the `ai-chatbot` folder
2. You should see two folders: `backend` and `frontend`

### Step 2: Set Up the Backend

1. Open your terminal/command prompt
2. Navigate to the backend folder:
   ```bash
   cd ai-chatbot/backend
   ```

3. Install the required packages:
   ```bash
   npm install
   ```
   This will install:
   - express (web server)
   - @google/generative-ai (Gemini SDK)
   - cors (allows frontend to connect)

4. **Add Your Gemini API Key:**
   Open `server.js` in a text editor and find this line (around line 17):
   ```javascript
   const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY || 'your-api-key-here');
   ```
   
   Replace `'your-api-key-here'` with your actual Gemini API key:
   ```javascript
   const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY || 'AIzaSy...');
   ```

5. Start the backend server:
   ```bash
   npm start
   ```
   
   You should see:
   ```
    AI Chatbot Backend running on http://localhost:3001
    Ready to receive requests from frontend
   ```

### Step 3: Open the Frontend

1. Keep the backend terminal running
2. Navigate to the frontend folder
3. Open the `index.html` file in your web browser:
   - **Option A:** Double-click the `index.html` file
   - **Option B:** Right-click → Open with → Your browser
   - **Option C:** Drag and drop into browser window

**Note:** You'll first see a professional landing page. Click "Get Started for Free" to access the chatbot!

### Step 4: Start Chatting!

1. You should see the chatbot interface in your browser
2. Choose a personality (Helpful, Creative, Professional, Teacher, or Coder)
3. Type a message and click "Send" or press Enter
4. Watch your AI respond! 🎉

---

##  Features Explained

### 1. Multiple Personalities
Switch between different AI personas:
- **Helpful:** General assistance, friendly tone
- **Creative:** Imaginative and playful responses
- **Professional:** Formal business communication
- **Teacher:** Patient explanations with examples
- **Coder:** Programming help and code solutions

### 2. Gemini Models
The backend uses **Gemini 1.5 Flash** by default (fastest and most cost-effective).
You can switch to **Gemini 1.5 Pro** for more complex tasks.

### 3. Conversation Memory
The chatbot remembers your conversation context within each session.

### 4. Clear Chat
Click "Clear Chat" to start a fresh conversation.

---

##  Customization Ideas

### Change the AI Model

In `backend/server.js`, you can switch between models:
```javascript
// Default is gemini-flash (fast and cheap)
model = 'gemini-flash'

// Or use gemini-pro (more capable)
model = 'gemini-pro'
```

### Add New Personalities

In `backend/server.js`, add to the `PERSONALITIES` object:
```javascript
funny: "You are a witty comedian. Make jokes and keep things lighthearted.",
scientist: "You are a research scientist. Provide evidence-based explanations."
```

Then add buttons in `frontend/index.html`:
```html
<button class="personality-btn" data-personality="funny">Funny</button>
```

### Change Colors

In `frontend/index.html`, modify the CSS gradient:
```css
background: linear-gradient(135deg, #4285f4 0%, #34a853 100%); /* Google colors */
```

### Increase Response Length

In `backend/server.js`, change:
```javascript
maxOutputTokens: 1024,  // Change to 2048 or 4096
```

---

##  API Costs

**Gemini 1.5 Flash (Recommended):**
- Free: 15 requests/min, 1M tokens/day
- Cost: ~$0.10 per 1M tokens

**Gemini 1.5 Pro:**
- Free: 2 requests/min  
- Cost: ~$3.50 per 1M tokens

**Typical usage:** $0.0001 - $0.001 per message

Start with FREE tier! 

---

## 🐛 Troubleshooting

**"Cannot connect to server"**
→ Run `npm start` in backend folder

**"Invalid API key"**  
→ Get key from https://aistudio.google.com/app/apikey
→ Check for typos in server.js line 17

**"No response"**
→ Check backend terminal for errors
→ Verify internet connection
→ Check API quota at aistudio.google.com

---

## 📝 Project Structure

```
ai-chatbot/
├── backend/
│   ├── server.js       # Gemini API integration
│   └── package.json    # Dependencies
├── frontend/
│   ├── index.html      # Landing page (HOME)
│   └── chat.html       # Chatbot interface
└── README.md          # This file
```

---

## Next Steps

**Easy:**
- Change colors/styling
- Add new personalities
- Customize messages

**Medium:**
- Add user login
- Save to database
- Deploy online (Vercel)

**Advanced:**
- Voice input/output
- Image generation
- Multi-user chat rooms

---

## 📚 Resources

- **Gemini Docs:** https://ai.google.dev/docs
- **API Studio:** https://aistudio.google.com/
- **Node.js:** https://nodejs.org/en/docs/
- **JavaScript:** https://javascript.info/

---

## 🎉 You Did It!

You built an AI chatbot with Google Gemini! Keep experimenting and building.

**Tips:**
- 📌 Keep API key secret
- 📌 Start with free tier
- 📌 Monitor usage
- 📌 Have fun coding!

**Built with ❤️ for learners**

Happy Coding! 🚀✨
