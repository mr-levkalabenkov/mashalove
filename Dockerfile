# Указываем базовый образ
FROM python:3.10-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем зависимости
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем всё приложение
COPY . .

# Указываем порт, который будет прослушиваться
EXPOSE 5000

# Запускаем приложение
CMD ["python3", "run.py"]
