EMTret = require( './emt_tret').EMTret
###
EMT_Tret_Symbol
###
class EMTretSymbol extends EMTret
  title: "Специальные символы"
  rules:
    tm_replace:
      description: "Замена (tm) на символ торговой марки",
      pattern: "/([\\040\\t])?\\(tm\\)/i",
      replacement: "&trade;"

    r_sign_replace:
      description: "Замена (R) на символ зарегистрированной торговой марки",
      pattern: [
          "/(.|^)\\(r\\)(.|$)/ie"
      ],
      replacement: [
          "m.group(1)+u\"&reg;\"+m.group(2)"
      ]
    copy_replace:
      description: "Замена (c) на символ копирайт",
      pattern: [
          "/\\((c|с)\\)\\s+/i",
          "/\\((c|с)\\)($|\\.|,|!|\\?)/i"
      ],
      replacement: [
          "&copy;&nbsp;",
          "&copy;\\2"
      ]
    apostrophe:
      description: "Расстановка правильного апострофа в текстах",
      pattern: "/(\\s|^|\\>|\\&rsquo\\;)([a-zа-яё]{1,})\'([a-zа-яё]+)/ui",
      replacement: "\\1\\2&rsquo;\\3",
      cycled: true

    degree_f:
      description: "Градусы по Фаренгейту",
      pattern: "/([0-9]+)F($|\\s|\\.|\\,|\\;|\\:|\\&nbsp\\;|\\?|\\!)/e",
      replacement: [
        "u\"\"+self.tag(m.group(1)+u\" &deg;F\",u\"span\", "
        "{u\"class\":u\"nowrap\"}) +m.group(2)"
        ].join ''

    euro_symbol:
      description: "Символ евро",
      simple_replace: true,
      pattern: "€",
      replacement: "&euro;"

    arrows_symbols:
      description: "Замена стрелок вправо-влево на html коды",
      pattern: [
          "/(\\s|\\>|\\&nbsp\\;|^)\\-\\>($|\\s|\\&nbsp\\;|\\<)/",
          "/(\\s|\\>|\\&nbsp\\;|^|;)\\<\\-(\\s|\\&nbsp\\;|$)/",
          "/→/",
          "/←/"
        ]
      replacement: [
          "\\1&rarr;\\2",
          "\\1&larr;\\2",
          "&rarr;",
          "&larr;"
        ]

  rule_order:[
    "tm_replace",
    "r_sign_replace",
    "copy_replace",
    "apostrophe",
    "degree_f",
    "euro_symbol",
    "arrows_symbols"
    ]
  classes:
    nowrap: "word-spacing:nowrap;"

module.exports =
  EMTretSymbol: EMTretSymbol


