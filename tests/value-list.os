﻿Перем юТест;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	ВсеТесты.Добавить("ТестДолжен_ПроверитьСозданиеСпискаЗначений");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьДобавлениеЭлементов");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьДоступКСвойствамЭлементаСписка");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЗаписьСвойствЭлементаСписка");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьИтерациюПоСписку");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьДоступПоИндексу");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьМетодИндексСпискаЗначений");
	
	Возврат ВсеТесты;
	
КонецФункции

Процедура ТестДолжен_ПроверитьСозданиеСпискаЗначений() Экспорт
	СЗ = Новый СписокЗначений;
	юТест.ПроверитьРавенство(Тип("СписокЗначений"), ТипЗнч(СЗ));
КонецПроцедуры

Процедура ТестДолжен_ПроверитьДобавлениеЭлементов() Экспорт
	СЗ = Новый СписокЗначений;
	СЗ.Добавить("Один");
	СЗ.Добавить("Два");
	юТест.ПроверитьРавенство(2, СЗ.Количество());
	юТест.ПроверитьРавенство(Тип("ЭлементСпискаЗначений"), ТипЗнч(СЗ.Получить(0)));
КонецПроцедуры

Процедура ТестДолжен_ПроверитьДоступКСвойствамЭлементаСписка() Экспорт
	юТест.ПодробныеОписанияОшибок(Истина);
	СЗ = Новый СписокЗначений;
	СЗ.Добавить(1,"Представление");
	СЗ.Добавить(2,"Представление2", Истина);
	СЗ.Добавить(3,"Представление3", Истина, "Тут должна быть картинка, но сейчас может быть любое значение");
	СЗ.Добавить(1);
	
	Элемент = СЗ[0];
	юТест.ПроверитьРавенство(1, Элемент.Значение, "Значение элемента 0 должно быть установлено");
	юТест.ПроверитьРавенство("Представление", Элемент.Представление, "Представление элемента 0 должно быть установлено");
	юТест.ПроверитьРавенство(Ложь, Элемент.Пометка, "Пометка элемента 0 не должна быть установлена");
	юТест.ПроверитьРавенство(Неопределено, Элемент.Картинка, "Картинка элемента 0 не должна быть установлена");
	
	Элемент = СЗ[1];
	юТест.ПроверитьРавенство(2, Элемент.Значение, "Значение элемента 1 должно быть установлено");
	юТест.ПроверитьРавенство("Представление2", Элемент.Представление, "Представление элемента 1 должно быть установлено");
	юТест.ПроверитьРавенство(Истина, Элемент.Пометка, "Пометка элемента 1 должна быть установлена");
	
	Элемент = СЗ[2];
	юТест.ПроверитьРавенство(3, Элемент.Значение, "Значение элемента 2 должно быть установлено");
	юТест.ПроверитьРавенство("Представление3", Элемент.Представление, "Представление элемента 2 должно быть установлено");
	юТест.ПроверитьРавенство(Истина, Элемент.Пометка, "Пометка элемента 2 должна быть установлена");
	юТест.ПроверитьРавенство("Тут должна быть картинка, но сейчас может быть любое значение", Элемент.Картинка, "Картинка элемента 2 должна быть установлена");
	
	юТест.ПроверитьРавенство("", СЗ[3].Представление, "Должно быть пустое представление по умолчанию");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЗаписьСвойствЭлементаСписка() Экспорт
	СЗ = Новый СписокЗначений;
	Элемент = СЗ.Добавить(1);
	
	Элемент.Значение = 2;
	Элемент.Представление = "Привет";
	Элемент.Пометка = Истина;
	Элемент.Картинка = "---";
	
	юТест.ПроверитьРавенство(2, Элемент.Значение, "Значение элемента должно быть установлено");
	юТест.ПроверитьРавенство("Привет", Элемент.Представление, "Представление элемента должно быть установлено");
	юТест.ПроверитьРавенство(Истина, Элемент.Пометка, "Пометка элемента должна быть установлена");
	юТест.ПроверитьРавенство("---", Элемент.Картинка, "Картинка элемента должна быть установлена");
	
КонецПроцедуры
