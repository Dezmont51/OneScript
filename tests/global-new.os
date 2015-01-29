﻿Перем юТест;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_ПроверитьСозданиеМассива");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьСозданиеОбъектаИзСценария");
	
	ВсеТесты.Добавить("ТестДолжен_ПроверитьСозданиеОбъектаПоПараметруИмениКласса");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьСозданиеОбъектаПоПараметруИмениКлассаЧерезФункциюНовый");

	ВсеТесты.Добавить("ТестДолжен_ПроверитьСозданиеОбъектаВнутриВызоваФункции");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьСозданиеОбъектаВнутриВызоваФункцииБезСкобокВНовый");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьСозданиеОбъектаВнутриСозданияДругогоОбъекта");
	
	Возврат ВсеТесты;
КонецФункции

Процедура ТестДолжен_ПроверитьСозданиеМассива() Экспорт
	Объект = Новый Массив;
	ПроверитьСозданиеМассива(Объект);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьСозданиеМассиваЧерезФункциюНовый() Экспорт
	Объект = Новый("Массив");
	ПроверитьСозданиеМассива(Объект);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьСозданиеОбъектаИзСценария() Экспорт
	ТекПуть = Новый Файл(ТекущийСценарий().Источник).Путь;
	ПодключитьСценарий(ТекПуть+"example-test.os", "Пример_example_test");
	Пример = Новый Пример_example_test();
	юТест.ПроверитьРавенство("0.1", Пример.Версия());
КонецПроцедуры

Процедура ТестДолжен_ПроверитьСозданиеОбъектаПоПараметруИмениКласса() Экспорт
	ИмяКласса = "Массив";
	Попытка
		Объект = Новый ИмяКласса;
	Исключение
		Возврат;
	КонецПопытки;
	ВызватьИсключение "Массив не должен быть создан, а он создан";
	// ПроверитьСозданиеМассива(Объект);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьСозданиеОбъектаПоПараметруИмениКлассаЧерезФункциюНовый() Экспорт
	ИмяКласса = "Массив";
	Объект = Новый(ИмяКласса);
	ПроверитьСозданиеМассива(Объект);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьСозданиеОбъектаВнутриВызоваФункции() Экспорт
	Объект = ПроверкаВызова(Новый Массив());
	ПроверитьСозданиеМассива(Объект);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьСозданиеОбъектаВнутриВызоваФункцииБезСкобокВНовый() Экспорт
	Объект = ПроверкаВызова(Новый Массив);
	ПроверитьСозданиеМассива(Объект);
	
	// Issue #53
	Объект = Новый Структура("М1,М2", Новый Массив, Новый Массив);
	ПроверитьСозданиеМассива(Объект.М1);
	ПроверитьСозданиеМассива(Объект.М2);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьСозданиеОбъектаВнутриСозданияДругогоОбъекта() Экспорт
	// Issue #53
	Объект = Новый Структура("М1,М2", Новый Массив, Новый Массив);
	ПроверитьСозданиеМассива(Объект.М1);
	ПроверитьСозданиеМассива(Объект.М2);	
КонецПроцедуры

Функция ПроверкаВызова(Параметр)
	Возврат Параметр;
КонецФункции

Процедура ПроверитьСозданиеМассива(Массив) Экспорт
	юТест.ПроверитьРавенство("Массив", Строка(Массив));
	юТест.ПроверитьРавенство(-1, Массив.ВГраница());
	юТест.ПроверитьРавенство(0, Массив.Количество());
КонецПроцедуры