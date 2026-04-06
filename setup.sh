#!/bin/bash

echo "🤖 AI Chatbot - Quick Setup Script"
echo "=================================="
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo "❌ Node.js is not installed!"
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js version: $(node --version)"
echo ""

# Install backend dependencies
echo "📦 Installing backend dependencies..."
cd backend
npm install

if [ $? -eq 0 ]; then
    echo "✅ Backend dependencies installed successfully!"
else
    echo "❌ Failed to install backend dependencies"
    exit 1
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "1. Get your API key from https://console.anthropic.com/"
echo "2. Open backend/server.js and add your API key"
echo "3. Run 'npm start' in the backend folder"
echo "4. Open frontend/index.html in your browser"
echo ""
echo "Happy chatting! 🚀"
