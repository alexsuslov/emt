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
