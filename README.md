Формирование текстовых разделов с иерархией вложенности

##Gemfile

    gem 'sections'

  или

    gem 'sections', :path => "../gems/sections"
    если гем во вложенной папке

  затем в config/routes

    sections_for NAME - создает пути и ресурс используемой модели (вводить имя модели)


##Генерация модели и миграции

    rails generate sections NAME - создает модель и миграцию, проверяет наличие модели (вводить имя модели)

    rails g sections:install - копирование вьюх


Прогоните миграции rake db:migrate