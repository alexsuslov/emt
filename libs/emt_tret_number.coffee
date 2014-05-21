EMTret = require( './emt_base').EMTret
###
EMT_Tret_Number
###
class EMTretNumber extends EMTret
  title: "Числа, дроби, математические знаки"
  rules:
    "minus_between_nums":
      description: "Расстановка знака минус между числами",
      pattern: "/(\\d+)\\-(\\d)/i",
      replacement: "\\1&minus;\\2"

    "minus_in_numbers_range":
      description: "Расстановка знака минус между диапозоном чисел",
      pattern: [
        "/(^|\\s|\\&nbsp\\;)(\\&minus\\;|\\-)(\\d+)(\\.\\.\\."
        "|\\&hellip\\;)(\\s|\\&nbsp\\;)?(\\+|\\-|\\&minus\\;)"
        "?(\\d+)/ie"].join ''
      replacement: [
        "m.group(1) +u\"&minus;\"+m.group(3) + m.group(4)+m.group(5)"
        " + ((m.group(6) if m.group(6)==u\"+\" else u\"&minus;\"))"
        " + m.group(7)"].join ''

    "auto_times_x":
      description: "Замена x на символ × в размерных единицах",
      "cycled": true,
      pattern: [
        "/([^a-zA-Z><]|^)(\\&times\\;)?(\\d+)(\\040*)(x|х)"
        "(\\040*)(\\d+)([^a-zA-Z><]|$)/"].join ''
      replacement: "\\1\\2\\3&times;\\7\\8"

    "numeric_sub":
      description: "Нижний индекс",
      pattern: "/([a-zа-яё0-9])\\_([\\d]1,3})([^а-яёa-z0-9]|$)/ie",
      replacement: [
        "m.group(1) + self.tag(self.tag(m.group(2),u\"small\"),u\"sub\")"
        " + m.group(3)"].join ''

    "numeric_sup":
      description: "Верхний индекс",
      pattern: "/([a-zа-яё0-9])\\^([\\d]1,3})([^а-яёa-z0-9]|$)/ie",
      replacement: [
        "m.group(1) + self.tag(self.tag(m.group(2),u\"small\"),u\"sup\")"
        " + m.group(3)"].join ''

    "simple_fraction":
      description: "Замена дробей 1/2, 1/4, 3/4 на соответствующие символы",
      pattern: [
          "/(^|\\D)1\\/(2|4)(\\D)/",
          "/(^|\\D)3\\/4(\\D)/"
      ],
      replacement: [
          "\\1&frac1\\2;\\3",
          "\\1&frac34;\\2"
      ]

    "math_chars":
      description: "Математические знаки больше/меньше/плюс минус/неравно",
      "simple_replace": true,
      pattern: [
          "!=",
          "<=",
          ">=",
          "~=",
          "+-"
      ],
      replacement: [
          "&ne;",
          "&le;",
          "&ge;",
          "&cong;",
          "&plusmn;"
      ]

    "thinsp_between_number_triads":
      description: "Объединение триад чисел полупробелом",
      pattern: "/([0-9]1,3}( [0-9]3})1,})(.|$)/ue",
      # @todo
      replacement: [
        "(( m.group(0) if m.group(3)==u\"-\" else "
        "this.Lib.str_replace(u\" \",u\"&thinsp;\",m.group(1))+m.group(3)))"
        ].join ''

    "thinsp_between_no_and_number":
      description: "Пробел между симоволом номера и числом",
      pattern: "/(№|\\&#8470\\;)(\\s|&nbsp;)*(\\d)/i",
      replacement: "&#8470;&thinsp;\\3"

    "thinsp_between_sect_and_number":
      description: "Пробел между параграфом и числом",
      pattern: "/(§|\\&sect\\;)(\\s|&nbsp;)*(\\d+|[IVX]+|[a-zа-яё]+)/ui",
      replacement: "&sect;&thinsp;\\3"

  rule_order: [
    "minus_between_nums",
    "minus_in_numbers_range",
    "auto_times_x",
    "numeric_sub",
    "numeric_sup",
    "simple_fraction",
    "math_chars",
    "thinsp_between_number_triads",
    "thinsp_between_no_and_number",
    "thinsp_between_sect_and_number"
    ]
