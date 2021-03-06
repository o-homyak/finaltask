﻿# encoding: utf-8
# language: ru

@tree


Функционал: Проведения продажи проверка наличия остатков на складе
	Как разработчик
	Хочу проверить получаемое сообщение пользователю когда не хватает товара на складе
	Чтобы научится работать с автоматизированным тестированием

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Достаточно остатка на складе при продаже
	Допустим я подготавливаю вспомагательные данные
	Когда я создаю продажу
		Когда В панели разделов я выбираю "Продажи"
		И     В панели функций я выбираю "Продажа"
		Тогда открылось окно "Продажа"
		И     я нажимаю на кнопку "Создать"
	
	И я заполняю шапку документа
		И     я открываю выпадающий список "Покупатель"
		И     я выбираю значение реквизита "Покупатель" из формы списка
		Тогда открылось окно "Контрагенты"
		И     В форме "Контрагенты" в таблице "Список" я перехожу к строке:
		| 'Наименование'       |
		| 'Частное лицо' |
		И     В форме "Контрагенты" в ТЧ "Список" я выбираю текущую строку
	
	И я выбираю товары
		Тогда открылось окно "Продажа (создание) *"
		И	  в открытой форме в ТЧ "Товары" я нажимаю на кнопку с именем "ТоварыДобавить"
		И     в ТЧ "Товары" я выбираю значение реквизита "Товар" из формы списка
		Тогда открылось окно "Товары"
		И     В форме "Товары" в таблице "Список" я перехожу к строке:
		| 'Код'        | 'Наименование'         |
		| '0000000001' | 'Спининг одноколенный' |
		И     В форме "Товары" в ТЧ "Список" я выбираю текущую строку
		Тогда открылось окно "Продажа (создание) *"
		И     в ТЧ "Товары" я активизирую поле "Количество"
		И     в ТЧ "Товары" в поле "Количество" я ввожу текст "1"
		И     в ТЧ "Товары" я активизирую поле "Цена"
		И     в ТЧ "Товары" в поле "Цена" я ввожу текст "1350,00"
		И     В форме "Покупка (создание) *" в ТЧ "Товары" я завершаю редактирование строки

	И я провожу документ
		Когда открылось окно "Продажа (создание) *"
		И     я нажимаю на кнопку "Провести"
		
	Тогда результат продажи считается корректным
		Когда отсутсвует сообщение о недостаче товара

