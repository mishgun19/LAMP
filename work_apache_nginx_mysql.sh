#!/bin/bash
# Переменные для телеграм-бота и получателей уведомлений
bot_token=6824574787:AAHem1WcTfWFUV0DFeRsvpub3bVXOFcqwts
chat_id=(596585942) # ID получателей через пробел

# Функция для отправки сообщения в телеграм
send_telegram() {
  local chat_id=$1
  local text=$2
  curl -s -X POST https://api.telegram.org/bot$bot_token/sendMessage -d chat_id=$chat_id -d text="$text"
}

send_telegram_nginx() {
  local chat_id=$1
  local text_nginx=$2
  curl -s -X POST https://api.telegram.org/bot$bot_token/sendMessage -d chat_id=$chat_id -d text="$text_nginx"
}


send_telegram_mysql() {
  local chat_id=$1
  local text_mysql=$2
  curl -s -X POST https://api.telegram.org/bot$bot_token/sendMessage -d chat_id=$chat_id -d text="$text_mysql"
}


################################# APACHE2 #######################################

# Проверка статуса Apache2
systemctl status apache2 > /dev/null

# Если Apache2 не запущен, то пытаемся перезапустить его и отправить уведомление
if [ $? -ne 0 ]; then
  # Перезапуск Apache2
  systemctl restart apache2 > /dev/null
  sleep 10 # Ждем 10 секунд, чтобы дать Apache2 время на запуск

  # Проверяем статус Apache2 снова
  systemctl status apache2 > /dev/null

  # Если Apache2 запущен, то отправляем уведомление об успешном перезапуске
  if [ $? -eq 0 ]; then
    for chat_id in "${chat_id[@]}"; do
      send_telegram $chat_id "Apache2 был остановлен на вашем сервере. Автоматический перезапуск прошел успешно."
    done
  # Если Apache2 не запущен, то отправляем уведомление о неудачном перезапуске
  else
    for chat_id in "${chat_id[@]}"; do
      send_telegram $chat_id "Apache2 был остановлен на вашем сервере. Автоматический перезапуск не удался. Пожалуйста, проверьте вручную."
    done
  fi
fi


###################################### NGINX ##################################################


# Проверка статуса NGINX
systemctl status nginx > /dev/null

# Если Nginx не запущен, то пытаемся перезапустить его и отправить уведомление
if [ $? -ne 0 ]; then
  # Перезапуск Nginx
  systemctl restart nginx > /dev/null
  sleep 10 # Ждем 10 секунд, чтобы дать Nginx время на запуск

  # Проверяем статус Nginx снова
  systemctl status nginx > /dev/null

  # Если Nginx запущен, то отправляем уведомление об успешном перезапуске
  if [ $? -eq 0 ]; then
    for chat_id in "${chat_id[@]}"; do
      send_telegram_nginx $chat_id "Nginx был остановлен на вашем сервере. Автоматический перезапуск прошел успешно."
    done
  # Если Nginx не запущен, то отправляем уведомление о неудачном перезапуске
  else
    for chat_id in "${chat_id[@]}"; do
      send_telegram_nginx $chat_id "Nginx был остановлен на вашем сервере. Автоматический перезапуск не удался. Пожалуйста, проверьте вручную"
    done
  fi
fi


###################################### Mysql ####################################################

# Проверка статуса Mysql
systemctl status mysql > /dev/null

# Если Mysql не запущен, то пытаемся перезапустить его и отправить уведомление
if [ $? -ne 0 ]; then
  # Перезапуск Mysql
  systemctl restart mysql > /dev/null
  sleep 10 # Ждем 10 секунд, чтобы дать Nginx время на запуск

  # Проверяем статус Nginx снова
  systemctl status mysql > /dev/null

  # Если Mysql запущен, то отправляем уведомление об успешном перезапуске
  if [ $? -eq 0 ]; then
    for chat_id in "${chat_id[@]}"; do
      send_telegram_mysql $chat_id "Mysql был остановлен на вашем сервере. Автоматический перезапуск прошел успешно."
    done
  # Если Mysql не запущен, то отправляем уведомление о неудачном перезапуске
  else
    for chat_id in "${chat_id[@]}"; do
      send_telegram_mysql $chat_id "Mysql был остановлен на вашем сервере. Автоматический перезапуск не удался. Пожалуйста, проверьте вручную"
    done
  fi
fi

