###
## Правило "Открывающая кавычка"
используется как объект расширения для остальных правил
###
class OpenQuote
  description: "Открывающая кавычка"
  version:'0.0.0'
  configName:'OpenQuote'

  config:
    on: true
    log: true
    debug:true

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

    console.log " #{level}: #{message}", obj if level is 'debug'
    @

  ###
  Debug
  @param level[string] error|warning|info
  @param message[string] сообщение
  @param obj[obj] object ошибки
  ###
  debug:(obj)->
    return unless  @config.debug
    logger 'debug', '', obj
    @

  apply:->
    return if @config.on
    self = @
    debug = @config.debug

    # Правило
    re = /(^|\(|\s|\>|-)(\"|\\\")(\S+)/i

    # Замена
    @text = @text.replace re , (str)->
      self.debug str if debug

      m = str.match re
      self.debug m if debug

      m[1] + @Lib.QUOTE_FIRS_OPEN + m[3]
    @

exports.module = OpenQuote
