﻿# encoding: utf-8
# language: ru

@tree

Функционал: Покупка товаров
	Как  менеджер магазина
	Хочу автоматизировать процес закупки товаров
	Чтобы не вести учет в тетраде

Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий: Покупка товаров 
	Допустим я подготавливаю процес закупки
	Когда я создаю покупку 
		Когда В панели разделов я выбираю "Закупки"
		И     В панели функций я выбираю "Покупка"
		Тогда открылось окно "Покупка"
		И     я нажимаю на кнопку "Создать"
		Тогда открылось окно "Покупка (создание)"
	
	И я заполняю шапку документа
		И     я открываю выпадающий список "Поставщик"
		И     я выбираю значение реквизита "Поставщик" из формы списка
		Тогда открылось окно "Контрагенты"
		И     В форме "Контрагенты" в таблице "Список" я перехожу к строке:
		| 'Наименование'       |
		| 'Основной поставщик' |
		И     В форме "Контрагенты" в ТЧ "Список" я выбираю текущую строку
	
	И я выбираю товары
		Тогда открылось окно "Покупка (создание) *"
		И	  в открытой форме в ТЧ "Товары" я нажимаю на кнопку с именем "ТоварыДобавить"
		И     в ТЧ "Товары" я выбираю значение реквизита "Товар" из формы списка
		Тогда открылось окно "Товары"
		И     В форме "Товары" в таблице "Список" я перехожу к строке:
		| 'Код'        | 'Наименование'         |
		| '0000000001' | 'Спининг одноколенный' |
		И     В форме "Товары" в ТЧ "Список" я выбираю текущую строку
		Тогда открылось окно "Покупка (создание) *"
		И     в ТЧ "Товары" я активизирую поле "Количество"
		И     в ТЧ "Товары" в поле "Количество" я ввожу текст "1"
		И     в ТЧ "Товары" я активизирую поле "Цена"
		И     в ТЧ "Товары" в поле "Цена" я ввожу текст "750,00"
		И     В форме "Покупка (создание) *" в ТЧ "Товары" я завершаю редактирование строки
		И     в открытой форме в ТЧ "Товары" я нажимаю на кнопку с именем "ТоварыДобавить"
		И     в ТЧ "Товары" я выбираю значение реквизита "Товар" из формы списка
		Тогда открылось окно "Товары"
		И     В форме "Товары" в таблице "Список" я перехожу к строке:
		| 'Код'        | 'Наименование'       |
		| '0000000009' | 'Набор для спининга' |
		И     В форме "Товары" в ТЧ "Список" я выбираю текущую строку
		Тогда открылось окно "Покупка (создание) *"
		И     в ТЧ "Товары" я активизирую поле "Количество"
		И     в ТЧ "Товары" в поле "Количество" я ввожу текст "1"
		И     в ТЧ "Товары" я активизирую поле "Цена"
		И     в ТЧ "Товары" в поле "Цена" я ввожу текст "310,00"
		И     В форме "Покупка (создание) *" в ТЧ "Товары" я завершаю редактирование строки
		И     в открытой форме в ТЧ "Товары" я нажимаю на кнопку с именем "ТоварыДобавить"
		И     в ТЧ "Товары" я выбираю значение реквизита "Товар" из формы списка
		Тогда открылось окно "Товары"
		И     В форме "Товары" в ТЧ "Список" я выбираю текущую строку
		Тогда открылось окно "Покупка (создание) *"
		И     в ТЧ "Товары" я активизирую поле "Количество"
		И     в ТЧ "Товары" в поле "Количество" я ввожу текст "1"
		И     в ТЧ "Товары" я активизирую поле "Цена"
		И     в ТЧ "Товары" в поле "Цена" я ввожу текст "170,00"
		И     В форме "Покупка (создание) *" в ТЧ "Товары" я завершаю редактирование строки

	И я провожу документ
		Когда открылось окно "Покупка (создание) *"
		И     я нажимаю на кнопку "Провести"
		
	Тогда результат покупки считается корректным
		Когда открылось окно "Покупка * от *"
		И     В текущем окне я нажимаю кнопку командного интерфейса "Остатки"
		Тогда таблица формы с именем "Список" стала равной:
			| 'Период'              | 'Остаток' | 'Регистратор'                      | 'Номер строки' | 'Товар'                |
			| '*' | '1'       | * | '1'            | 'Спининг одноколенный' |
			| '*' | '1'       | * | '2'            | 'Набор для спининга'   |
			| '*' | '1'       | * | '3'            | 'Казан для ухи'        |
	
Сценарий: Удаление покупки по номеру
	Когда В панели разделов я выбираю "Закупки"
	И     В панели функций я выбираю "Покупка"
	Тогда открылось окно "Покупка"		
	И      у меня есть документ покупка под номером "1"
	Тогда результат пометки на удаление должен быть равен Истина
	
	Когда открылось окно "Покупка"
	И     я нажимаю на кнопку "Обновить"
	
	


	
	 

