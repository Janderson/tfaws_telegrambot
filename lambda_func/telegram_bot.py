import json
import requests
import os

BOT_TOKEN=os.environ["bot_token"]
BOT_NAME =os.environ["bot_name"]
URL = "https://api.telegram.org/bot{}/".format(BOT_TOKEN)

def send_message(text, chat_id):
    final_text = f"Olá eu sou o {BOT_NAME}, você disse: {text}"
    url = URL + "sendMessage?text={}&chat_id={}".format(final_text, chat_id)
    requests.get(url)

def lambda_handler(event, context):
    message = json.loads(event['body'])
    chat_id = message['message']['chat']['id']
    reply = message['message']['text']
    send_message(reply, chat_id)
    return {
        'statusCode': 200
    }