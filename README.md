# Interfax тестовое задание

rest сервис на Ruby Sinatra для взаимодействия github.com по graphql api

## Описание

Приложение позволяет получить информацию о пользователе и историю его коммитов в репозитории.

### Установка
* Установить gem's
```
bundle install
```
* Поместить github auth token в файл config.yml

### Запуск приложения

* Выполнить команду
```
foreman s
```
* Приложение доступно на 4000 порту

## Endpoints

* /api/v4/user/:login - получение информации о пользователе
* /api/v4/user/:login/:repo - получение информации о репозитории и последних 10 коммитах