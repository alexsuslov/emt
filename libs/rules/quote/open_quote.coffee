###
Правило "Открывающая кавычка"
используется как объект расширения для остальных правил
###
class OpenQuote
  used:0
  timer:0
  description: "Открывающая кавычка"
  version:'0.0.0'
  configName:'open_quote'

  text:''
  config:
    on: true
    log: off
    debug:off

  ###
  Конструктор
  @param opt[object]
  - Lib[Object] обязательно
  - text[String] строка
  ###
  constructor:(@opt)->
    @config = @opt.config[@configName] if @opt.config?[@configName]
    @Lib = @opt.Lib if @opt.Lib
    @text = @opt.text if @opt.text
    @

  # Цикл применения правила
  # сохраняет время работы в @profiling
  multiply:()->
    while @replace()
      @used += 1
      # защита от бесконечного цикла
      if @used > 4096
        console.log 'error бесконечный цикл'
        break
    @

  # Применение правила для text
  apply:->
    return unless @config.on
    @multiply()

  re:
    s: /(\s|\&nbsp)/.source
    gls: '([уеыаоэяиюё])'
    rim: '([XIV]{1,5})'
    # ^ ( \s > - ,
    prefix: /(^|\(|\s|\>|-|\&nbsp\;|\,|\t)/.source
    # ! ? ; , . &plusmn; \s <
    sufix: /(\&hellip\;|\t|\!|\?|\;|\,|\.|\&plusmn\;|\s|\<|$)/.source
    # единицы длинны площади объема
    ed: '(м|мм|см|дм|км|гм|km|dm|cm|mm)'
    # единицы массы
    wed: '(г|кг|мг|т)'
    # единицы денег
    mEd: /(руб\.|долл\.|евро|€|&euro;|\$|у[\.]? ?е[\.]?)/.source
    # (тыс|млн|млрд)\.
    mult: /(тыс|млн|млрд)\./.source
    # формы собственности
    frm: /(ООО|ЗАО|ОАО|НИИ|ПБОЮЛ)\s/.source
    # гл., стр., рис., илл., ст., п.
    ref: /(гл|стр|рис|илл?|ст|п|с)\./.source
    # (г|ул|пер|просп|пл|бул|наб|пр|ш|туп)\.
    adr:/(г|ул|пер|просп|пл|бул|наб|пр|ш|туп)\./.source
    adr1:/(б\-р|пр\-кт)/.source
    adr2:/(д|кв|эт)\./.source
    # [a-zа-яё0-9\-]
    azn: '[a-zа-яё0-9\-]'
    # [A-ZА-ЯЁ]
    AZ: '[A-ZА-ЯЁ]'
    # (кто|кем|когда|зачем|почему|как|что|чем|где|чего|кого)
    mjd:  '(кто|кем|когда|зачем|почему|как|что|чем|где|чего|кого)'
    mjd1: '(то|либо|нибудь)'
    li: '(ли|бы|б|же|ж)'
    month: '((январ|феврал|сентябр|октябр|ноябр|декабр)([ьяюе]|[её]м)|(апрел|июн|июл)([ьяюе]|ем)|(март|август)([ауе]|ом)?|ма[йяюе]|маем)'
    month1:'(января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря)'
    year: /(с|по|период|середины|начала|начало|конца|конец|половины|в|между|\([cс]\)|\&copy\;)/.source
    ip: /(\d{0,3}\.\d{0,3}\.\d{0,3}\.\d{0,3})/.source
  # Правило для строки
  # функция не должна править строку так чтобы повторно срабатывать
  # @return false если правило не сработало
  replace:->
    self = @

    # Правило
    re = new RegExp @re.prefix + /(\"|\\\")(\S+)/.source, 'i'
    m = @text.match re
    if m
      str = m[1] + @Lib.QUOTE_FIRS_OPEN + m[3]
      # Замена
      @text = @text.replace re , str
    !!m
  ###
  Создание защищенного тега с содержимым

  @see  EMT_lib::build_safe_tag
  @param  [string] $content
  @param  [string] $tag
  @param  [array] $attribute
  @return   [string]
  ###
  tag:(content, tag, attribute )->
    attribute ?= {}
    classname = ''
    tag ?= 'span'
    classname = attribute.class if attribute.class
    if classname is "nowrap"
      unless @is_on 'nowrap'
        tag = "nobr"
        attribute = {}

    style_inline = @classes[classname] if @classes?[classname]
    attribute['__style'] = style_inline if style_inline

    classname = @class_layout_prefix + classname if @class_layout_prefix
    attribute.class = classname

    if @use_layout
      layout = @use_layout

    return @Lib.build_safe_tag content, tag, attribute, layout

  ###
  Создание тега с содержимым

  @see  EMT_lib::build_safe_tag
  @param  [string] $content
  @param  [string] $tag
  @param  [array] $attribute
  @return   [string]
  ###
  ntag:(content, tag, attributes )->
    attributes ?= {}
    classname = ''
    tag ?= 'span'
    param = ''
    for attribute of attributes
      param = " #{attribute}='#{attributes[attribute]}'"
    "<#{tag}#{param}>#{content}</#{tag}>"

module.exports = OpenQuote

if typeof window isnt 'undefined'
  App.Rules['open_quote'] = OpenQuote

