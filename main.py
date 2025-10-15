import os
import telebot

TOKEN = os.getenv("BOT_TOKEN")

# Dùng Local API server nội bộ (chạy trên cùng máy)
bot = telebot.TeleBot(TOKEN, api_url="http://localhost:8081/bot")

@bot.message_handler(commands=["start"])
def start(msg):
    bot.reply_to(msg, "✅ Local Bot API server đang hoạt động trên Fly.io!")

@bot.message_handler(func=lambda m: True)
def echo(msg):
    bot.reply_to(msg, f"Bạn gửi: {msg.text}")

if __name__ == "__main__":
    bot.polling()
