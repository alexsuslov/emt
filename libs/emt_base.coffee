###
Evgeny Muravjev Typograph, http://mdash.ru
Version: 3.0 Gold Master
Release Date: September 28, 2013
Authors: Evgeny Muravjev & Alexander Drutsa
###



###
Основной класс типографа Евгения Муравьёва
реализует основные методы запуска и рабыоты типографа
###
class EMTBase
  Lib: new require( './emt_lib').EMTLib
    _text : ""
    inited : false
    #
    # Список Трэтов, которые надо применить к типогрфированию
    #
    # @var array
    #
    trets_index: []
    trets: []
    tret_objects: {}

    ok             : false
    debug_enabled  : false
    logging        : false
    logs           : []
    errors         : []
    debug_info     : []

    use_layout : false
    class_layout_prefix : false
    use_layout_set : false
    disable_notg_replace : false
    remove_notg : false
    settings : {}
    _safe_blocks : {}

  log: (xstr, data)->
    return unless @logging
    @logs.append 'class': '', 'info': xstr, 'data': data

  tret_log:( tret, xstr, data)->
    @logs.append 'class': tret, 'info': xstr, 'data': data

  error:(self, info, data)->
    @errors.append( 'class': '', 'info': info, 'data': data)
    @log( "ERROR #{info}", data )

  tret_error:( tret, info, data)->
    @errors.append({'class': tret, 'info': info, 'data': data})


  debug:(xclass, place, after_text, after_text_raw)->
    return unless self.debug_enabled
    after_text_raw ?= ""
    if typeof(xclass) is "string"
      classname = xclass
    else
      classname = xclass.__class__.__name__
      tret = false
      tret = true unless xclass is self

      @debug_info.append
        tret: tret
        class : classname
        place : place
        text  : after_text
        text_raw : after_text_raw

  ###
  Включить режим отладки, чтобы посмотреть последовательность вызовов
  третов и правил после
  ###
  debug_on: ->
    @debug_enabled = True


  ###
  Включить режим отладки, чтобы посмотреть последовательность вызовов
  третов и правил после
  ###
  log_on: ->
    @logging = True

  ###
  Добавление защищенного блока
  ```
  <code>
   Jare_Typograph_Tool::addCustomBlocks('<span>', '</span>');
   Jare_Typograph_Tool::addCustomBlocks('\<nobr\>', '\<\/span\>', True);
  </code>
  ```
  @param  [String] $id идентификатор
  @param  [String] $open начало блока
  @param  [String] $close конец защищенного блока
  @param  [String] $tag тэг
  @return  void
  ###
  _add_safe_block:(xid, xopen, close, tag)->
    @_safe_blocks[xid] =
      id: xid
      tag: tag
      open:  xopen
      close:  close

  ###
  Список защищенных блоков
  @return   array
  ###
  get_all_safe_blocks:->
    return @_safe_blocks

  ###
  Удаленного блока по его номеру ключа
  @param  [string] $id идентифиактор защищённого блока
  @return  [void]
  ###
  remove_safe_block:( xid)->
    @_safe_blocks.splice xid, 1

  reEscape: (str)->
    require('./escapeRegExp')(str)

  ###
  Добавление защищенного блока

  @param  [string] $tag тэг, который должен быть защищён
  @return  [void]
  ###
  add_safe_tag:(tag)->
    xopen = @reEscape("<") + tag + "[^>]*?" + @reEscape(">")
    close = @reEscape("</" + tag + ">")
    @_add_safe_block(tag, xopen, close, tag)
    return true

  trim:(str)->
    str.replace( /^\s+/, '').replace( /\s+$/, '')

  ###
  Добавление защищенного блока

  @param  [string] $open начало блока
  @param  [string] $close конец защищенного блока
  @param  [bool] $quoted специальные символы в начале и конце блока экранированы
  @return  [void]
  ###
  add_safe_block:( xid, xopen, close, quoted)->
    quoted ?= false
    xopen = @trim xopen
    close = @trim close

    return false if xopen is "" or close is ""


    unless quoted
      xopen = @reEscape(xopen)
      close = @reEscape(close)

    @_add_safe_block(xid, xopen, close, "")
    return true
  ###
  Сохранение содержимого защищенных блоков
  @param   [string] $text
  @param   [bool] $safe если True
    , то содержимое блоков будет сохранено, иначе - раскодировано.
  @return  string

  ###
  safe_blocks:(text, way, show)->
    show ?= true
    ###
    if @_safe_blocks.length
    Это просто подарок
    @todo
    ```
    safeType =  "EMT_Lib.encrypt_tag(m.group(2))"
    if True == way else "stripslashes(EMT_Lib.decrypt_tag(m.group(2)))"
      def safereplace(m):
          return m.group(1)+(EMT_Lib.encrypt_tag(m.group(2))
          if True == way else EMT_Lib.decrypt_tag(m.group(2))
            .replace("\\n","\n").replace("\\r","\n")
            .replace("\\","")) + m.group(3)
      for idx in self._safe_blocks:
          block = self._safe_blocks[idx]
          #text = EMT_Lib.preg_replace(u"/("+block['open']+u")(.+?)
          ("+block['close']+u")/ue",
          'm.group(1)+' + safeType + '+m.group(3)', text)
          text = re.sub(u"("+block['open']+u")(.+?)("+block['close']+u")",
           safereplace, text, 0, re.U)
    ```
    ###
    return text

  ###
  Декодирование блоков, которые были скрыты в момент типографирования
  @param   [string] $text
  @return  [string]
  ###
  decode_internal_blocks:(text)->
    @Lib.decode_internal_blocks(text)

  create_object:(tret)->
    # если класса нет, попытаемся его прогрузить, например, если стандартный
    ###
    @todo

    ###

  get_short_tret:(tretname)->
    m = tretname.match '^EMT_Tret_([a-zA-Z0-9_]+)$'
    return m[1] if m
    return tretname

  ###
  Инициализация класса, используется чтобы задать список третов или
  спсиок защищённых блоков, которые можно использовать.
  Также здесь можно отменить защищённые блоки по умлочнаию
  ###

  constructor:->
    for tret in @trets
      continue if @tret_objects[tret]

      obj = @create_object(tret)
      continue unless obj

      @tret_objects[tret] = obj
    unless @inited
      @add_safe_tag('pre')
      @add_safe_tag('script')
      @add_safe_tag('style')
      @add_safe_tag('notg')
      @add_safe_block( 'span-notg', '<span class="_notg_start"></span>',
        '<span class="_notg_end"></span>'
        )
    @inited = true
  ###
  Добавить Трэт,
  @param [array] $class - имя класса трета, или сам объект
  @param [string] $altname - альтернативное имя,
  если хотим например иметь два одинаоковых терта в обработке
  @return [unknown]
  ###
  add_tret:( xclass, altname)->
    altname ?= false
    if typeof xclass is 'string'
      obj = @create_object xclass
      return false unless obj
      idx = xclass
      idx = altname if altname

      @tret_objects[idx] = obj
      @trets.push idx
      return true





