EMTret = require( './emt_tret').EMTret
###
EMT_Tret_Punctmark
###
class EMTretPunctmark extends EMTret
  title: "Специальные символы"
  rules:
    auto_comma:
      description: "Расстановка запятых перед а, но",
      pattern: "/([a-zа-яё])(\\s|&nbsp;)(но|а)(\\s|&nbsp;)/i",
      replacement: "\\1,\\2\\3\\4"

    "punctuation_marks_limit":
      description: "Лишние восклицательные, вопросительные знаки и точки",
      pattern: "/([\\!\\.\\?])4,}/",
      replacement: "\\1\\1\\1"

    "punctuation_marks_base_limit":
      description: "Лишние запятые, двоеточия, точки с запятой",
      pattern: "/([\\,]|[\\:]|[\\;]])2,}/",
      replacement: "\\1"

    "hellip":
      description: "Замена трех точек на знак многоточия",
      "simple_replace": true,
      pattern: "...",
      replacement: "&hellip;"

    "fix_excl_quest_marks":
      description: "Замена восклицательного и вопросительного знаков местами",
      pattern: "/([a-zа-яё0-9])\\!\\?(\\s|$|\\<)/ui",
      replacement: "\\1?!\\2"

    "fix_pmarks":
      description: "Замена сдвоенных знаков препинания на одинарные",
      pattern: [
          "/([^\\!\\?])\\.\\./",
          "/([a-zа-яё0-9])(\\!|\\.)(\\!|\\.|\\?)(\\s|$|\\<)/ui",
          "/([a-zа-яё0-9])(\\?)(\\?)(\\s|$|\\<)/ui"
      ],
      replacement: [
            "\\1.",
            "\\1\\2\\4",
            "\\1\\2\\4"
        ]

    "fix_brackets":
      description: "Лишние пробелы после открывающей скобочки и перед\
       закрывающей",
      pattern: [
          "/(\\()(\\040|\\t)+/",
          "/(\\040|\\t)+(\\))/"
      ],
      replacement: [
          "\\1",
          "\\2"
      ]

    "fix_brackets_space":
      description: "Пробел перед открывающей скобочкой",
      pattern: "/([a-zа-яё0-9])(\\()/i",
      replacement: "\\1 \\2"

    "dot_on_end":
      description: "Точка в конце текста, если её там нет",
      disabled: true,
      pattern: "/([a-zа-яё0-9])(\\040|\\t|\\&nbsp\\;)*$/ui",
      replacement: "\\1."


  rule_order: [
    "auto_comma",
    "punctuation_marks_limit",
    "punctuation_marks_base_limit",
    "hellip",
    "fix_excl_quest_marks",
    "fix_pmarks",
    "fix_brackets",
    "fix_brackets_space",
    "dot_on_end"
    ]

module.exports =
  EMTretPunctmark: EMTretPunctmark

