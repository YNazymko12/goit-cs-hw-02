#!/bin/bash

# Список вебсайтів для перевірки
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://x.com"
    "https://github.c"
)

# Ім'я файлу для збереження результатів
log_file="task-1/task-1.log"

# Очистка або створення нового файлу логів
echo "Website Status Log - $(date)" > "$log_file"
echo "-----------------------------------" >> "$log_file"

# Функція для перевірки доступності сайту
check_website() {
    local url="$1"
    # Використовуємо curl для перевірки статус-коду
    local status_code=$(curl -o /dev/null -s -w "%{http_code}" -L "$url")

    if [[ "$status_code" -eq 200 ]]; then
        echo "[$url] is UP" >> "$log_file"
    else
        echo "[$url] is DOWN" >> "$log_file"
    fi
}

# Обхід списку вебсайтів
for website in "${websites[@]}"; do
    check_website "$website"
done

# Повідомлення про завершення
echo "Results have been logged in $log_file"
