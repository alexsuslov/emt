# Зависимости
Rules = require( './rules')

###
## Правило "Закрывающая кавычка особые случаи"
###
class CloseQuoteAdv extends Rules.open_quote
  description: "Закрывающая кавычка особые случаи"
  version:'0.0.0'
  configName:'CloseQuoteAdv'

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

module.exports = CloseQuoteAdv

