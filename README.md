# @TODO (Нужно сделать:)
## План работ:
### 1. Чтобы Работало.

### 2. Чтобы Работало, Быстро.

### 3. Чтобы Работало, Быстро и Красиво.

## Установка
```
git clone https://github.com/alexsuslov/emt.git

cd emt
npm install

grunt

```
## [Доки](http://alexsuslov.github.io/emt/)
## [Тесты](https://github.com/alexsuslov/emt/blob/master/report.md)

## Версия для работы в браузере
### Simple

- работают правила не изменяющие тэги
- как jQuery плагин

Использование:
```
<p class='emt'>привет "привет" привет</p>

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
  





