isClient = !(typeof window is 'undefined')

if isClient
  module = {}

  App =
    rules:[]
    text:''
    Lib:{}
    Rules:{}
    order:[
      'Quote'
      'Abbr'
      'Numbers'
      'Dash'
      'EmtDate'
      'Etc'
      'NoBr'
    ]


    apply:->
      @text = @el.html()

      for rule in @rules
        rule.text = @text
        rule.apply()
        @text = rule.text

      @el.html @text
      @


    init: (@opt, @el)->

      # Добавляю правила в очередь
      for ruleName in @order
        if @Rules[ruleName]
          @rules.push new @Rules[ruleName]
            Rules:  @Rules
            Lib:    @Lib

      @apply()
      @

  window.App = App

  $ ->
    $.fn.emt = (options)->
      App.init options, @


chars_table =
  '"' :
    html : [
      '&laquo;', '&raquo;', '&ldquo;', '&lsquo;', '&bdquo;'
      '&ldquo;', '&quot;', '&#171;', '&#187;'
      ]
    utf8 : [0x201E, 0x201C, 0x201F, 0x201D, 0x00AB, 0x00BB]
  ' ' :
    html : ['&nbsp;', '&thinsp;', '&#160;']
    utf8 : [0x00A0, 0x2002, 0x2003, 0x2008, 0x2009]
  '-':
    html : ['&ndash;', '&minus;', '&#151;', '&#8212;', '&#8211;']
    #'&mdash;'
    utf8 : [0x002D, 0x2010, 0x2012, 0x2013] #0x2014,
  '—' :
    html : ['&mdash;']
    utf8 : [0x2014]
  '==' :
    html : ['&equiv;']
    utf8 : [0x2261]
  '...' :
    html : ['&hellip;', '&#0133;']
    utf8 : [0x2026]
  '!=' :
    html : ['&ne;', '&#8800;']
    utf8 : [0x2260]
  '<=' :
    html : ['&le;', '&#8804;']
    utf8 : [0x2264]
  '>=' :
    html : ['&ge;', '&#8805;']
    utf8 : [0x2265]
  '1/2' :
    html : ['&frac12;', '&#189;']
    utf8 : [0x00BD]
  '1/4' :
    html : ['&frac14;', '&#188;']
    utf8 : [0x00BC]
  '3/4' :
    html : ['&frac34;', '&#190;']
    utf8 : [0x00BE]
  '+-' :
    html : ['&plusmn;', '&#177;']
    utf8 : [0x00B1]
  '&' :
    html : ['&amp;', '&#38;']
  '(tm)' :
    html : ['&trade;', '&#153;']
    utf8 : [0x2122]
  #'(r)' : html : ['<sup>&reg;</sup>', '&reg;', '&#174;']
  '(r)' :
    html : ['&reg;', '&#174;']
    utf8 : [0x00AE]
  '(c)' :
    html : ['&copy;', '&#169;']
    utf8 : [0x00A9]
  '§' :
    html : ['&sect;', '&#167;']
    utf8 : [0x00A7]
  '`' :
    html : ['&#769;']
  '\'' :
    html : ['&rsquo;', '’']
  'x' :
    html : ['&times;', '&#215;']
    utf8 : ['×']
  # какой же у него может быть код?

  #Добавление к тегам атрибута 'id', благодаря которому
  #при повторном типографирование текста будут удалены теги,
  #Расставленные данным типографом

if window?
  window.chars_table = chars_table
else
  exports.module = chars_table

# взято с http://www.w3.org/TR/html4/sgml/entities.html
html4_char =
    'nbsp' : 160,
    'iexcl' : 161,
    'cent' : 162,
    'pound' : 163,
    'curren' : 164,
    'yen' : 165,
    'brvbar' : 166,
    'sect' : 167,
    'uml' : 168,
    'copy' : 169,
    'ordf' : 170,
    'laquo' : 171,
    'not' : 172,
    'shy' : 173,
    'reg' : 174,
    'macr' : 175,
    'deg' : 176,
    'plusmn' : 177,
    'sup2' : 178,
    'sup3' : 179,
    'acute' : 180,
    'micro' : 181,
    'para' : 182,
    'middot' : 183,
    'cedil' : 184,
    'sup1' : 185,
    'ordm' : 186,
    'raquo' : 187,
    'frac14' : 188,
    'frac12' : 189,
    'frac34' : 190,
    'iquest' : 191,
    'Agrave' : 192,
    'Aacute' : 193,
    'Acirc' : 194,
    'Atilde' : 195,
    'Auml' : 196,
    'Aring' : 197,
    'AElig' : 198,
    'Ccedil' : 199,
    'Egrave' : 200,
    'Eacute' : 201,
    'Ecirc' : 202,
    'Euml' : 203,
    'Igrave' : 204,
    'Iacute' : 205,
    'Icirc' : 206,
    'Iuml' : 207,
    'ETH' : 208,
    'Ntilde' : 209,
    'Ograve' : 210,
    'Oacute' : 211,
    'Ocirc' : 212,
    'Otilde' : 213,
    'Ouml' : 214,
    'times' : 215,
    'Oslash' : 216,
    'Ugrave' : 217,
    'Uacute' : 218,
    'Ucirc' : 219,
    'Uuml' : 220,
    'Yacute' : 221,
    'THORN' : 222,
    'szlig' : 223,
    'agrave' : 224,
    'aacute' : 225,
    'acirc' : 226,
    'atilde' : 227,
    'auml' : 228,
    'aring' : 229,
    'aelig' : 230,
    'ccedil' : 231,
    'egrave' : 232,
    'eacute' : 233,
    'ecirc' : 234,
    'euml' : 235,
    'igrave' : 236,
    'iacute' : 237,
    'icirc' : 238,
    'iuml' : 239,
    'eth' : 240,
    'ntilde' : 241,
    'ograve' : 242,
    'oacute' : 243,
    'ocirc' : 244,
    'otilde' : 245,
    'ouml' : 246,
    'divide' : 247,
    'oslash' : 248,
    'ugrave' : 249,
    'uacute' : 250,
    'ucirc' : 251,
    'uuml' : 252,
    'yacute' : 253,
    'thorn' : 254,
    'yuml' : 255,
    'fnof' : 402,
    'Alpha' : 913,
    'Beta' : 914,
    'Gamma' : 915,
    'Delta' : 916,
    'Epsilon' : 917,
    'Zeta' : 918,
    'Eta' : 919,
    'Theta' : 920,
    'Iota' : 921,
    'Kappa' : 922,
    'Lambda' : 923,
    'Mu' : 924,
    'Nu' : 925,
    'Xi' : 926,
    'Omicron' : 927,
    'Pi' : 928,
    'Rho' : 929,
    'Sigma' : 931,
    'Tau' : 932,
    'Upsilon' : 933,
    'Phi' : 934,
    'Chi' : 935,
    'Psi' : 936,
    'Omega' : 937,
    'alpha' : 945,
    'beta' : 946,
    'gamma' : 947,
    'delta' : 948,
    'epsilon' : 949,
    'zeta' : 950,
    'eta' : 951,
    'theta' : 952,
    'iota' : 953,
    'kappa' : 954,
    'lambda' : 955,
    'mu' : 956,
    'nu' : 957,
    'xi' : 958,
    'omicron' : 959,
    'pi' : 960,
    'rho' : 961,
    'sigmaf' : 962,
    'sigma' : 963,
    'tau' : 964,
    'upsilon' : 965,
    'phi' : 966,
    'chi' : 967,
    'psi' : 968,
    'omega' : 969,
    'thetasym' : 977,
    'upsih' : 978,
    'piv' : 982,
    'bull' : 8226,
    'hellip' : 8230,
    'prime' : 8242,
    'Prime' : 8243,
    'oline' : 8254,
    'frasl' : 8260,
    'weierp' : 8472,
    'image' : 8465,
    'real' : 8476,
    'trade' : 8482,
    'alefsym' : 8501,
    'larr' : 8592,
    'uarr' : 8593,
    'rarr' : 8594,
    'darr' : 8595,
    'harr' : 8596,
    'crarr' : 8629,
    'lArr' : 8656,
    'uArr' : 8657,
    'rArr' : 8658,
    'dArr' : 8659,
    'hArr' : 8660,
    'forall' : 8704,
    'part' : 8706,
    'exist' : 8707,
    'empty' : 8709,
    'nabla' : 8711,
    'isin' : 8712,
    'notin' : 8713,
    'ni' : 8715,
    'prod' : 8719,
    'sum' : 8721,
    'minus' : 8722,
    'lowast' : 8727,
    'radic' : 8730,
    'prop' : 8733,
    'infin' : 8734,
    'ang' : 8736,
    'and' : 8743,
    'or' : 8744,
    'cap' : 8745,
    'cup' : 8746,
    'int' : 8747,
    'there4' : 8756,
    'sim' : 8764,
    'cong' : 8773,
    'asymp' : 8776,
    'ne' : 8800,
    'equiv' : 8801,
    'le' : 8804,
    'ge' : 8805,
    'sub' : 8834,
    'sup' : 8835,
    'nsub' : 8836,
    'sube' : 8838,
    'supe' : 8839,
    'oplus' : 8853,
    'otimes' : 8855,
    'perp' : 8869,
    'sdot' : 8901,
    'lceil' : 8968,
    'rceil' : 8969,
    'lfloor' : 8970,
    'rfloor' : 8971,
    'lang' : 9001,
    'rang' : 9002,
    'loz' : 9674,
    'spades' : 9824,
    'clubs' : 9827,
    'hearts' : 9829,
    'diams' : 9830,
    'quot' : 34,
    'amp' : 38,
    'lt' : 60,
    'gt' : 62,
    'OElig' : 338,
    'oelig' : 339,
    'Scaron' : 352,
    'scaron' : 353,
    'Yuml' : 376,
    'circ' : 710,
    'tilde' : 732,
    'ensp' : 8194,
    'emsp' : 8195,
    'thinsp' : 8201,
    'zwnj' : 8204,
    'zwj' : 8205,
    'lrm' : 8206,
    'rlm' : 8207,
    'ndash' : 8211,
    'mdash' : 8212,
    'lsquo' : 8216,
    'rsquo' : 8217,
    'sbquo' : 8218,
    'ldquo' : 8220,
    'rdquo' : 8221,
    'bdquo' : 8222,
    'dagger' : 8224,
    'Dagger' : 8225,
    'permil' : 8240,
    'lsaquo' : 8249,
    'rsaquo' : 8250,
    'euro' : 8364,

if window?
  window.html4_char = html4_char
else
  exports.module = html4_char


chars_table = require './chars_table' unless chars_table
html4_char = require './html4_char_ents' unless html4_char

# Библиотека полезностей
class EMTLib

  charsTable : chars_table
  html4_char_ents : html4_char
  domain_zones:[
    "r","ру","com","ком","org","орг","уа","ua"
    ]

  # Типы кавычек
  QUOTE_FIRS_OPEN : '«'
  QUOTE_FIRS_CLOSE : '»'
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
      if (layout & @LAYOUT_STYLE)
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

    if (layout & @LAYOUT_CLASS ) and classname
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


if window?
  App.Lib = new EMTLib()

else
  module.exports =
    EMTLib: EMTLib
    emtlib: new EMTLib()

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
    @profiling = new Date().getTime() - start
    @

  # Применение правила для text
  apply:->
    return unless @config.on
    @multiply()

  # Правило замены
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
      "open_quote"
      "close_quote"
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

# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Abbr extends Quote
  description: "Сокращения"
  version:'0.0.0'
  configName:'Abbr'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "nobr_abbreviation",
    "nobr_acronym",
    "nobr_sm_im",
    "nobr_locations",
    "nbsp_before_unit",
    "nbsp_before_weight_unit",
    "nobr_before_unit_volt",
    "ps_pps",
    "nobr_vtch_itd_itp",
    "nbsp_te",
    "nbsp_money_abbr",
    "nbsp_org_abbr",
    "nobr_gost"
    ]

module.exports = Abbr

if typeof window isnt 'undefined'
  App.Rules.Abbr = Abbr

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Акцент'
  version:'0.0.0'
  configName:'acute_accent'

  replace:->
    # Список правил
    rex = [
     /([уеыаоэяиюё])\`([а-яё])/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['acute_accent'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Замена x на символ × в размерных единицах'
  version:'0.0.0'
  configName:'auto_times_x'

  replace:->

    # Список правил
    rex = [
      /(\d+)(x|х)(\d+)(x|х)(\d+)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      str = [ m[1], "&times;", m[3], "&times;", m[5]].join ''

      @text = @text.replace m[0] , str

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['auto_times_x'] = Rule



# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Тире между диапозоном веков'
  version:'0.0.0'
  configName:'century_period'

  replace:->
    # Список правил
    rex = [
      /(\040|\t|\&nbsp\;|^)([XIV]{1,5})(-|\&mdash\;)([XIV]{1,5})(( |\&nbsp\;)?(в\.в\.|вв\.|вв|в\.|в))/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] .$this->tag($m[2]."&mdash;".$m[4]." вв.","span", array("class"=>"nowrap"))'
      @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    !!m

module.exports = Rule
if typeof window isnt 'undefined'
  App.Rules['century_period'] = Rule



# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: "Закрывающая кавычка"
  version:'0.0.0'
  configName:'close_quote'

  apply:->
    # return if @config.on
    self = @

    # Правило
    re = /([a-zа-яё0-9]|\.|\&hellip\;|\!|\?|\>|\)|\:)(\"+)(\.|\&hellip\;|\;|\:|\?|\!|\,|\s|\)|\<\/|$)/i
    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , (str)->
        self.debug str
        self.debug m

        m[1] + self.Lib.QUOTE_FIRS_CLOSE + m[3]

    !!m


module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['close_quote'] = Rule


# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

###
## Правило "Закрывающая кавычка особые случаи"
###
class Rule extends OpenQuote
  description: "Закрывающая кавычка особые случаи"
  version:'0.0.0'
  configName:'close_quote_adv'

  apply:->
    return if @config.on
    self = @
    debug = @config.debug

    # Правилo 1

    re = /([a-zа-яё0-9]|\.|\&hellip\;|\!|\?|\>|\)|\:)((\"|\\\"|\&laquo\;)+)(\<[^\>]+\>)(\.|\&hellip\;|\;|\:|\?|\!|\,|\)|\<\/|$| )/i
    # Замена
    @text = @text.replace re , (str)->
      self.debug str if debug

      m = str.match re
      self.debug m if debug

      cnt =  substr_count m[2], "\""
      cnt +=  substr_count m[2], "&laquo;"

      str_repeat = @Lib.repeat @Lib.QUOTE_FIRS_CLOSE, cnt

      m[1] + str_repeat + m[4]+ m[5]

    # Правилo 2
    re new RegExp [
      '/([a-zа-яё0-9]|\.|\&hellip\;|\!|\?|\>|\)|\:)'
      '(\s+)((\"|\\\")+)(\s+)'
      '(\.|\&hellip\;|\;|\:|\?|\!|\,|\)|\<\/|$| )/'].join ''
      , 'i'

    @text = @text.replace re , (str)->
      self.debug str if debug

      m = str.match re
      self.debug m if debug

      cnt =  substr_count m[3], "\""
      cnt +=  substr_count m[3], "&laquo;"

      str_repeat = @Lib.repeat @Lib.QUOTE_FIRS_CLOSE, cnt

      m[1] + m[2] + str_repeat + m[5]+ m[6]

    # Правилo 3
    re = /\>(\&laquo\;)\.($|\s|\<)/i
    @text = @text.replace re , (str)->
      self.debug str if debug
      m = str.match re
      self.debug m if debug
      '>&raquo;' + m[2]

    # Правилo 4
    re = /\>(\&laquo\;)\.($|\s|\<)/i
    @text = @text.replace re , (str)->
      self.debug str if debug
      m = str.match re
      self.debug m if debug
      '>&raquo;' + m[2]
    @

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['close_quote_adv'] = Rule

# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Dash extends Quote
  description: "Дефисы и тире"
  version:'0.0.0'
  configName:'Dash'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "mdash_symbol_to_html_mdash",
    "mdash",
    "mdash_2",
    "mdash_3",
    "iz_za_pod",
    "to_libo_nibud",
    "koe_kak",
    "ka_de_kas"
    ]

module.exports = Dash
if typeof window isnt 'undefined'
  App.Rules['Dash'] = Dash

# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class EmtDate extends Quote
  description: "Даты и дни"
  version:'0.0.0'
  configName:'EmtDate'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "years",
    "mdash_month_interval",
    "space_posle_goda",
    "nbsp_posle_goda_abbr",
    ]

module.exports = EmtDate
if typeof window isnt 'undefined'
  App.Rules['EmtDate'] = EmtDate

# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Etc extends Quote
  description: "Прочее"
  version:'0.0.0'
  configName:'EmtDate'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "acute_accent"
    ]

module.exports = Etc
if typeof window isnt 'undefined'
  App.Rules['Etc'] = Etc

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Удаление nbsp в nobr/nowrap тэгах'
  version:'0.0.0'
  configName:'expand_no_nbsp_in_nobr'

  replace:->
    # @todo function
    # # Список правил
    # rex = [
    #   /([^\d\>]|^)([\d]{1,2}\:[\d]{2})(-|\&mdash\;|\&minus\;)([\d]{1,2}\:[\d]{2})([^\d\<]|$)/i
    # ]


    # for re, idx in rex
    #   m = @text.match re
    #   break if m

    # if m

    #   @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['expand_no_nbsp_in_nobr'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Обрамление пятисимвольных слов разделенных дефисом в неразрывные блоки'
  version:'0.0.0'
  configName:'hyphen_nowrap'

  replace:->

    # Список правил
    rex = [
      /(\&nbsp\;|\s|\>|^)([a-zа-яё]{1}\-[a-zа-яё]{4}|[a-zа-яё]{2}\-[a-zа-яё]{3}|[a-zа-яё]{3}\-[a-zа-яё]{2}|[a-zа-яё]{4}\-[a-zа-яё]{1}|когда\-то|кое\-как|кой\-кого|вс[её]\-таки|[а-яё]+\-(кась|ка|де))(\s|\.|\,|\!|\?|\&nbsp\;|\&hellip\;|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] . $this->tag($m[2], "span", array("class"=>"nowrap")) . $m[4]'
      @text = @text.replace m[0] , "#{m[1]}#{m[2]}&nbsp;#{m[4]}C#{m[6]}"

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['hyphen_nowrap'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Обрамление пятисимвольных слов разделенных дефисом в неразрывные блоки'
  version:'0.0.0'
  configName:'nbsp_celcius'

  replace:->

    # Список правил
    rex = [
      /(\&nbsp\;|\s|\>|^)([a-zа-яё]{1}\-[a-zа-яё]{4}|[a-zа-яё]{2}\-[a-zа-яё]{3}|[a-zа-яё]{3}\-[a-zа-яё]{2}|[a-zа-яё]{4}\-[a-zа-яё]{1}|когда\-то|кое\-как|кой\-кого|вс[её]\-таки|[а-яё]+\-(кась|ка|де))(\s|\.|\,|\!|\?|\&nbsp\;|\&hellip\;|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] . $this->tag($m[2], "span", array("class"=>"nowrap")) . $m[4]'
      @text = @text.replace m[0] , "#{m[1]}#{m[2]}&nbsp;#{m[4]}C#{m[6]}"

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_celcius'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение IP-адресов'
  version:'0.0.0'
  configName:'ip_address'

  replace:->

    # # Список правил
    # rex = [
    #   /(\s|\&nbsp\;|^)(\d{0,3}\.\d{0,3}\.\d{0,3}\.\d{0,3})/i
    # ]



    # for re, idx in rex
    #   m = @text.match re
    #   break if m

    # if m
    #   # '$m[1]  .
    #   # (
    #   #   ($m[1] == ">" || $m[11] == "<") ? $m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10] :$this->tag($m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10], "span", array("class"=>"nowrap")
    #   #     )
    #   #   ).$m[11]',
    #   # '$m[1]  .(($m[1] == ">" || $m[11] == "<") ? $m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10] :$this->tag($m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10], "span", array("class"=>"nowrap"))  ).$m[11]'
    #   if idx is 0
    #     str = m[1]

    #   @text = @text.replace m[0] , str

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['ip_address'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Расстановка дефисов между из-за, из-под'
  version:'0.0.0'
  configName:'iz_za_pod'

  replace:->
    # return if @config.on
    self = @

    # Правило
    re = /(\s|\&nbsp\;|\>|^)(из)(\040|\t|\&nbsp\;)\-?(за|под)([\.\,\!\?\:\;]|\040|\&nbsp\;)/i

    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , (str)->
        self.debug str

        self.debug m
        reStr = ''
        reStr += m[1] unless m[1] is "&nbsp;"
        reStr += "#{m[2]}-#{m[4]}"
        reStr += m[5] unless m[5] is "&nbsp;"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['iz_za_pod'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Расстановка дефисов с частицами ка, де, кась'
  version:'0.0.0'
  configName:'ka_de_kas'

  replace:->
    # return if @config.on
    self = @
    use = 0

    # Правило
    rex = [
      /(\s|^|\&nbsp\;|\>)([а-яё]+)(\040|\t|\&nbsp\;)(ка)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
      /(\s|^|\&nbsp\;|\>)([а-яё]+)(\040|\t|\&nbsp\;)(де)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
      /(\s|^|\&nbsp\;|\>)([а-яё]+)(\040|\t|\&nbsp\;)(кась)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
    ]

    for re in rex
      m = @text.match re
      break if m

    if m
      reStr = ''
      reStr += m[1] unless m[1] is "&nbsp;"
      reStr += "#{m[2]}-#{m[4]}"
      reStr += m[5] unless m[5] is "&nbsp;"

      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['ka_de_kas'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Кое-как, кой-кого, все-таки'
  version:'0.0.0'
  configName:'koe_kak'

  replace:->
    # return if @config.on
    self = @
    use = 0

    # Правило
    rex = [
      /(\s|^|\&nbsp\;|\>)(кое)\-?(\040|\t|\&nbsp\;)\-?(как)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
      /(\s|^|\&nbsp\;|\>)(кой)\-?(\040|\t|\&nbsp\;)\-?(кого)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
      /(\s|^|\&nbsp\;|\>)(вс[её])\-?(\040|\t|\&nbsp\;)\-?(таки)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i
    ]

    for re in rex
      m = @text.match re
      break if m

    if m
      reStr = ''
      reStr += m[1] unless m[1] is "&nbsp;"
      reStr += "#{m[2]}-#{m[4]}"
      reStr += m[5] unless m[5] is "&nbsp;"

      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['koe_kak'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Математические знаки больше/меньше/плюс минус/неравно'
  version:'0.0.0'
  configName:'math_chars'

  replace:->

    # Список правил
    rex = [
      /!=/
      /\<=/
      /([^=]|^)\>=/
      /~=/
      /\+-/
    ]
    rep = [
      (m)->'&ne;'
      (m)->'&le;'
      (m)->"m[1]&ge;"
      (m)->'&cong;'
      (m)->'&plusmn;'
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , rep[idx] m

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['math_chars'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: "Тире после кавычек, скобочек, пунктуации"
  version:'0.0.0'
  configName:'mdash'

  replace:->
    # return if @config.on
    self = @
    use = true

    # Правило
    re = /([a-zа-яё0-9]+|\,|\:|\)|\&(ra|ld)quo\;|\|\"|\>)(\040|\t)(—|\-|\&mdash\;)(\s|$|\<)/
    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , (str)->
        self.debug str
        self.debug m

        m[1] + '&nbsp;&mdash;' + m[5]
    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['mdash'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Тире после переноса строки'
  version:'0.0.0'
  configName:'mdash2'

  replace:->
    # return if @config.on
    self = @

    # Правило
    re = /(\n|\r|^|\>)(\-|\&mdash\;)(\t|\040)/
    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , (str)->
        self.debug str
        self.debug m

        m[1] + '&nbsp;&mdash;'

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['mdash2'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Тире после знаков восклицания, троеточия и прочее'
  version:'0.0.0'
  configName:'mdash3'

  replace:->
    # return if @config.on
    self = @

    # Правило
    re = /(\.|\!|\?|\&hellip\;)(\040|\t|\&nbsp\;)(\-|\&mdash\;)(\040|\t|\&nbsp\;)/
    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , (str)->
        self.debug str
        self.debug m

        m[1] + '&nbsp;&mdash;'

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['mdash3'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: "Замена символа тире на html конструкцию"
  version:'0.0.0'
  configName:'mdash_2_html'
  config:
    on: true
    log: true
    debug:true

  replace:->
    m = @text.match /-/
    if m
      @text = @text.replace /-/ , ->
        '&mdash;'
    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['mdash_2_html'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка тире и объединение в неразрывные периоды месяцев'
  version:'0.0.0'
  configName:'mdash_month_interval'

  replace:->
    # Список правил
    rex = [
      /((январ|феврал|сентябр|октябр|ноябр|декабр)([ьяюе]|[её]м)|(апрел|июн|июл)([ьяюе]|ем)|(март|август)([ауе]|ом)?|ма[йяюе]|маем)\-((январ|феврал|сентябр|октябр|ноябр|декабр)([ьяюе]|[её]м)|(апрел|июн|июл)([ьяюе]|ем)|(март|август)([ауе]|ом)?|ма[йяюе]|маем)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}&mdash;#{m[8]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['mdash_month_interval'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка знака минус между числами'
  version:'0.0.0'
  configName:'minus_between_nums'

  replace:->

    # Список правил
    rex = [
      /(\d+)\-(\d)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] . $this->tag($m[2].$m[3], "span", array("class"=>"nowrap")) . $m[6]'
      @text = @text.replace m[0] , "#{m[1]}&minus;#{m[2]}"

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['auto_times_x'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка знака минус между диапозоном чисел'
  version:'0.0.0'
  configName:'minus_in_numbers_range'

  replace:->
    # Список правил
    # rex = [
    #   /(^|\s|\&nbsp\;)(\&minus\;|\-)(\d+)(\.\.\.|\&hellip\;)(\s|\&nbsp\;)?(\+|\-|\&minus\;)?(\d+)/i
    # ]

    # for re, idx in rex
    #   m = @text.match re
    #   break if m

    # if m
    #   str = m[1] + "&minus;" + m[3] + m[4] + m[5]

    #   if m[6] is "+"
    #     str += $m[6]
    #   else
    #     str += "&minus;"
    #   str += m[7]

    #   @text = @text.replace m[0] , str

    # false


module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['minus_in_numbers_range'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка тире и объединение в неразрывные периоды дней'
  version:'0.0.0'
  configName:'nbsp_and_dash_month_interval'

  replace:->
    # Список правил
    rex = [
      /([^\>]|^)(\d+)(\-|\&minus\;|\&mdash\;)(\d+)( |\&nbsp\;)(января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря)([^\<]|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m

      # 'm[1].$this->tag($m[2]."&mdash;".$m[4]." ".$m[6],"span", array("class"=>"nowrap")).$m[7]'

      @text = @text.replace m[0] , "#{m[1]}&mdash;#{m[8]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_and_dash_month_interval'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Неразрывный пробел перед частицей'
  version:'0.0.0'
  configName:'nbsp_before_particle'

  replace:->

    # Список правил
    rex = [
      /(\040|\t)+(ли|бы|б|же|ж)(\&nbsp\;|\.|\,|\:|\;|\&hellip\;|\?|\s)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      str = "&nbsp;#{m[2]}"
      str += m[3] unless m[3] == "&nbsp;"

      @text = @text.replace m[0] , str

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_before_particle'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Замена символов и привязка сокращений в весовых величинах: г, кг, мг…'
  version:'0.0.0'
  configName:'nbsp_before_unit'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>|\&nbsp\;|\,)(\d+)(\s)?(м|мм|см|дм|км|гм|km|dm|cm|mm)(\s|\.|\!|\?|\,|$|\&plusmn\;|\;)/i
      /(\s|^|\>|\&nbsp\;|\,)(\d+)(\s)?(м|мм|см|дм|км|гм|km|dm|cm|mm)([32]|&sup3;|&sup2;)(\s|\.|\!|\?|\,|$|\&plusmn\;|\;)/i
    ]

    strs = [
      (m)->
        m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      (m)->
        str = m[1] + m[2] + "&nbsp;" + m[4]
        if m[5] in ["3", "2"]
          str += "&sup" + m[5] + ";"
        else
           str += m[5]
        str + m[6]

      ]


    for re, idx in rex
      m = @text.match re
      break if m
    if m
      @text = @text.replace m[0] , strs[idx](m)

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_before_unit'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Замена символов и привязка сокращений в весовых величинах: г, кг, мг…'
  version:'0.0.0'
  configName:'nbsp_before_weight_unit'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>|\&nbsp\;|\,)(\d+)(\s)?(г|кг|мг|т)(\s|\.|\!|\?|\,|$|\&nbsp\;|\;)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}#{m[2]}&nbsp;#{m[4]}#{m[5]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_before_weight_unit'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка градусов к числу'
  version:'0.0.0'
  configName:'nbsp_celcius'

  replace:->

    # Список правил
    rex = [
      /(\s|^|\>|\&nbsp\;)(\d+)(\s)?(°|\&deg\;)(C|С)(\s|\.|\!|\?|\,|$|\&nbsp\;|\;)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}#{m[2]}&nbsp;#{m[4]}C#{m[6]}"

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_celcius'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка союзов и предлогов к предыдущим словам в случае конца предложения'
  version:'0.0.0'
  configName:'nbsp_in_the_end'

  replace:->

    # Список правил
    rex = [
      /([a-zа-яё0-9\-]{3,}) ([a-zа-яё]{1,2})\.( [A-ZА-ЯЁ]|$)/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      @text = @text.replace m[0] , "#{m[1]}&nbsp;#{m[2]}#{m[3]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_in_the_end'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка сокращений форм собственности к названиям организаций'
  version:'0.0.0'
  configName:'nbsp_org_abbr'

  replace:->
    # Список правил
    rex = [
      /([^a-zA-Zа-яёА-ЯЁ]|^)(ООО|ЗАО|ОАО|НИИ|ПБОЮЛ)\s([a-zA-Zа-яёА-ЯЁ]|\"|\&laquo\;|\&bdquo\;|<)/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2] + '&nbsp;' + m[3]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_org_abbr'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Пробел после года'
  version:'0.0.0'
  configName:'nbsp_posle_goda_abbr'

  replace:->
    # Список правил
    rex = [
     /(^|\040|\&nbsp\;|\"|\&laquo\;)([0-9]{3,4})[ ]?(г\.)([^a-zа-яё]|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}#{m[2]}&nbsp;#{m[3]}#{m[4]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_posle_goda_abbr'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Неразрывный пробел в как то'
  version:'0.0.0'
  configName:'nbsp_v_kak_to'

  replace:->

    # Список правил
    rex = [
      /как то/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "как&nbsp;то"

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nbsp_v_kak_to'] = Rule

# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class NoBr extends Quote
  description: "Неразрывные конструкции"
  version:'0.0.0'
  configName:'NoBr'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "super_nbsp"
    "nbsp_v_kak_to"
    "nbsp_before_particle"
    "nbsp_celcius"
    ]

module.exports = NoBr
if typeof window isnt 'undefined'
  App.Rules['NoBr'] = NoBr

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote
##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Расстановка пробелов перед сокращениями dpi, lpi'
  version:'0.0.0'
  configName:'nobr_abbreviation'

  replace:->
    # return if @config.on
    self = @
    use = 0

    # Правило
    rex = [
      /(\s+|^|\>)(\d+)(\040|\t)*(dpi|lpi)([\s\;\.\?\!\:\(]|$)/i
    ]

    for re in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nobr_abbreviation'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка пробелов перед сокращениями гл., стр., рис., илл., ст., п.'
  version:'0.0.0'
  configName:'nobr_acronym'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>|\()(гл|стр|рис|илл?|ст|п|с)\.(\040|\t)*(\d+)(\&nbsp\;|\s|\.|\,|\?|\!|$)/i
    ]

    for re in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule
if typeof window isnt 'undefined'
  App.Rules['nobr_acronym'] = Rule



# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Установка пробельных символов в сокращении вольт'
  version:'0.0.0'
  configName:'nobr_before_unit_volt'

  replace:->
    # Список правил
    rex = [
      /(\d+)([вВ]|\s[вВ])(\s|\.|\!|\?|\,|$)/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '\1&nbsp;В\3'
      reStr = m[1] + '&nbsp;В.'
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nobr_before_unit_volt'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка пробелов в сокращениях г., ул., пер., д.'
  version:'0.0.0'
  configName:'nobr_locations'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>)(г|ул|пер|просп|пл|бул|наб|пр|ш|туп)\.(\040|\t)*([а-яё0-9a-z]+)(\s|\.|\,|\?|\!|$)/i
      /(\s|^|\>)(б\-р|пр\-кт)(\040|\t)*([а-яё0-9a-z]+)(\s|\.|\,|\?|\!|$)/i
      /(\s|^|\>)(д|кв|эт)\.(\040|\t)*(\d+)(\s|\.|\,|\?|\!|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      if idx is 1
        reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      else
        reStr = m[1] + m[2] + '.&nbsp;' + m[4] + m[5]

      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nobr_locations'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Расстановка пробелов перед сокращениями см., им.'
  version:'0.0.0'
  configName:'nobr_sm_im'

  replace:->
    # Список правил
    rex = [
      /(\s|^|\>|\()(см|им)\.(\040|\t)*([а-яё0-9a-z]+)(\s|\.|\,|\?|\!|$)/i
    ]

    for re in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule
if typeof window isnt 'undefined'
  App.Rules['nobr_sm_im'] = Rule


# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение сокращений и т.д., и т.п., в т.ч.'
  version:'0.0.0'
  configName:'nobr_vtch_itd_itp'

  replace:->
    # Список правил
    rex = [
      /(^|\s|\&nbsp\;)и( |\&nbsp\;)т\.?[ ]?д(\.|$|\s|\&nbsp\;)/
      /(^|\s|\&nbsp\;)и( |\&nbsp\;)т\.?[ ]?п(\.|$|\s|\&nbsp\;)/
      /(^|\s|\&nbsp\;)в( |\&nbsp\;)т\.?[ ]?ч(\.|$|\s|\&nbsp\;)/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
        # '$m[1].$this->tag("и т. д.", "span",  array("class" => "nowrap")).($m[3]!="."? $m[3] : "" )',
        # '$m[1].$this->tag("и т. п.", "span",  array("class" => "nowrap")).($m[3]!="."? $m[3] : "" )',
        # '$m[1].$this->tag("в т. ч.", "span",  array("class" => "nowrap")).($m[3]!="."? $m[3] : "" )','
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nobr_vtch_itd_itp'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка года к дате'
  version:'0.0.0'
  configName:'nobr_year_in_date'

  replace:->
    # Список правил
    rex = [
      /(\s|\&nbsp\;)([0-9]{2}\.[0-9]{2}\.([0-9]{2})?[0-9]{2})(\s|\&nbsp\;)?г(\.|\s|\&nbsp\;)/i,
      /(\s|\&nbsp\;)([0-9]{2}\.[0-9]{2}\.([0-9]{2})?[0-9]{2})(\s|\&nbsp\;|\.(\s|\&nbsp\;|$)|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # if idx is 0
      #   str = m[1].$this->tag($m[2]." г.","span", array("class"=>"nowrap")).($m[5]==="."?"":" ")'
      # else
      #     '$m[1].$this->tag($m[2],"span", array("class"=>"nowrap")).$m[4]'
      # # 'm[1].$this->tag($m[2]."&mdash;".$m[4]." ".$m[6],"span", array("class"=>"nowrap")).$m[7]'

      @text = @text.replace m[0] , "#{m[1]}&mdash;#{m[8]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['nobr_year_in_date'] = Rule

# Зависимости
Quote = require( './quote') unless Quote

###
## Групповой Объект правил "Сокращения"
###
class Numbers extends Quote
  description: "Сокращения"
  version:'0.0.0'
  configName:'Numbers'


  config:
    on: true
    log: true
    debug:true

  # Очередь правил
  rules:[]

  # Порядок выполнения
  order:[
    "minus_between_nums",
    "minus_in_numbers_range",
    "auto_times_x",
    "numeric_sub",
    "numeric_sup",
    "simple_fraction",
    "math_chars",
    "thinsp_between_number_triads",
    "thinsp_between_no_and_number",
    "thinsp_between_sect_and_number",
    ]

module.exports = Numbers

if typeof window isnt 'undefined'
  App.Rules.Numbers = Numbers

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Нижний индекс'
  version:'0.0.0'
  configName:'numeric_sub'

  replace:->

    # # Список правил
    rex = [
      /([a-zа-яё0-9])\_([\d]{1,3})([^а-яёa-z0-9]|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = m[1] + @ntag( @ntag( m[2], "small"), "sub") + m[3]
      @text = @text.replace m[0] , str


    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['numeric_sub'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Верхний индекс'
  version:'0.0.0'
  configName:'numeric_sup'

  replace:->

    # Список правил
    rex = [
      /([a-zа-яё0-9])\^([\d]{1,3})([^а-яёa-z0-9]|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = m[1] + @ntag( @ntag( m[2], "small"), "sup") + m[3]

      @text = @text.replace m[0] , str


    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['numeric_sup'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

###
## Открывающая кавычка особые случаи
###
class OpenQuoteAdv extends OpenQuote
  description: "Открывающая кавычка особые случаи"
  version:'0.0.0'
  configName:'open_quote_adv'

  apply:->
    return if @config.on
    self = @
    debug = @config.debug

    # Правилo 1

    re = /(^|\(|\s|\>)(\"|\\\")(\s)(\S+)/i
    # Замена
    @text = @text.replace re , (str)->
      self.debug str if debug

      m = str.match re
      self.debug m if debug

      m[1] + self.Lib.QUOTE_FIRS_OPEN + m[4]

    @

module.exports = OpenQuoteAdv

if typeof window isnt 'undefined'
  App.Rules['open_quote_adv'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение в неразрывные конструкции номеров телефонов'
  version:'0.0.0'
  configName:'phone_builder'

  replace:->

    # Список правил
    rex = [
      /([^\d\+]|^)([\+]?[0-9]{1,3})( |\&nbsp\;|\&thinsp\;)([0-9]{3,4}|\([0-9]{3,4}\))( |\&nbsp\;|\&thinsp\;)([0-9]{2,3})(-|\&minus\;)([0-9]{2})(-|\&minus\;)([0-9]{2})([^\d]|$)/
      /([^\d\+]|^)([\+]?[0-9]{1,3})( |\&nbsp\;|\&thinsp\;)([0-9]{3,4}|[0-9]{3,4})( |\&nbsp\;|\&thinsp\;)([0-9]{2,3})(-|\&minus\;)([0-9]{2})(-|\&minus\;)([0-9]{2})([^\d]|$)/
    ]



    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1]  .
      # (
      #   ($m[1] == ">" || $m[11] == "<") ? $m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10] :$this->tag($m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10], "span", array("class"=>"nowrap")
      #     )
      #   ).$m[11]',
      # '$m[1]  .(($m[1] == ">" || $m[11] == "<") ? $m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10] :$this->tag($m[2]." ".$m[4]." ".$m[6]."-".$m[8]."-".$m[10], "span", array("class"=>"nowrap"))  ).$m[11]'
      if idx is 0
        str = m[1]

      @text = @text.replace m[0] , str

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['phone_builder'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение сокращений P.S., P.P.S.'
  version:'0.0.0'
  configName:'ps_pps'

  replace:->
    # Список правил
    rex = [
      /(^|\040|\t|\>|\r|\n)(p\.\040?)(p\.\040?)?(s\.)([^\<])/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] . $this->tag(trim($m[2]) . " " . ($m[3] ? trim($m[3]) . " " : ""). $m[4], "span",  array("class" => "nowrap") ).$m[5] '
      reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5]
      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['ps_pps'] = Rule

###
Индекс правил
###
# module.exports = {
#   open_quote : require('./open_quote')
#   close_quote: require './close_quote'
#   mdush2html: require './mdash_2_html'
# }


# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Замена дробей 1/2, 1/4, 3/4 на соответствующие символы'
  version:'0.0.0'
  configName:'simple_fraction'

  replace:->

    # Список правил
    rex = [
      /1\/(2|4)/
      /3\/4/
    ]
    rep = [
      (m)->
        "&frac1#{m[1]};"
      (m)->
        "&frac34;"
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , rep[idx] m

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['simple_fraction'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Пробел после года'
  version:'0.0.0'
  configName:'simple_fraction'

  replace:->
    # Список правил
    rex = [
     /(^|\040|\&nbsp\;)([0-9]{3,4})(год([ауе]|ом)?)([^a-zа-яё]|$)/i
    ]

    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "#{m[1]}#{m[2]} #{m[3]}#{m[5]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['simple_fraction'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение IP-адресов'
  version:'0.0.0'
  configName:'spaces_nobr_in_surname_abbr'

  replace:->

    # Список правил
    rex = [
      /(\s|^|\.|\,|\;|\:|\?|\!|\&nbsp\;)([A-ZА-ЯЁ])\.?(\s|\&nbsp\;)?([A-ZА-ЯЁ])(\.(\s|\&nbsp\;)?|(\s|\&nbsp\;))([A-ZА-ЯЁ][a-zа-яё]+)(\s|$|\.|\,|\;|\:|\?|\!|\&nbsp\;)/
      /(\s|^|\.|\,|\;|\:|\?|\!|\&nbsp\;)([A-ZА-ЯЁ][a-zа-яё]+)(\s|\&nbsp\;)([A-ZА-ЯЁ])\.?(\s|\&nbsp\;)?([A-ZА-ЯЁ])\.?(\s|$|\.|\,|\;|\:|\?|\!|\&nbsp\;)/
    ]



    # for re, idx in rex
    #   m = @text.match re
    #   break if m

    # if m
    #   # '$m[1].$this->tag($m[2].". ".$m[4].". ".$m[8], "span",  array("class" => "nowrap")).$m[9]',
    #   # '$m[1].$this->tag($m[2]." ".$m[4].". ".$m[6].".", "span",  array("class" => "nowrap")).$m[7]'
    #   if idx is 0
    #     str = m[1]

    #   @text = @text.replace m[0] , str

    # !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['spaces_nobr_in_surname_abbr'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Привязка союзов и предлогов к написанным после словам'
  version:'0.0.0'
  configName:'super_nbsp'

  replace:->

    # Список правил
    rex = [
      /(\s|^|\&(la|bd)quo\;|\>|\(|\&mdash\;\&nbsp\;)([a-zа-яё]{1,2}\s+)([a-zа-яё]{1,2}\s+)?([a-zа-яё0-9\-]{2,}|[0-9])/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      str = m[1] + @Lib.trim(m[3]) + "&nbsp;"
      str += @Lib.trim(m[4]) + "&nbsp;" if m[4]
      str += m[5]

      @text = @text.replace m[0] , str

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['super_nbsp'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Пробел между символом номера и числом'
  version:'0.0.0'
  configName:'thinsp_between_no_and_number'

  replace:->

    # Список правил
    rex = [
      /(№|\&#8470\;)(\s|&nbsp;)*(\d)/i
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "&#8470;&thinsp;#{m[3]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['thinsp_between_no_and_number'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Объединение триад чисел полупробелом'
  version:'0.0.0'
  configName:'thinsp_between_number_triads'

  replace:->

    # Список правил
    rex = [
      /([0-9]{1,3}( [0-9]{3}){1,})(.|$)/
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m
      if m[3] is '-'
        str = m[0]
      else
        str = m[1].replace " ", "&thinsp;"
      str += m[3]

      @text = @text.replace m[0] , str

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['thinsp_between_number_triads'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Пробел между параграфом и числом'
  version:'0.0.0'
  configName:'thinsp_between_sect_and_number'

  replace:->

    # Список правил
    rex = [
      /(§|\&sect\;)(\s|&nbsp;)*(\d+|[IVX]+|[a-zа-яё]+)/i
    ]
    for re, idx in rex
      m = @text.match re
      break if m

    if m

      @text = @text.replace m[0] , "&sect;&thinsp;#{m[3]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['thinsp_between_sect_and_number'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Тире между диапозоном веков'
  version:'0.0.0'
  configName:'time_interval'

  replace:->
    # Список правил
    rex = [
      /([^\d\>]|^)([\d]{1,2}\:[\d]{2})(-|\&mdash\;|\&minus\;)([\d]{1,2}\:[\d]{2})([^\d\<]|$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '$m[1] . $this->tag($m[2]."&mdash;".$m[4],"span", array("class"=>"nowrap")).$m[5]'
      @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['time_interval'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class Rule extends OpenQuote
  description: 'Автоматическая простановка дефисов в обезличенных местоимениях и междометиях'
  version:'0.0.0'
  configName:'to_libo_nibud'

  replace:->
    # return if @config.on
    self = @

    # Правило
    re = /(\s|^|\&nbsp\;|\>)(кто|кем|когда|зачем|почему|как|что|чем|где|чего|кого)\-?(\040|\t|\&nbsp\;)\-?(то|либо|нибудь)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i

    m = @text.match re
    if m
      # Замена
      @text = @text.replace re , (str)->
        self.debug str

        self.debug m
        reStr = ''
        reStr += m[1] unless m[1] is "&nbsp;"
        reStr += "#{m[2]}-#{m[4]}"
        reStr += m[5] unless m[5] is "&nbsp;"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['to_libo_nibud'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Надстрочный текст после символа ^'
  version:'0.0.0'
  configName:'word_sup'

  replace:->
    # Список правил
    rex = [
      /((\s|\&nbsp\;|^)+)\^([a-zа-яё0-9\.\:\,\-]+)(\s|\&nbsp\;|$|\.$)/i
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      # '"" . $this->tag($this->tag($m[3],"small"),"sup") . $m[4]'
      @text = @text.replace m[0] , "#{m[1]}&#769;#{m[2]}"

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['word_sup'] = Rule

# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило
##
class Rule extends OpenQuote
  description: 'Установка тире и пробельных символов в периодах дат'
  version:'0.0.0'
  configName:'years'

  replace:->
    # Список правил
    rex = [
      /(с|по|период|середины|начала|начало|конца|конец|половины|в|между|\([cс]\)|\&copy\;)(\s+|\&nbsp\;)([\d]{4})(-|\&minus\;)([\d]{4})(( |\&nbsp\;)?(г\.г\.|гг\.|гг|г\.|г)([^а-яёa-z]))?/
    ]


    for re, idx in rex
      m = @text.match re
      break if m

    if m
      reStr = m[1] + m[2]
      if parseInt [3] >=  parseInt m[5]
        reStr += m[3] + m[4] + m[5]
      else
        reStr += m[3] + "&mdash;" + m[5]

      reStr += "&nbsp;гг." if m[6]
      reStr += m[9] if m[9]

      @text = @text.replace m[0] , reStr

    !!m

module.exports = Rule

if typeof window isnt 'undefined'
  App.Rules['years'] = Rule
