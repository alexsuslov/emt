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


<textarea name="emt" rows="10" cols='30'></textarea>
<p class='emt'></p>
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script scr='https://raw.githubusercontent.com/alexsuslov/emt/master/dist/emt.js'></script>
<script>
  $(function() {
    var $p = $('p.emt');
    var $t = $('textarea.emt');
    $t.html( $p.html());
    var emt = $p.emt();
    $t.on('keyup' ,function(e){
      $p.html( e.target.value);
      emt.apply();
    });
  });
</script>

 





