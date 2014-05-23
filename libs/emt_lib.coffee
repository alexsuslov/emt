class EMTLib

  charsTable : require './chars_table'

  html4_char_ents : require './html4_char_ents'

  domain_zones:[
    "r","ру","com","ком","org","орг","уа","ua"
    ]

  # Типы кавычек
  QUOTE_FIRS_OPEN : '&laquo;'
  QUOTE_FIRS_CLOSE : '&raquo;'
  QUOTE_CRAWSE_OPEN : '&bdquo;'
  QUOTE_CRAWSE_CLOSE : '&ldquo;'

  LAYOUT_STYLE: 1
  LAYOUT_CLASS: 2

  INTERNAL_BLOCK_OPEN: '%%%INTBLOCKO235978%%%'
  INTERNAL_BLOCK_CLOSE: '%%%INTBLOCKC235978%%%'

  # static (TO BE DONE: protected)
  _typographSpecificTagId: false
  ###
  Проверка на целое
  @param [Number] число
  @return [boolean]
  TEST ok
  ###
  isInt: (n)->
    return n is +n and n is (n|0)

  isArray:(o)->
    Object.prototype.toString.call(o) is '[object Array]'

  isObject:(o)->
    Object.prototype.toString.call(o) is '[object Object]'

  trim:(str)->
    str.replace( /^\s+/, '').replace( /\s+$/, '')

  repeat: ( input, multiplier )->
    buf = ""
    i = 0
    while i < multiplier
      buf += input
      i++
    buf

  ###
  Метод, осуществляющий декодирование информации
  @param     [String] text
  @return    [String]
  TEST ok
  ###
  decrypt_tag:(text)->
    new Buffer(text.slice(0, -1), 'base64').toString()


  ###
  Метод, осуществляющий кодирование (сохранение) информации
  с целью невозможности типографировать ее
  @param     [String] text
  @return    [String]
  TEST ok
  ###
  encrypt_tag: (text)->
    new Buffer(text).toString('base64') + '='


  ###
    Сохраняем содержимое тегов HTML

  Тег 'a' кодируется со специальным префиксом для дальнейшей
  возможности выносить за него кавычки.

   @param  [String] $text
   @param  [boolean] $safe
   @return [String]

  TEST ok
  ###
  safe_tag_chars:(text, way)->
    self = @

    process = (str)->
      match = str.match new RegExp '(\</?)(.+?)(\>)'
      atag =''
      atag = "%%___" if match[2][0] is 'a'
      match[2] = match[2].replace /^%%___/,''
      options = self.encrypt_tag match[2] if way
      options = self.decrypt_tag match[2] unless way
      "#{match[1]}#{atag}#{options}#{match[3]}"

    text.replace /\<.+?\>/gm, process

  ###
  Удаление кодов HTML из текста
  ```
  <code>
   // Remove UTF-8 chars:
      $str = EMT_Lib::clear_special_chars('your text', 'utf8');
   // ... or HTML codes only:
      $str = EMT_Lib::clear_special_chars('your text', 'html');
      // ... or combo:
   $str = EMT_Lib::clear_special_chars('your text');
  </code>
  ```
  @param   [String] $text
  @param   [Array] $mode
  @return  [String]|[boolean]
  TEST
  ###
  clear_special_chars:( text, mode)->

    return false unless text
    mode = [mode] if typeof mode is  'string'
    mode = ['utf8', 'html'] unless mode

    moder = []
    for mod in mode
      if mod in ['utf8','html']
        moder.push mod

    return false unless moder.length

    for char in @charsTable
      vals = @charsTable[char]
      for type in mode
        if type in vals
          for v in vals[type]
            if 'utf8' is type and @isInt v
              v = String.fromCharCode v
            if 'html' is type
              if v.search /<[a-z]+>/i
                v = @safe_tag_chars v, true
            text = text.replace v, char
    text

  ###
   Кодирует спец блок

   @param   [String] $text
   @return  [String]

  TEST ok
  ###
  encode_internal_blocks:(text)->
    text = @encrypt_tag text
    "#{@INTERNAL_BLOCK_OPEN}#{text}#{@INTERNAL_BLOCK_CLOSE}"

  iblock:(text)->
    @encode_internal_blocks text


  ###
  Декодриует спец блоки

  @param   [String] $text
  @return  [String]

  TEST ok
  ###
  decode_internal_blocks:(text)->
    decrypt_tag = @decrypt_tag
    _OPEN = @INTERNAL_BLOCK_OPEN
    reOpen = new RegExp "^" + _OPEN
    _CLOSE = @INTERNAL_BLOCK_CLOSE
    reClose = new RegExp _CLOSE + "$"
    re = new RegExp _OPEN + "(.*?)"+ _CLOSE , 'gm'

    process = (str)->
      decrypt_tag str.replace( reOpen, '').replace( reClose, '')

    text.replace re, process


  rand:(min, max)->
    min ?= 0
    max ?= 1
    Math.random() * (max - min) + min

  ### Создание тега с защищенным содержимым

  @param     [String] $content текст, который будет обрамлен тегом
  @param     [String] $tag тэг
  @param     [array] $attribute список атрибутов,
  где ключ - имя атрибута, а значение - само значение данного атрибута
  @return    [String]
  ###
  build_safe_tag:(content, tag, attribute, layout)->
    tag ?= 'span'
    attribute ?= {}
    layout ?= @LAYOUT_STYLE
    htmlTag = tag

    if @_typographSpecificTagId
      unless 'id' in attribute
        attribute['id'] = 'emt-2' + @rand(1000,9999)

    classname = ""
    if Object.keys(attribute).length
      if (layout & LAYOUT_STYLE)
        if('__style' in attribute and attribute['__style'])
          st = @trim attribute['style']
          st += ";" if st[-1] != ";"
          st += attribute['__style']
          attribute['style'] = st
        else
          attribute['style'] = attribute['__style']
          delete attribute['__style']

      for attr in attribute
        value = attribute[attr]
        if attr is "__style"
          continue

        if attr is "class"
          classname = value
          continue

        htmlTag += " #{attr}=\"#{value}\""

    if (layout & LAYOUT_CLASS ) and classname
      htmlTag += " class=\"#{classname}\""

    "<" + @encrypt_tag(htmlTag) + ">" + content + "</" + @encrypt_tag(tag) + ">"



  ###
  Метод, осуществляющий декодирование информации

  @param   [String] $text
  @return  [String]

  ###
  strpos_ex:( haystack, needle, offset)->
    #TODO: &$haystack - '&' couldn't work
    if @isArray needle
      m = -1
      w = -1
      for n in needle
        p = haystack.find n , offset
        if p is -1
          m = p
          w = n
          continue
        if p < m
          m = p
          w = n
      if m is -1
        return false
      return pos: m, str: w

    return haystack.find needle, offset

  process_selector_pattern:(pattern)->
    #TODO: &$pattern - '&' couldn't work
    return if pattern is false
    #pattern = preg_quote(pattern , '/') #TODO
    pattern.replace "*", "[a-z0-9_\-]*" #TODO

  test_pattern: ( pattern, text)->
    if pattern is false
      return True
    return re.match(pattern, text) #TODO

  strtolower:(string)->
    string.toLowerCase()

  ###
  @todo getUnicodeChar()
  ###

  ###
  Вернуть уникод символ по html entinty

  @param [String] $entity
  @return [String]
  ###
  html_char_entity_to_unicode:( entity)->
    if entity in @html4_char_ents
      return @getUnicodeChar @html4_char_ents[entity]
    return false

module.exports =
  EMTLib: EMTLib
  emtlib: new EMTLib()


