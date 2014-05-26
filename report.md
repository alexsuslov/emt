profiling:  0
# TOC
   - [Rules](#rules)
     - [Открывающая кавычка](#rules--)
     - [Кое-как, кой-кого, все-таки](#rules------)
     - [Расстановка знака минус между числами](#rules-----)
     - [Расстановка пробелов перед сокращениями dpi, lpi](#rules-----dpi-lpi)
     - [Расстановка пробелов перед сокращениями гл., стр., рис., илл., ст., п.](#rules----------)
     - [Расстановка пробелов перед сокращениями см., им.](#rules------)
     - [Закрывающая кавычка](#rules--)
     - [Расстановка дефисов между из-за, из-под](#rules-------)
     - [Тире после кавычек, скобочек, пунктуации](#rules-----)
     - [Тире после переноса строки](#rules----)
     - [Замена символа тире на html конструкцию](#rules-----html-)
     - [Тире после знаков восклицания, троеточия и прочее](#rules-------)
     - [Пробел между символом номера и числом](#rules------)
     - [Объединение триад чисел полупробелом](#rules----)
     - [Пробел между параграфом и числом](#rules-----)
     - [Автоматическая простановка дефисов в обезличенных местоимениях и междометиях](#rules--------)
   - [EMTBase](#emtbase)
     - [add_safe_tag](#emtbase-add_safe_tag)
     - [add_safe_block](#emtbase-add_safe_block)
   - [EMTLib](#emtlib)
     - [isInt](#emtlib-isint)
     - [isArray](#emtlib-isarray)
     - [isObject](#emtlib-isobject)
   - [EMTret](#emtret)
     - [set_text](#emtret-set_text)
     - [set_tag_layout](#emtret-set_tag_layout)
     - [set_rule](#emtret-set_rule)
     - [apply](#emtret-apply)
   - [EMTretDash](#emtretdash)
     - [set_text](#emtretdash-set_text)
   - [EMTretNobr](#emtretnobr)
     - [set_text](#emtretnobr-set_text)
   - [EMTretNumber](#emtretnumber)
     - [set_text](#emtretnumber-set_text)
   - [EMTretPunctmark](#emtretpunctmark)
     - [set_text](#emtretpunctmark-set_text)
   - [EMTretQuote](#emtretquote)
     - [open_quote](#emtretquote-open_quote)
   - [EMTretSpace](#emtretspace)
     - [set_text](#emtretspace-set_text)
   - [EMTretSymbol](#emtretsymbol)
     - [set_text](#emtretsymbol-set_text)
   - [EMTypograph](#emtypograph)
     - [set_text](#emtypograph-set_text)
     - [apply](#emtypograph-apply)
<a name=""></a>
 
<a name="rules"></a>
# Rules
<a name="rules--"></a>
## Открывающая кавычка
 test 10х20х30 .

```js
open_quote.text = text;
open_quote.apply();
return assert.equal(' test 10&times;20&times;30 ', open_quote.text);
```

<a name="emtbase"></a>
# EMTBase
is present EMTretQuote.

```js
return assert.equal("Кавычки", emt.tret_objects.EMTretQuote.title);
```

<a name="emtbase-add_safe_tag"></a>
## add_safe_tag
xid.

```js
return assert.equal(pre.id, xid);
```

xopen.

```js
return assert.equal(pre.open, xopen);
```

close.

```js
return assert.equal(pre.close, close);
```

tag.

```js
return assert.equal(pre.tag, tag);
```

<a name="emtbase-add_safe_block"></a>
## add_safe_block
xid.

```js
return assert.equal(tag.id, xid);
```

xopen.

```js
return assert.equal(tag.open, xopen);
```

close.

```js
return assert.equal(tag.close, close);
```

<a name="emtlib"></a>
# EMTLib
trim.

```js
return assert.equal('привет всем', emtlib.trim('  привет всем     '));
```

encrypt_tag / decrypt_tag.

```js
var encStr, str;
str = 'your text';
encStr = emtlib.encrypt_tag(str);
emtlib.decrypt_tag(encStr);
return assert.equal(str, emtlib.decrypt_tag(encStr));
```

decode_internal_blocks / encode_internal_blocks.

```js
var block;
block = '<a href="http://mdash.ru">test</a><p>test</p>';
return assert.equal(block, emtlib.decode_internal_blocks(emtlib.iblock(block)));
```

safe_tag_chars.

```js
var text;
text = '<a href="http://mdash.ru">test</a><p>test</p>';
return assert.equal(text, emtlib.safe_tag_chars(emtlib.safe_tag_chars(text, true), false));
```

<a name="emtlib-isint"></a>
## isInt
1.

```js
return assert.equal(true, emtlib.isInt(1));
```

1.25.

```js
return assert.equal(false, emtlib.isInt(1.25));
```

<a name="emtlib-isarray"></a>
## isArray
array.

```js
return assert.equal(true, emtlib.isArray([1, 2, 3]));
```

object.

```js
return assert.equal(false, emtlib.isArray({
  a: 1,
  b: 2,
  c: 3
}));
```

number.

```js
return assert.equal(false, emtlib.isArray(1));
```

string.

```js
return assert.equal(false, emtlib.isArray('test'));
```

function.

```js
return assert.equal(false, emtlib.isArray(function() {}));
```

<a name="emtlib-isobject"></a>
## isObject
array.

```js
return assert.equal(false, emtlib.isObject([1, 2, 3]));
```

object.

```js
return assert.equal(true, emtlib.isObject({
  a: 1,
  b: 2,
  c: 3
}));
```

number.

```js
return assert.equal(false, emtlib.isObject(1));
```

string.

```js
return assert.equal(false, emtlib.isObject('test'));
```

function.

```js
return assert.equal(false, emtlib.isObject(function() {}));
```

<a name="emtret"></a>
# EMTret
<a name="emtret-set_text"></a>
## set_text
@_text = 'test .

```js
emtret.set_text('test');
return assert.equal('test', emtret._text);
```

<a name="emtret-set_tag_layout"></a>
## set_tag_layout
set_tag_layout().

```js
emtret.set_tag_layout();
return assert.equal(emtret.Lib.LAYOUT_STYLE, emtret.use_layout);
```

set_tag_layout(10).

```js
emtret.set_tag_layout(10);
return assert.equal(10, emtret.use_layout);
```

<a name="emtret-set_rule"></a>
## set_rule
rulename key value.

```js
emtret.set_rule('rulename', 'key', 'value');
return assert.equal('value', emtret.rules.rulename.key);
```

<a name="emtret-apply"></a>
## apply
string.

```js
return assert.equal('open_quote', param[0]);
```

array.

```js
assert.equal('open_quote', param[0]);
return assert.equal('open_quote1', param[1]);
```

<a name="emtretdash"></a>
# EMTretDash
<a name="emtretdash-set_text"></a>
## set_text
@_text = 'test .

```js
emTretDash.set_text('test');
return assert.equal('test', emTretDash._text);
```

<a name="emtretnobr"></a>
# EMTretNobr
<a name="emtretnobr-set_text"></a>
## set_text
@_text = 'test .

```js
emt.set_text('test');
return assert.equal('test', emt._text);
```

<a name="emtretnumber"></a>
# EMTretNumber
<a name="emtretnumber-set_text"></a>
## set_text
@_text = 'test .

```js
emt.set_text('test');
return assert.equal('test', emt._text);
```

<a name="emtretpunctmark"></a>
# EMTretPunctmark
<a name="emtretpunctmark-set_text"></a>
## set_text
@_text = 'test .

```js
emt.set_text('test');
return assert.equal('test', emt._text);
```

<a name="emtretquote"></a>
# EMTretQuote
<a name="emtretquote-open_quote"></a>
## open_quote
Тест "Хроники Ехо"?.

```js
emt.set_text('Тест "Хроники Ехо"?');
emt.rules.open_quote.fn(emt);
return assert.equal('Тест &laquo;Хроники Ехо"?', emt._text);
```

<a name="emtretspace"></a>
# EMTretSpace
<a name="emtretspace-set_text"></a>
## set_text
@_text = 'test .

```js
emt.set_text('test');
return assert.equal('test', emt._text);
```

<a name="emtretsymbol"></a>
# EMTretSymbol
<a name="emtretsymbol-set_text"></a>
## set_text
@_text = 'test .

```js
emt.set_text('test');
return assert.equal('test', emt._text);
```

<a name="emtypograph"></a>
# EMTypograph
<a name="emtypograph-set_text"></a>
## set_text
@_text = 'test .

```js
emt.set_text('test');
return assert.equal('test', emt._text);
```

<a name="emtypograph-apply"></a>
## apply
test.

```js
return assert.equal('test', emt.apply());
```

<a href='#test'> "test"</a>.

```js
var res;
emt.set_text('<a href="#test"> "test"</a>');
res = '<%%___YSBocmVmPSIjdGVzdCI==> "test"</%%___YQ===>';
return assert.equal(res, emt.apply());
```

<a name="rules"></a>
# Rules
<a name="rules------"></a>
## Кое-как, кой-кого, все-таки
 Кое -как,  кой -кого,  все -таки .

```js
rule.text = text;
rule.apply();
return assert.equal(" Кое-как,  кой-кого,  все-таки ", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules-----"></a>
## Расстановка знака минус между числами
 1-1 .

```js
rule.text = text;
rule.apply();
return assert.equal(" 1&minus;1 ", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules-----dpi-lpi"></a>
## Расстановка пробелов перед сокращениями dpi, lpi
 300 dpi 150 lpi .

```js
rule.text = text;
rule.apply();
return assert.equal(" 300&nbsp;dpi 150&nbsp;lpi ", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules----------"></a>
## Расстановка пробелов перед сокращениями гл., стр., рис., илл., ст., п.
 гл. 4, стр. 5, рис. 7, илл. 9, ст. 6, п. 9 .

```js
rule.text = text;
rule.apply();
return assert.equal(" гл&nbsp;4, стр&nbsp;5, рис&nbsp;7, илл&nbsp;9, ст&nbsp;6, п&nbsp;9 ", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules------"></a>
## Расстановка пробелов перед сокращениями см., им.
 см. 2, им. 4.

```js
rule.text = text;
rule.apply();
return assert.equal(" см&nbsp;2, им&nbsp;4", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules--"></a>
## Закрывающая кавычка
привет "test" привет.

```js
close_quote.text = text;
close_quote.apply();
return assert.equal("привет \"test&raquo; привет", close_quote.text);
```

<a name="rules"></a>
# Rules
<a name="rules-------"></a>
## Расстановка дефисов между из-за, из-под
 из -за, из -под .

```js
rule.text = text;
rule.apply();
return assert.equal(" из-за, из-под ", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules-----"></a>
## Тире после кавычек, скобочек, пунктуации
  привет, - привет.

```js
rule.text = text;
rule.apply();
return assert.equal("  привет,&nbsp;&mdash; привет", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules----"></a>
## Тире после переноса строки
  привет
- привет.

```js
rule.text = text;
rule.apply();
return assert.equal("  привет\n&nbsp;&mdash;привет", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules-----html-"></a>
## Замена символа тире на html конструкцию
 привет - привет .

```js
rule.text = text;
rule.apply();
return assert.equal(" привет &mdash; привет ", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules-------"></a>
## Тире после знаков восклицания, троеточия и прочее
  привет! - привет.

```js
rule.text = text;
rule.apply();
return assert.equal("  привет!&nbsp;&mdash;привет", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules--"></a>
## Открывающая кавычка
привет "test" привет. привет "test" привет.

```js
open_quote.text = text;
open_quote.apply();
console.log('profiling: ', open_quote.profiling);
return assert.equal("привет &laquo;test\" привет. привет &laquo;test\" привет", open_quote.text);
```

<a name="rules"></a>
# Rules
<a name="rules--"></a>
## Открывающая кавычка
 test 1/2 1/4 3/4.

```js
open_quote.text = text;
open_quote.apply();
return assert.equal(" test &frac12; &frac14; &frac34;", open_quote.text);
```

<a name="rules"></a>
# Rules
<a name="rules------"></a>
## Пробел между символом номера и числом
№ 4, № 5.

```js
rule.text = text;
rule.apply();
return assert.equal("&#8470;&thinsp;4, &#8470;&thinsp;5", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules----"></a>
## Объединение триад чисел полупробелом
 123 123 123 .

```js
rule.text = text;
rule.apply();
return assert.equal(" 123&thinsp;123&thinsp;123 ", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules-----"></a>
## Пробел между параграфом и числом
§ 1.

```js
rule.text = text;
rule.apply();
return assert.equal("&sect;&thinsp;1", rule.text);
```

<a name="rules"></a>
# Rules
<a name="rules--------"></a>
## Автоматическая простановка дефисов в обезличенных местоимениях и междометиях
 кто -то кто -либо кто -нибудь.

```js
rule.text = text;
rule.apply();
return assert.equal(" кто-то кто-либо кто-нибудь", rule.text);
```

