EMTret = require( './emt_base').EMTret
###
EMT_Tret_Abbr
###
class EMTretAbbr extends EMTret
  title: "Сокращения"
  rules:
    "nobr_abbreviation":
      description: "Расстановка пробелов перед сокращениями dpi, lpi",
      pattern:
        "/(\\s+|^|\\>)(\\d+)(\\040|\\t)*(dpi|lpi)([\\s\\;\\.\\?\\!\\:\\(]|$)/i"
      replacement: "\\1\\2&nbsp;\\4\\5"

    "nobr_acronym":
      description: "Расстановка пробелов перед сокращениями гл., \
      стр., рис., илл., ст., п.",
      pattern:
        [
          "/(\\s|^|\\>|\\()(гл|стр|рис|илл?|ст|п|с)\\."
          "(\\040|\\t)*(\\d+)(\\&nbsp\\;|\\s|\\.|\\,|\\?|\\!|$)/i"].join ''
      replacement: "\\1\\2.&nbsp;\\4\\5"

    "nobr_sm_im":
      description: "Расстановка пробелов перед сокращениями см., им.",
      pattern: [
        "/(\\s|^|\\>|\\()(см|им)\\.(\\040|\\t)*([а-яё0-9a-z]+)"
        "(\\s|\\.|\\,|\\?|\\!|$)/i"].join ''
      replacement: "\\1\\2.&nbsp;\\4\\5"

    "nobr_locations":
      description: "Расстановка пробелов в сокращениях г., ул., пер., д.",
      pattern: [
        [
          "/(\\s|^|\\>)(г|ул|пер|просп|пл|бул|наб|пр|ш|туп)\\."
          "(\\040|\\t)*([а-яё0-9a-z]+)(\\s|\\.|\\,|\\?|\\!|$)/i"
          ].join ''
        [
          "/(\\s|^|\\>)(б\\-р|пр\\-кт)(\\040|\\t)*([а-яё0-9a-z]+)"
          "(\\s|\\.|\\,|\\?|\\!|$)/i"].join ''
        "/(\\s|^|\\>)(д|кв|эт)\\.(\\040|\\t)*(\\d+)(\\s|\\.|\\,|\\?|\\!|$)/i"
        ],
      replacement: [
            "\\1\\2.&nbsp;\\4\\5",
            "\\1\\2&nbsp;\\4\\5",
            "\\1\\2.&nbsp;\\4\\5"
        ]

    nbsp_before_unit:
      description: "Замена символов и привязка сокращений в размерных \
      величинах: м, см, м2…",
      pattern: [
        [
          "/(\\s|^|\\>|\\&nbsp\\;|\\,)(\\d+)( |\\&nbsp\\;)?"
          "(м|мм|см|дм|км|гм|km|dm|cm|mm)(\\s|\\.|\\!|\\?|\\,|$|"
          "\\&plusmn\\;|\\;)/i"].join ''
        [
          "/(\\s|^|\\>|\\&nbsp\\;|\\,)(\\d+)( |\\&nbsp\\;)?"
          "(м|мм|см|дм|км|гм|km|dm|cm|mm)([32]|&sup3;|&sup2;)"
          "(\\s|\\.|\\!|\\?|\\,|$|\\&plusmn\\;|\\;)/iue"].join ''
        ]
      replacement: [
            "\\1\\2&nbsp;\\4\\5",
            [
              "m.group(1)+m.group(2) \"&nbsp;\"+m.group(4)"
              " + (( \"&sup\"+m.group(5) \";\"  "
              " if m.group(5)= \"3\" or m.group(5)= \"2\" "
              " else  m.group(5) ))+m.group(6)"].join ''
        ]

    "nbsp_before_weight_unit":
      description: "Замена символов и привязка сокращений в весовых \
      величинах: г, кг, мг…",
      pattern: [
        "/(\\s|^|\\>|\\&nbsp\\;|\\,)(\\d+)( |\\&nbsp\\;)?(г|кг|мг|т)"
        "(\\s|\\.|\\!|\\?|\\,|$|\\&nbsp\\;|\\;)/i"].join ''
      replacement: "\\1\\2&nbsp;\\4\\5"

    "nobr_before_unit_volt":
      description: "Установка пробельных символов в сокращении вольт",
      pattern: "/(\\d+)([вВ]| В)(\\s|\\.|\\!|\\?|\\,|$)/",
      replacement: "\\1&nbsp;В\\3"

    "ps_pps":
      description: "Объединение сокращений P.S., P.P.S.",
      pattern: [
        "/(^|\\040|\\t|\\>|\\r|\\n)(p\\.\\040?)(p\\.\\040?)?(s\\.)"
        "([^\\<])/ie"].join ''
      replacement: [
        "m.group(1) + self.tag(m.group(2).strip() + \" \" "
        "+ (( m.group(3).strip() + \" \"  if m.group(3) "
        " else  \"\"))+ m.group(4), \"span\", "
        " \"class\" : \"nowrap\"} )+m.group(5) "].join ''

    "nobr_vtch_itd_itp":
      description: "Объединение сокращений и т.д., и т.п., в т.ч.",
      pattern: [
        "/(\\s|\\&nbsp\\;)и( |\\&nbsp\\;)т\\.?[ ]?д\\./ue",
        "/(\\s|\\&nbsp\\;)и( |\\&nbsp\\;)т\\.?[ ]?п\\./ue",
        "/(\\s|\\&nbsp\\;)в( |\\&nbsp\\;)т\\.?[ ]?ч\\./ue"
        ],
      replacement: [
        "m.group(1)+self.tag \"и т. д.\", \"span\", \"class\": \"nowrap\"})",
        "m.group(1)+self.tag \"и т. п.\", \"span\", \"class\": \"nowrap\"})",
        "m.group(1)+self.tag \"в т. ч.\", \"span\", \"class\" : \"nowrap\"})"
        ]

    "nbsp_te":
      description: "Обработка т.е.",
      pattern: "/(^|\\s|\\&nbsp\\;)([тТ])\\.?[ ]?е\\./ue",
      replacement:[
        "m.group(1) + this.tag(m.group(2) \". е.\", \"span\","
        " \"class\": \"nowrap\"})"].join ''

    "nbsp_money_abbr":
      description: "Форматирование денежных сокращений \
      (расстановка пробелов и привязка названия валюты к числу)",

      pattern: [
        "/(\\d)((\\040|\\&nbsp\\;)?(тыс|млн|млрд)\\.?"
        "(\\040|\\&nbsp\\;)?)?(\\040|\\&nbsp\\;)?(руб\\."
        "|долл\\.|евро|€|&euro;|\\$|у[\\.]? ?е[\\.]?)/ie"].join ''

      replacement: [
        "m.group(1)+ \"&nbsp;\"+m.group(4)+ \".\" if m.group(4)= \"тыс\" "
        "else \"\") if m.group(4) else \"\") \"&nbsp;\"+(m.group(7) "
        "if not re.match \"у[\\\\.]? ?е[\\\\.]?\",m.group(7),re.I | "
        "re.U) else \"у.е.\")"].join ''

      replacement_python: [
        "m.group(1)+ \"&nbsp;\"+m.group(4)+ \".\" "
        "if m.group(4)= \"тыс\" else \"\") "
        "if m.group(4) else \"\") \"&nbsp;\""
        "+(m.group(7) if not re.match \"у[\\\\.]? "
        "?е[\\\\.]?\",m.group(7),re.I | re.U) else \"у.е.\")"].join ''

    "nbsp_org_abbr":
      description: "Привязка сокращений форм собственности к \
      названиям организаций",
      pattern: [
        "/([^a-zA-Zа-яёА-ЯЁ]|^)(ООО|ЗАО|ОАО|НИИ|ПБОЮЛ) "
        "([a-zA-Zа-яёА-ЯЁ]|\\\"|\\&laquo\\;|\\&bdquo\\;|<)/"].join ''
      replacement: "\\1\\2&nbsp;\\3"

    nobr_gost:
      description: "Привязка сокращения ГОСТ к номеру",
      pattern: [
        [
          "/(\\040|\\t|\\&nbsp\\;|^)ГОСТ( |\\&nbsp\\;)?(\\d+)((\\-"
          "|\\&minus\\;|\\&mdash\\;)(\\d+))?(( |\\&nbsp\\;)(\\-"
          "|\\&mdash\\;))?/ie"].join ''

        [
          "/(\\040|\\t|\\&nbsp\\;|^|\\>)ГОСТ( |\\&nbsp\\;)?(\\d+)(\\-"
          "|\\&minus\\;|\\&mdash\\;)(\\d+)/ie"].join ''
        ],
      replacement: [
        [
          "m.group(1)+self.tag \"ГОСТ \"+m.group(3)+"
          "( \"&ndash;\"+m.group(6) if (m.group(6)) else \"\"))"
          "+( \" &mdash;\" if (m.group(7)) else \"\")) \"span\","
          " \"class\" \"nowrap\"})"
        ].join ''
        "m.group(1) \"ГОСТ \"+m.group(3) \"&ndash;\"+m.group(5)"
        ]


  rule_order: [
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
  domain_zones: [
    "r",
    "ру",
    "com",
    "ком",
    "org",
    "орг",
    "уа",
    "ua"
    ]

  classes:
    "nowrap": "word-spacing:nowrap;"

