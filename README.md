![example workflow](https://github.com/KondratevAD/yamdb_final/actions/workflows/yamdb_workflow.yml/badge.svg)
# Проект YamDB_Final
 
## Описание 
Проект YaMDb собирает отзывы пользователей на произведения. Произведения делятся на категории: «Книги», «Фильмы», «Музыка». Список категорий может быть расширен администратором (например, можно добавить категорию «Изобразительное искусство» или «Ювелирка»). 
 
## Техническое описание 
* Реализован на базе RestAPI. 
* Технология - Django Rest Framework 
* Документация по ресурсам на http://178.154.203.80/redoc/

## Установка
Создайте в корневой директории файл с названием ".env" и поместите в него:
```
DB_NAME=имя_базы_данных
POSTGRES_USER=имя_пользователя 
POSTGRES_PASSWORD=пароль_пользователя
DB_HOST=хост
DB_PORT=порт
```
Создайте контейнеры и запустите их:
```bash
docker-compose up -d 
```
Примените миграции:
```bash
docker-compose exec web python manage.py makemigrations --noinput 
docker-compose exec web python manage.py migrate --noinput 
```

### Вход
Создайте супер пользователя, обязательно укажите почту и пароль:
```bash
docker-compose exec web python manage.py createsuperuser
```
Отправьте POST-запрос на ссылку: http://127.0.0.1/api/v1/auth/email/ — не забудьте указать в параметрах вашу почту! Пример:
```bash
curl -X POST -F "email=ваша_почта@gmail.com" http://127.0.0.1/api/v1/auth/email/
```
В папке ./sent_emails/ появится новое "письмо", откройте его и скопируйте код для авторизации.

Теперь отправьте POST-запрос, только с кодом на http://127.0.0.1/api/v1/auth/token/, чтобы получить токен. Пример:
```bash
curl -X POST -F "email=ваша_почта@gmail.com" -F "confirmation_code=ваш_код" http://127.0.0.1/api/v1/auth/token/
```