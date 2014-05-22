###
Evgeny Muravjev Typograph, http://mdash.ru
Version: 3.0 Gold Master
Release Date: September 28, 2013
Authors: Evgeny Muravjev & Alexander Drutsa
###

EMTretQuote = require( '../libs/emt_tret_quote').EMTretQuote
reEscape = require('./escapeRegExp').reEscape

###
Основной класс типографа Евгения Муравьёва
реализует основные методы запуска и рабыоты типографа
###
class EMTBase
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

  ###
  Конструктор
  Инициализация класса, используется чтобы задать список третов или
  список защищённых блоков, которые можно использовать.
  Также здесь можно отменить защищённые блоки по умлочнаию

  @param [object] опции
    - Lib библиотека
  ###

  constructor:(opt)->
    @Lib = opt.Lib if opt?.Lib

    # add EMTretQuote to tret_objects
    @trets.push 'EMTretQuote'
    @tret_objects['EMTretQuote'] = new EMTretQuote
      Lib:@Lib

    # for tret in @trets
    #   unless @tret_objects[tret]
    #     @tret_objects[tret] = new
    #   # @todo
    #   obj = @create_object(tret)
    #   continue unless obj

    #   @tret_objects[tret] = obj
    unless @inited
      @add_safe_tag('pre')
    #   @add_safe_tag('script')
    #   @add_safe_tag('style')
    #   @add_safe_tag('notg')
    #   @add_safe_block( 'span-notg', '<span class="_notg_start"></span>',
    #     '<span class="_notg_end"></span>'
    #     )
    # @inited = true

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
    reEscape str

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
  Добавить Трэт,
  @param [array] $class - имя класса трета, или сам объект
  @param [string] $altname - альтернативное имя,
  если хотим например иметь два одинаоковых терта в обработке
  @return [unknown]
  ###
  add_tret:(xclass, altname)->
    altname ?= false
    if typeof xclass is 'string'
      obj = @create_object xclass
      return false unless obj
      idx = xclass
      idx = altname if altname

      @tret_objects[idx] = obj
      @trets.push idx
      return true
      ###
      @todo
      try
        unless issubclass(xclass, EMT_Tret):
          self.error("You are adding Tret that doesn't inherit
          base class EMT_Tret", xclass.__class__.__name__)
          return False
          xclass.EMT     = self
          xclass.logging = self.logging
          self.tret_objects[ altname
            if altname else xclass.__class__.__name__] = xclass
          self.trets.append(altname if altname else xclass.__class__.__name__)
          return True
      except:
          self.error("Чтобы добавить трэт необходимо передать имя или объект")
      ###
      return false
  ###
  Получаем ТРЕТ по идентивикатору, т.е. заванию класса
  @param unknown_type $name
  ###
  get_tret:(name)->
    return @tret_objects[name] if @tret_objects[name]
    @error("Трэт с идентификатором #{name} не найден")
    return false
    ###
    @todo
    for tret in @trets
      if tret is name

        @todo
        ```
        self._init()
        @tret_objects[name]
        ```
    ###

  ###
  Задаём текст для применения типографа
  @param string $text
  ###
  set_text:(@_text)->

  ###
  Запустить типограф на выполнение
  ###
  apply:(trets)->
    @ok = false
    atrets = @trets
    if typeof trets is 'string'
      atrets = [trets]
    else if @Lib.isArray trets
      atrets = trets

    # self.debug(self, 'init', self._text)

    # self._text = self.safe_blocks(self._text, True)

    # self.debug(self, 'safe_blocks', self._text)

    # self._text = EMT_Lib.safe_tag_chars(self._text, True)
    # self.debug(self, 'safe_tag_chars', self._text)

    # self._text = EMT_Lib.clear_special_chars(self._text)
    # self.debug(self, 'clear_special_chars', self._text)
    ###
    @current
    ###


  ###
  Получить содержимое <style></style> при использовании классов
  @param [bool] $list False - вернуть в виде строки для style или как массив
  @param [bool] $compact не выводить пустые классы
  @return [string]|[array]
  ###
  get_style:( xlist, compact)->
    res = {}
    for tret in @trets
      arr = @tret_objects[tret].classes
      continue unless @Lib.isArray arr
      # for classname in arr
      ###
      @todo
      ###


  ###
  Установить режим разметки,
    EMT_Lib::LAYOUT_STYLE - с помощью стилей
    EMT_Lib::LAYOUT_CLASS - с помощью классов
    EMT_Lib::LAYOUT_STYLE|EMT_Lib::LAYOUT_CLASS - оба метода

  @param [int] $layout
  ###
  set_tag_layout:(layout)->
    layout ?= @Lib.LAYOUT_STYLE
    @use_layout = layout
    @use_layout_set = true


  ###
  Установить префикс для классов
  @param [string]|bool $prefix
  если True то префикс 'emt_', иначе то, что передали
  ###
  set_class_layout_prefix:(prefix)->
    prefix = "emt_" if prefix is true
    @class_layout_prefix = prefix || "emt_"

  ###
  Включить/отключить правила, согласно карте
  Формат карты:
     'Название трэта 1' => array ( 'правило1', 'правило2' , ...  )
     'Название трэта 2' => array ( 'правило1', 'правило2' , ...  )
  # *
  @param array $map
  @param boolean $disable если ложно,
  то $map соотвествует тем правилам,
  которые надо включить иначе это список правил,
  которые надо выключить
  @param boolean $strict строго, т.е. те
  которые не в списку будут тоже обработаны
  ###
  set_enable_map:(xmap, disable, xstrict)->
    return unless @Lib.isArray xmaps
    xstrict ?= true
    trets = []
    for tret in xmap
      xlist = tret
      ###
      @todo
      ###

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
  Установить настройку
  @param mixed $selector
  @param string $setting
  @param mixed $value
  ###
  doset:(selector, key, value)->
    rule_pattern = tret_pattern = false
    if typeof selector is 'string'
      if selector.find(".") is -1
        tret_pattern = selector
      else
        pa = selector.split(".")
        tret_pattern = pa[0]
    ###
    @todo
    ###


  ###
  Установить настройки для тертов и правил
  1. если селектор является массивом,
    то тогда утсановка правил будет выполнена для каждого
    элемента этого массива, как отдельного селектора.
  2. Если $key не является массивом, то эта настрока будет проставлена
  согласно селектору
  3. Если $key массив
  - то будет задана группа настроек
  - если $value массив , то настройки определяются по ключам из массива
  $key, а значения из $value
  - иначе, $key содержит ключ-значение как массив
  @param mixed $selector
  @param mixed $key
  @param mixed $value
  ###
  set:(self, selector, key , value)->
    if @Lib.isArray selector
      for val in selector
        @set val, key, value
      return
    ###
    @todo
    if selector is object
    ###

  ###
  Возвращает список текущих третов, которые установлены
  ###
  get_trets_list:->
    @trets

  ###
  Установить настройки
  @param [array] $setupmap
  ###
  setup:(setupmap)->
    ###
    @todo
    ###


module.exports =
  EMTBase: EMTBase
