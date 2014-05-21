EMTret = require( './emt_base').EMTret
###
EMT_Tret_Space
###
class EMTretSpace extends EMTret
  title: "Расстановка и удаление пробелов"
  rules:
    nobr_twosym_abbr:
      description: "Неразрывный перед 2х символьной аббревиатурой",
      pattern: [
        "/([a-zA-Zа-яёА-ЯЁ])(\\040|\\t)+([A-ZА-ЯЁ]2})"
        "([\\s\\;\\.\\?\\!\\:\\(\\\"]|\\&(ra|ld)quo\\;|$)/"].join ''
      replacement: "\\1&nbsp;\\3\\4"
    remove_space_before_punctuationmarks:
      description: "Удаление пробела перед точкой, запятой, \
      двоеточием, точкой с запятой",
      pattern: "/((\\040|\\t|\\&nbsp\\;)+)([\\,\\:\\.\\;\\?])(\\s+|$)/",
      replacement: "\\3\\4"
    autospace_after_comma:
      description: "Пробел после запятой",
      pattern: [
          "/(\\040|\\t|\\&nbsp\\;)\\,([а-яёa-z0-9])/i",
          "/([^0-9])\\,([а-яёa-z0-9])/i"
      ],
      replacement: [
          ", \\2",
          "\\1, \\2"
      ]
    autospace_after_pmarks:
      description: "Пробел после знаков пунктуации, кроме точки",
      pattern: [
        "/(\\040|\\t|\\&nbsp\\;|^|\\n)([a-zа-яё0-9]+)(\\040|\\t|\\&nbsp\\;)"
        "?(\\:|\\)|\\,|\\&hellip\\;|(?:\\!|\\?)+)([а-яёa-z])/i"].join ''
      replacement: "\\1\\2\\4 \\5"
    "autospace_after_dot":
      description: "Пробел после точки",
      pattern: [
        [
          "/(\\040|\\t|\\&nbsp\\;|^)([a-zа-яё0-9]+)(\\040|\\t|\\&nbsp\\;)"
          "?\\.([а-яёa-z]4,})/i"].join ''
        "/(\\040|\\t|\\&nbsp\\;|^)([a-zа-яё0-9]+)\\.([а-яёa-z]1,3})/iue"
      ],
      replacement: [
        "\\1\\2. \\4",
        [
          "m.group(1)+m.group(2)+u\".\" +(( u\"\" "
          "if this.Lib.strtolower(m.group(3)) in ( self.domain_zones) "
          "else u\" \"))+ m.group(3)"
        ].join ''
      ]
    "autospace_after_hellips":
      description: "Пробел после знаков троеточий с вопросительным \
      или восклицательными знаками",
      pattern: "/([\\?\\!]\\.\\.)([а-яёa-z])/i",
      replacement: "\\1 \\2"
    "many_spaces_to_one":
      description: "Удаление лишних пробельных символов и табуляций",
      pattern: "/(\\040|\\t)+/",
      replacement: " "
    "clear_percent":
      description: "Удаление пробела перед символом процента",
      pattern: "/(\\d+)([\\t\\040]+)\\%/",
      replacement: "\\1%"
    "nbsp_before_open_quote":
      description: "Неразрывный пробел перед открывающей скобкой",
      pattern: "/(^|\\040|\\t|>)([a-zа-яё]1,2})\\040(\\&laquo\\;|\\&bdquo\\;)/",
      replacement: "\\1\\2&nbsp;\\3"
    "nbsp_before_month":
      description: "Неразрывный пробел в датах перед числом и месяцем",
      pattern: [
        "/(\\d)(\\s)+"
        "(января|февраля|марта|апреля|мая|июня|июля|августа|сентября|"
          "
          октября|ноября|декабря)([^\\<]|$)/i"].join ''
      replacement: "\\1&nbsp;\\3\\4"
    "spaces_on_end":
      description: "Удаление пробелов в конце текста",
      pattern: "/ +$/",
      replacement: ""
    no_space_posle_hellip:
      description: "Отсутстввие пробела после троеточия после \
      открывающей кавычки",
      pattern: [
        "/(\\&laquo\\;|\\&bdquo\\;)( |\\&nbsp\\;)?\\&hellip\\;"
        "( |\\&nbsp\\;)?([a-zа-яё])/ui"].join ''
      replacement: "\\1&hellip;\\4"
    "space_posle_goda":
      description: "Пробел после года",
      pattern: [
        "/(^|\\040|\\&nbsp\\;)([0-9]3,4})(год([ауе]|ом)?)([^a-zа-яё]|$)/ui",
        ].join ''
      replacement: "\\1\\2 \\3\\5"

  rule_order = [
    "nobr_twosym_abbr",
    "remove_space_before_punctuationmarks",
    "autospace_after_comma",
    "autospace_after_pmarks",
    "autospace_after_dot",
    "autospace_after_hellips",
    "many_spaces_to_one",
    "clear_percent",
    "nbsp_before_open_quote",
    "nbsp_before_month",
    "spaces_on_end",
    "no_space_posle_hellip",
    "space_posle_goda"
    ]
  domain_zones = [
    "r",
    "ру",
    "com",
    "ком",
    "org",
    "орг",
    "уа",
    "ua"
    ]
  classes =
    nowrap: "word-spacing:nowrap;"
