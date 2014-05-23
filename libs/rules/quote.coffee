# Зависимости
Rules = require( './rules')

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
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
      "quotes_outside_a"
      "open_quote"
      "close_quote"
      "close_quote_adv"
      "open_quote_adv"
      "quotation"
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
    # Уходим если группа правил отключена
    return unless @config[@configName].on

    if @opt.Lib
      @Lib = @opt.Lib
    else
      @logger 'error', 'No lib'

    @text = @opt.text if @opt.text

    # Добавляю правила в очередь
    for ruleName in @order
      if Rules[ruleName]
        @rules.push new Rules[ruleName]
          Lib: @Lib
          text: @text
    @


  # Применение правил @text
  apply:->
    # Уходим если группа правил отключена
    return unless @config[@configName].on
    for rule in @rules
      rule.apply()
    @text

exports.module = Quote
