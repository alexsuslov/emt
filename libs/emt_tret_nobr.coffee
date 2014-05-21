EMTret = require( './emt_tret').EMTret
###
EMT_Tret_Nobr
###
class EMTretNobr extends EMTret
  title: "Неразрывные конструкции"
  rules:
    super_nbsp:
      description: "Привязка союзов и предлогов к написанным после словам"
      pattern:
        "/(\\s|^|\\&(la|bd)quo\\;|\\>|\\(|\\&mdash\\;\\&nbsp\\;)\
          ([a-zа-яё]{1,2}\\s+)([a-zа-яё]{1,2}\\s+)?([a-zа-яё0-9\\-]\
            {2,}|[0-9])/ie"
      replacement: "m.group(1) + m.group(3).strip() + u\"&nbsp;\" + \
      (( m.group(4).strip() + u\"&nbsp;\"  if m.group(4)  else  u\"\")) \
      + m.group(5)"

    nbsp_in_the_end:
      description: "Привязка союзов и предлогов к предыдущим словам в \
      случае конца предложения",
      pattern: "/([a-zа-яё0-9\\-]{3,}) ([a-zа-яё]{1,2})\\.( [A-ZА-ЯЁ]|$)/",
      replacement: "\\1&nbsp;\\2.\\3"

    phone_builder:
      description:"Объединение в неразрывные конструкции номеров телефонов"
      pattern:[
          "/([^\\d\\+]|^)([\\+]?[0-9]{1,3})( |\\&nbsp\\;|\\&thinsp\\;)\
          ([0-9]{3,4}|\\([0-9]{3,4}\\))( |\\&nbsp\\;|\\&thinsp\\;)\
          ([0-9]{2,3})(-|\\&minus\\;)([0-9]{2})(-|\\&minus\\;)\
          ([0-9]{2})([^\\d]|$)/e"
          "/([^\\d\\+]|^)([\\+]?[0-9]{1,3})( |\\&nbsp\\;|\\&thinsp\\;)\
          ([0-9]{3,4}|[0-9]{3,4})( |\\&nbsp\\;|\\&thinsp\\;)([0-9]{2,3})\
          (-|\\&minus\\;)([0-9]{2})(-|\\&minus\\;)([0-9]{2})([^\\d]|$)/e"
        ]

      replacement: [
        "m.group(1)  +(( m.group(2)+u\" \"+m.group(4)+u\" \"+m.group(6)\
          +u\"-\"+m.group(8)+u\"-\"+m.group(10)  if (m.group(1) == \
          u\">\"  or  m.group(11) == u\"<\")  else \
          self.tag(m.group(2)+u\" \"+m.group(4)+u\" \"+m.group(6)+u\"-\" \
          +m.group(8)+u\"-\"+m.group(10), u\"span\", \
          {u\"class\":u\"nowrap\"})  ))+m.group(11)",
        "m.group(1)  +(( m.group(2)+u\" \"+m.group(4)+u\" \"+m.group(6)\
          +u\"-\"+m.group(8)+u\"-\"+m.group(10)  if (m.group(1) == u\">\"\
          or  m.group(11) == u\"<\")  else self.tag(m.group(2)+u\" \
          \"+m.group(4)+u\" \"+m.group(6)+u\"-\"+m.group(8)+u\"-\"\
          +m.group(10), u\"span\", {u\"class\":u\"nowrap\"})  ))+m.group(11)"
        ]

    ip_address:
      description: "Объединение IP-адресов"
      pattern: "/(\\s|\\&nbsp\\;|^)\
      (\\d{0,3}\\.\\d{0,3}\\.\\d{0,3}\\.\\d{0,3})/ie",
      replacement: "m.group(1) + self.nowrap_ip_address(m.group(2))"

    "spaces_nobr_in_surname_abbr":
      description: "Привязка инициалов к фамилиям",
      pattern: [
        "/(\\s|^|\\.|\\,|\\;|\\:|\\?|\\!|\\&nbsp\\;)([A-ZА-ЯЁ])\\.?(\\s\
        |\\&nbsp\\;)?([A-ZА-ЯЁ])(\\.(\\s|\\&nbsp\\;)?|(\\s|\\&nbsp\\;))\
        ([A-ZА-ЯЁ][a-zа-яё]+)(\\s|$|\\.|\\,|\\;|\\:|\\?|\\!|\\&nbsp\\;)/ue",
        "/(\\s|^|\\.|\\,|\\;|\\:|\\?|\\!|\\&nbsp\\;)([A-ZА-ЯЁ][a-zа-яё]+)\
        (\\s|\\&nbsp\\;)([A-ZА-ЯЁ])\\.?(\\s|\\&nbsp\\;)?([A-ZА-ЯЁ])\\.?\
        (\\s|$|\\.|\\,|\\;|\\:|\\?|\\!|\\&nbsp\\;)/ue"
        ]
      replacement: [
        "m.group(1)+self.tag(m.group(2)+u\". \"+m.group(4)+u\".\
         \"+m.group(8), u\"span\",  {u\"class\" : u\"nowrap\"})+m.group(9)",
        "m.group(1)+self.tag(m.group(2)+u\" \"+m.group(4)+u\".\
        \"+m.group(6)+u\".\", u\"span\",  {u\"class\" : \
          u\"nowrap\"})+m.group(7)"
        ]

    "nbsp_before_particle":
      description: "Неразрывный пробел перед частицей",
      pattern: "/(\\040|\\t)+(ли|бы|б|же|ж)(\\&nbsp\\;|\\.|\\,|\\:|\\;\
        |\\&hellip\\;|\\?|\\s)/iue",
      replacement: "u\"&nbsp;\"+m.group(2) + \
      (( u\" \"  if m.group(3) == u\"&nbsp;\"  else  m.group(3)))"

    "nbsp_v_kak_to":
      description: "Неразрывный пробел в как то",
      pattern: "/как то\\:/ui",
      replacement: "как&nbsp;то:"

    "nbsp_celcius":
      description: "Привязка градусов к числу",
      pattern: "/(\\s|^|\\>|\\&nbsp\\;)(\\d+)( |\\&nbsp\\;)?(°|\\&deg\\;)\
      (C|С)(\\s|\\.|\\!|\\?|\\,|$|\\&nbsp\\;|\\;)/i",
      replacement: "\\1\\2&nbsp;\\4C\\6"

    "hyphen_nowrap_in_small_words":
      description: "Обрамление пятисимвольных слов разделенных дефисом \
      в неразрывные блоки"
      disabled: true,
      cycled: true,
      pattern: "/(\\&nbsp\\;|\\s|\\>|^)([a-zа-яё]{1}\\-[a-zа-яё]{4}|\
        [a-zа-яё]{2}\\-[a-zа-яё]{3}|[a-zа-яё]{3}\\-[a-zа-яё]{2}|\
        [a-zа-яё]{4}\\-[a-zа-яё]{1}|когда\\-то|кое\\-как|кой\\-кого|\
        вс[её]\\-таки|[а-яё]+\\-(кась|ка|де))(\\s|\\.|\\,|\\!|\\?\
        |\\&nbsp\\;|\\&hellip\\;|$)/uie",
      replacement: "m.group(1) + self.tag(m.group(2), u\"span\", \
        {u\"class\":u\"nowrap\"}) + m.group(4)"

    "hyphen_nowrap":
      description: "Отмена переноса слова с дефисом"
      disabled: true,
      cycled: true,
      pattern: "/(\\&nbsp\\;|\\s|\\>|^)([a-zа-яё]+)((\\-([a-zа-яё]+)){1,2})\
      (\\s|\\.|\\,|\\!|\\?|\\&nbsp\\;|\\&hellip\\;|$)/uie",
      replacement: "m.group(1) + self.tag(m.group(2)+m.group(3), u\"span\", \
        {u\"class\":u\"nowrap\"}) + m.group(6)"

  rule_order: [
    "super_nbsp",
    "nbsp_in_the_end",
    "phone_builder",
    "ip_address",
    "spaces_nobr_in_surname_abbr",
    "nbsp_before_particle",
    "nbsp_v_kak_to",
    "nbsp_celcius",
    "hyphen_nowrap_in_small_words",
    "hyphen_nowrap"
    ]
  @classes =
    nowrap: "word-spacing:nowrap;"

  ###
  Объединение IP-адрессов в неразрывные конструкции (IPv4 only)
  @param unknown_type $triads
  @return unknown
  ###
  nowrap_ip_address:(triads)->
    triad = triads.split('.')
    addTag = true

    for value in triad
      value = parseInt value
      if value > 255
        addTag = false
        break

    if addTag is true
      triads = @tag(triads, 'span', {'class': "nowrap"})

      return triads

exports.EMTretNobr = EMTretNobr
