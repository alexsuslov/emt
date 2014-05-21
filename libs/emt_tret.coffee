class EMTret
  Lib: new require( './emt_lib').EMTLib
  rules : {}
  rule_order : []
  title : ""


  disabled : {}
  enabled  : {}
  _text: ''
  logging : false
  logs    : []
  errors  : []
  debug_enabled  : false
  debug_info     : []


  use_layout : false
  use_layout_set : false
  class_layout_prefix : false

  class_names     : {}
  classes         : {}
  settings        : {}
  intrep : ""


  log:( str, data)->
    return unless @logging
    @logs.push
      info: str
      data: data

  error:(info, data)->
    @errors.push
      info: info
      data: data
    @log "ERROR: #{info}" , data

  debug: (place, after_text)->
    return unless @debug_info
    @debug_info.push
      place: place
      text: after_text
  ###
  Установить режим разметки для данного Трэта если не было раньше установлено,
  EMT_Lib::LAYOUT_STYLE - с помощью стилей
  EMT_Lib::LAYOUT_CLASS - с помощью классов

  @param [number] $kind
  ###
  set_tag_layout_ifnotset:(layout)->
    return if @use_layout_set
    @use_layout = layout


  ###
  Установить режим разметки для данного Трэта,
    EMT_Lib::LAYOUT_STYLE - с помощью стилей
    EMT_Lib::LAYOUT_CLASS - с помощью классов
    EMT_Lib::LAYOUT_STYLE|EMT_Lib::LAYOUT_CLASS - оба метода

  @param [Number] $kind
  ###
  set_tag_layout:(layout)->
    layout ?= @Lib.LAYOUT_STYLE
    @use_layout = layout
    @use_layout_set = true


  set_class_layout_prefix:(prefix)->
    @class_layout_prefix = prefix

  debug_on:->
    @debug_enabled = True

  log_on:->
    @debug_enabled = True


  _pre_parse:->
    @pre_parse()

  _post_parse:->
    @post_parse()

  intrepfun:(m)->
    ###
    @todo
    ###
    exec 'x = ' + @intrep + ''
    return x

  preg_replace_one:(pattern, replacement, text)->
    ###
    @todo
    !!!нет @Lib.parse_preg_pattern
    !!!нет @Lib.re_sub
    ###
    p = @Lib.parse_preg_pattern(pattern)
    unless p.eval
      return @Lib.re_sub(p['pattern'], (replacement), text, 0, p['flags'])
    intrep = replacement
    ###
    @todo
    ###
    # return re.sub(p['pattern'], @intrepfun, text, 0, p['flags'])


  preg_replace:(pattern, replacement, text)->
    if typeof pattern is 'string'
      return @preg_replace_one(pattern, replacement, text)
    for k, i in pattern
      if typeof replacement is 'string'
        repl = replacement
      else
        repl = replacement[k]
      text = @preg_replace_one i, repl, text
    text

  preg_replace_ex:(pattern, replacement, text, cycled)->
    while true
      texto = text
      text = @preg_replace(pattern, replacement, text)
      unless cycled
        break
      if text is texto
        break
    return text

  apply_rule:(rule)->
    name = rule['id']
    disabled = @disabled.get(rule['id']) or (
      rule.get('disabled') and not @enabled.get(rule['id'])
      )

    if disabled
      if @disabled.get rule.id
        logMsg = "Правило отключено (по умолчанию)"
      else
        logMsg = ""
      @log "Правило $name", logMsg
      return
    ###
    @todo
    ###
    # if rule.get 'function'
    #   unless rule.get 'pattern'
    #     if rule['function'] of @

  _apply:(xlist)->
    @errors = []
    @_pre_parse()
    @log "Применяется набор правил", ','.join(xlist)
    rulelist = []
    for k in xlist
      rule = @rules[k]
      rule['id'] = k
      rule.order = 5 unless rule.order
      rulelist.push rule

    for rule in rulelist
      @apply_rule rule
      @debug rule['id'], @._text

    @_post_parse()


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

    style_inline = @classes[classname] if @classes[classname]
    attribute['__style'] = style_inline if style_inline

    classname = @class_layout_prefix + classname if @class_layout_prefix
    attribute.class = classname

    if @use_layout
      layout = @use_layout

    return @Lib.build_safe_tag content, tag, attribute, layout


  ###
  Добавить правило в группу

  @param [string] $name
  ###
  put_rule:(name)->
    @disabled[name] = true
    delete @enabled[name] if @enabled[name]

  ###
  Включить правило
  @param [string] $name
  ###
  enable_rule:(name)->
    @enabled[name] = true
    delete @disabled[name] if @disabled[name]

  ###
  Добавить настройку в трет

  @param string $key ключ
  @param mixed $value значение
  ###
  set:(key, value)->
    @settings[key] = value

  ###
  Установлена ли настройка
  @param string $key
  ###
  is_on:(key)->
    return false unless @settings[key]
    kk = @settings[key]
    return true if kk.lower() is "on"
    return true if kk is "1"
    return true if kk is 1
    return true if kk is true
    return false


  ###
  Получить строковое значение настройки

  @param unknown_type $key
  @return unknown
  ###
  ss:(key)->
    return @settings[key] if @settings[key]
    ''

  ###
  Добавить настройку в правило

  @param [string] $rulename идентификатор правила
  @param [string] $key ключ
  @param [mixed] $value значение
  ###
  set_rule:(rulename, key, value)->
    @rules[rulename] = {} unless @rules[rulename]
    @rules[rulename][key] = value


  ###
  Включить правила, согласно списку
  @param [array] $list список правил
  @param [boolean] $disable выкллючить их или включить
  @param [boolean] $strict строго, т.е.
  те которые не в списку будут тоже обработаны
  ###
  activate:(xlist, disable, xstrict)->
    xstrict ?= true
    for rulename in xlist
      if disable
        @disable_rule rulename
      else
        @enable_rule rulename
    if xstrict
      for rulename of @rules
        y = @rules[rulename]
        if rulename in xlist
          continue

        unless disable
          @disable_rule rulename
        else
          @enable_rule rulename

  set_text:(text)->
    @_text = text
    @debug_info = []
    @logs = []


  ###
  Применить к тексту

  @param [string] $text - текст к которому применить
  @param [array] $list - список правил, null - все правила
  @return string
  ###
  apply:(xlist)->
    if typeof xlist is  'string'
      rlist = [xlist]
    else if @Lib.isArray xlist
      rlist = xlist
    else
      rlist = @rule_order
    @_apply(rlist)

    @_text
  ###
  Код, выполняем до того, как применить правила

  ###
  pre_parse:->

  ###
  После выполнения всех правил, выполняется этот метод

  ###
  post_parse:->

exports.EMTret = EMTret





