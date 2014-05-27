###
## Групповой Объект правил "Кавычки"
используется как объект расширения для остальных груп правил
###
class Quote
  description: "Кавычки"
  version:'0.0.0'
  # Имя конфига
  configName:'Quote'

  # Конфиг для теста
  config:
    on:     on
    log:    off
    debug:  off

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
      # "quotes_outside_a"
      "OpenQuote"
      "CloseQuote"
      # "close_quote_adv"
      # "open_quote_adv"
      # "quotation"
    ]

  ###
  Конструктор
  - Настраивает конфиг
  - Замыкает на себя text
  - Создает список правил согласно прядка

  @param opt[object]
  - Lib[Object] обязательно
  - text[String] строка
  ###
  constructor:(@opt)->
    @config = @opt.config[@configName] if @opt.config?[@configName]
    @Rules = @opt.Rules if @opt.Rules
    # Уходим если группа правил отключена
    return unless @config.on

    if @opt.Lib
      @Lib = @opt.Lib
    else
      @logger 'error', 'No lib'

    @text = @opt.text if @opt.text

    # Добавляю правила в очередь
    for ruleName in @order
      if @Rules[ruleName]
        @rules.push new @Rules[ruleName]
          Lib: @Lib
    @


  # Применение правил @text
  apply:->
    # Уходим если группа правил отключена
    return unless @config.on
    for rule in @rules
      rule.text = @text
      rule.apply()
      @text = rule.text

module.exports = Quote

if typeof window isnt 'undefined'
  App.Rules.Quote = Quote
