###
Правило "Открывающая кавычка"
используется как объект расширения для остальных правил
###
class OpenQuote
  used:0
  timer:0
  description: "Открывающая кавычка"
  version:'0.0.0'
  configName:'OpenQuote'
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
    @profiling = new Date().getTime() - start
    @

  # Применение правила для text
  apply:->
    return unless @config.on
    @multiply()

  # Правило замены
  replace:->
    self = @
    use = true
    # Правило
    re = /(^|\(|\s|\>|-)(\"|\\\")(\S+)/i

    # Замена
    @text = @text.replace re , (str)->
      self.debug str

      m = str.match re
      self.debug m
      use = false

      m[1] + self.Lib.QUOTE_FIRS_OPEN + m[3]

    use

module.exports = OpenQuote
