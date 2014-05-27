isClient = !(typeof window is 'undefined')

if isClient
  module = {}
  App =
    text:''
    Lib:{}
    Rules:{}


    apply:->

      @Rules.openQuote.apply()
      @text = @Rules.openQuote.text

      @Rules.closeQuote.text = @text
      @Rules.closeQuote.apply()
      @text = @Rules.closeQuote.text

      @el.text @text


    init: (@opt, @el)->
      @text = el.text()

      # Quote
      @Rules.openQuote = new OpenQuote
        Lib: @Lib
        text: @text

      @Rules.closeQuote = new CloseQuote
        Lib: @Lib
        text: @text

      @apply()

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

module.exports = OpenQuote


# Зависимости
OpenQuote = require( './open_quote') unless OpenQuote

##
# Правило "Закрывающая кавычка"
##
class CloseQuote extends OpenQuote
  description: "Закрывающая кавычка"
  version:'0.0.0'
  configName:'CloseQuote'

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

# module.exports = CloseQuote

module.exports = CloseQuote
