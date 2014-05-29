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
    on: on
    log: off
    debug: off

  ###
  Конструктор
  @param opt[object]
  - Lib[Object] обязательно
  - text[String] строка
  ###
  constructor:(@opt)->
    @config = @opt.config[@configName] if @opt.config?[@configName]
    if @opt.Lib
      @Lib = @opt.Lib
    else
      @logger 'error', 'No lib'

    @text = @opt.text if @opt.text
    @


  ###
  Логер
  @param level[string] error|warning|info| debug
  @param message[string] сообщение
  @param obj[obj] object ошибки
  ###
  logger:(level, message, obj)->
    return unless  @config.log

    throw new Error message if level is 'error'

    if level in ['warning','info']
      console.log new Date +" #{level}: #{message}"

    console.log "#{level}: #{message}", obj if level is 'debug'
    @

  ###
  Debug
  @param level[string] error|warning|info
  @param message[string] сообщение
  @param obj[obj] object ошибки
  ###
  debug:(obj)->
    return unless  @config.debug
    @logger 'debug', @configName, obj
    @

  # Цикл применения правила
  # сохраняет время работы в @profiling
  multiply:()->
    start = new Date().getTime()
    while @replace()
      @used += 1
      # защита от бесконечного цикла
      break if @used > 4096
    @profiling = new Date().getTime() - start
    @

  # Применение правила для text
  apply:->
    return unless @config.on
    @multiply()

  # Правило для строки
  # функция не должна править строку так чтобы повторно срабатывать
  # @return false если правило не сработало
  replace:->
    self = @

    # Правило
    re = /(^|\(|\s|\>|-)(\"|\\\")(\S+)/i
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

