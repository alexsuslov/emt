EMTret = require( './emt_tret').EMTret

class EMTretQuote extends EMTret
  title: "Кавычки"
  rules:
    quotes_outside_a:
      description: "Кавычки вне тэга <a>"
      pattern: [
        "/(\\<%%\\_\\_[^\\>]+\\>)"
        "\\\"(.+?)\\\""
        "(\\<\\/%%\\_\\_[^\\>]+\\>)/s"].join ''
      replacement: "\"\\1\\2\\3\""
    open_quote:
      description: "Открывающая кавычка",
      pattern: "/(^|\\(|\\s|\\>|-)(\\\"|\\\\\")(\\S+)/iue",
      replacement: "m[1] + QUOTE_FIRS_OPEN + m[3]"
    close_quote:
      description: "Закрывающая кавычка",
      pattern: [
        "/([a-zа-яё0-9]|\\.|\\&hellip\\;|\\!|\\?|\\>|\\)"
        "|\\:)((\\\"|\\\\\")+)(\\.|\\&hellip\\;|\\;|\\:|\\?|\\!|\\,|\\s|\\)"
        "|\\<\\/|$)/uie"].join ''
      replacement: "m[1] + QUOTE_FIRS_CLOSE * ( m[2].count(u\"\\\"\") ) + m[4]"
    close_quote_adv:
      description: "Закрывающая кавычка особые случаи",
      pattern: [
        [ "/([a-zа-яё0-9]|\\.|\\&hellip\\;|\\!|\\?|\\>|\\)"
          "|\\:)((\\\"|\\\\\"|\\&laquo\\;)+)(\\<[^\\>]+\\>)"
          "(\\.|\\&hellip\\;|\\;|\\:|\\?|\\!|\\,|\\)|\\<\\/|$| )/uie" ].join ''
        [
          "/([a-zа-яё0-9]|\\.|\\&hellip\\;|\\!|\\?|\\>|\\)"
          "|\\:)(\\s+)((\\\"|\\\\\")+)(\\s+)"
          "(\\.|\\&hellip\\;|\\;|\\:|\\?|\\!|\\,|\\)|\\<\\/|$| )/uie"].join ''
        "/\\>(\\&laquo\\;)\\.($|\\s|\\<)/ui",
        "/\\>(\\&laquo\\;),($|\\s|\\<|\\S)/ui"
        ]
      replacement: [
        [
          "m[1] + QUOTE_FIRS_CLOSE * ( m[2].count(u\"\\\"\")"
          "+m[2].count(u\"&laquo;\") ) + m[4]+ m[5]"].join ''
        [
          "m[1] +m[2]+ QUOTE_FIRS_CLOSE * ( m[3].count(u\"\\\"\")"
          "+m[3].count(u\"&laquo;\") ) + m[5]+ m[6]"].join ''
        ">&raquo;.\\2"
        ">&raquo;,\\2"
        ]
    open_quote_adv:
      description: "Открывающая кавычка особые случаи",
      pattern: "/(^|\\(|\\s|\\>)(\\\"|\\\\\")(\\s)(\\S+)/iue",
      replacement: "m.group(1) + QUOTE_FIRS_OPEN +m.group(4)"

    quotation:
      description: "Внутренние кавычки-лапки и дюймы"
      function: "build_sub_quotations"

  rule_order:[
    "quotes_outside_a",
    "open_quote",
    "close_quote",
    "close_quote_adv",
    "open_quote_adv",
    "quotation"
  ]

  inject_in:( pos, text)->
    if pos > 0
      @_text = @_text.substring(0, pos) +
        text +
        @_text.substring( pos + text.length)
    else
      for char, i in text
        @_text[i - 1] = char unless i is 0

  build_sub_quotations:->
    # global __ax,__ay
    okposstack = [0]
    okpos = 0
    level = 0
    Off = 0
    while true
      p = @Lib.strpos_ex @_text, ["&laquo;", "&raquo;"], Off
      break if typeof p is 'boolean' and p is false

      if p.str in ["&laquo;"]
        if level > 0 and !@is_on 'no_bdquotes'
          #@TODO::: WTF self::QUOTE_CRAWSE_OPEN ???
          @inject_in p.pos, QUOTE_CRAWSE_OPEN
          level += 1

      if p.str is "&raquo;"
        level -= 1
        if level > 0 and !@is_on 'no_bdquotes'
          #@TODO::: WTF self::QUOTE_CRAWSE_CLOSE ???
          @inject_in p.pos, QUOTE_CRAWSE_CLOSE
          level += 1

      Off = p.pos + p.str.length

      if level is 0
        okpos = Off
        okposstack.push okpos
      else if level < 0
        unless @is_on 'no_inches'
          while True
            # @todo
            # lokpos = okposstack.pop(len(okposstack)-1)
            k = @Lib.substr @_text,  lokpos, Off - lokpos
            k = @Lib.str_replace QUOTE_CRAWSE_OPEN, QUOTE_FIRS_OPEN, k
            k = @Lib.str_replace QUOTE_CRAWSE_CLOSE, QUOTE_FIRS_CLOSE, k

            amount = 0
            # @todo
            m = re.findall("(^|[^0-9])([0-9]+)\&raquo\;", k, re.I | re.U)
            @__ax = m.length
            @__ay = 0
            ###
            @todo подарок
            ###
            # if @__ax

exports.EMTretQuote = EMTretQuote





