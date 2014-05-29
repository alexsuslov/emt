#Типограф 
Базируется на правилах Evgeny Muravjev Typograph, http://mdash.ru

## @TODO (Нужно сделать:) План работ:
### 1. Чтобы Работало.
#### 1.1. Тесты для всех правил
#### 1.2. Сделана JS сборка для браузера

### 2. Чтобы Работало, Быстро.

### 3. Чтобы Работало, Быстро и Красиво.

## Установка для использования
```
bower install emt
```

## Установка для разработки

```
git clone https://github.com/alexsuslov/emt.git

cd emt
npm install

grunt serve

```
## [Доки](http://alexsuslov.github.io/emt/)
## [Тесты](https://github.com/alexsuslov/emt/blob/master/report.md)

## Версия для работы в браузере
### Simple

- работают правила не изменяющие тэги
- как jQuery плагин

Использование:
```
<textarea name="emt" rows="10" class='emt col-lg-12 col-xs-12'></textarea>
<p class='emt'></p>

$(function() {
  var $p = $('p.emt');
  var emt = $p.emt();
  $('textarea.emt').on('keyup' ,function(e){
    $p.html( e.target.value);
    emt = $('p.emt').emt();
  });
});

```

Выдает:

![test](https://raw.githubusercontent.com/alexsuslov/emt/master/img/EMT_test.jpg)

 





