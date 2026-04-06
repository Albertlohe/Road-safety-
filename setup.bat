@echo off
echo 🤖 AI Chatbot - Quick Setup Script
echo ==================================
echo.

REM Check if Node.js is installed
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed!
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

node --version
echo.

REM Install backend dependencies
echo 📦 Installing backend dependencies...
cd backend
call npm install

if %errorlevel% equ 0 (
    echo ✅ Backend dependencies installed successfully!
) else (
    echo ❌ Failed to install backend dependencies
    pause
    exit /b 1
)

echo.
echo 🎉 Setup complete!
echo.
echo Next steps:
echo 1. Get your API key from https://console.anthropic.com/
echo 2. Open backend\server.js and add your API key
echo 3. Run 'npm start' in the backend folder
echo 4. Open frontend\index.html in your browser
echo.
echo Happy chatting! 🚀
pause
