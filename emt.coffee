EMTBase = require( './libs/emt_base').EMTBase

class EMTypograph extends EMTBase
  trets:['EMT_Tret_Quote', 'EMT_Tret_Dash', 'EMT_Tret_Symbol',
    'EMT_Tret_Punctmark', 'EMT_Tret_Number',  'EMT_Tret_Space',
    'EMT_Tret_Abbr',  'EMT_Tret_Nobr', 'EMT_Tret_Date',
    'EMT_Tret_OptAlign', 'EMT_Tret_Etc', 'EMT_Tret_Text'
  ]
  group_list:
    Quote     : true
    Dash      : true
    Nobr      : true
    Symbol    : true
    Punctmark : true
    Number    : true
    Date      : true
    Space     : true
    Abbr      : true
    OptAlign  : true
    Text      : true
    Etc       : true


  all_options:
    'Quote.quotes':
      'description' : 'Расстановка «кавычек-елочек» первого уровня'
      'selector' : "Quote.*quote"
    'Quote.quotation' :
      'description' : 'Внутренние кавычки-лапки',
      'selector' : "Quote",
      'setting' : 'no_bdquotes',
      'reversed' : true

    'Dash.to_libo_nibud' : 'direct',
    'Dash.iz_za_pod' : 'direct',
    'Dash.ka_de_kas' : 'direct',

    'Nobr.super_nbsp' : 'direct',
    'Nobr.nbsp_in_the_end' : 'direct',
    'Nobr.phone_builder' : 'direct',
    'Nobr.ip_address' : 'direct',
    'Nobr.spaces_nobr_in_surname_abbr' : 'direct',
    'Nobr.nbsp_celcius' : 'direct',
    'Nobr.hyphen_nowrap_in_small_words' : 'direct',
    'Nobr.hyphen_nowrap' : 'direct',
    'Nobr.nowrap' :
      'description' : 'Nobr (по умолчанию) & nowrap',
      'disabled' : true,
      'selector' : '*',
      'setting' : 'nowrap'

    'Symbol.tm_replace'     : 'direct',
    'Symbol.r_sign_replace' : 'direct',
    'Symbol.copy_replace' : 'direct',
    'Symbol.apostrophe' : 'direct',
    'Symbol.degree_f' : 'direct',
    'Symbol.arrows_symbols' : 'direct',
    'Symbol.no_inches' :
      'description' : 'Расстановка дюйма после числа',
      'selector' : "Quote",
      'setting' : 'no_inches',
      'reversed' : true

    'Punctmark.auto_comma' : 'direct',
    'Punctmark.hellip' : 'direct',
    'Punctmark.fix_pmarks' : 'direct',
    'Punctmark.fix_excl_quest_marks' : 'direct',
    'Punctmark.dot_on_end' : 'direct',

    'Number.minus_between_nums' : 'direct',
    'Number.minus_in_numbers_range' : 'direct',
    'Number.auto_times_x' : 'direct',
    'Number.simple_fraction' :'direct',
    'Number.math_chars' : 'direct',
    #'Number.split_number_to_triads' : 'direct',
    'Number.thinsp_between_number_triads' : 'direct',
    'Number.thinsp_between_no_and_number' : 'direct',
    'Number.thinsp_between_sect_and_number' : 'direct',

    'Date.years' : 'direct',
    'Date.mdash_month_interval' : 'direct',
    'Date.nbsp_and_dash_month_interval' : 'direct',
    'Date.nobr_year_in_date' : 'direct',

    'Space.many_spaces_to_one' : 'direct',
    'Space.clear_percent' : 'direct',
    'Space.clear_before_after_punct' :
      'description' : 'Удаление пробелов перед и после знаков \
      препинания в предложении',
      'selector' : 'Space.remove_space_before_punctuationmarks'
    'Space.autospace_after' :
      'description' : 'Расстановка пробелов после знаков препинания',
      'selector' : 'Space.autospace_after_*'
    'Space.bracket_fix' :
      'description' : 'Удаление пробелов внутри скобок, а также \
      расстановка пробела перед скобками',
      'selector' :
        ['Space.nbsp_before_open_quote', 'Punctmark.fix_brackets']

    'Abbr.nbsp_money_abbr' : 'direct',
    'Abbr.nobr_vtch_itd_itp' : 'direct',
    'Abbr.nobr_sm_im' : 'direct',
    'Abbr.nobr_acronym' : 'direct',
    'Abbr.nobr_locations' : 'direct',
    'Abbr.nobr_abbreviation' : 'direct',
    'Abbr.ps_pps' : 'direct',
    'Abbr.nbsp_org_abbr' : 'direct',
    'Abbr.nobr_gost' : 'direct',
    'Abbr.nobr_before_unit_volt' : 'direct',
    'Abbr.nbsp_before_unit' : 'direct',

    'OptAlign.all' :
      'description' : 'Inline стили или CSS',
      'hide' : true,
      'selector' : 'OptAlign.*'
    'OptAlign.oa_oquote' : 'direct',
    'OptAlign.oa_obracket_coma' : 'direct',
    'OptAlign.layout' : { 'description' : 'Inline стили или CSS' },

    'Text.paragraphs' : 'direct',
    'Text.auto_links' : 'direct',
    'Text.email' : 'direct',
    'Text.breakline' : 'direct',
    'Text.no_repeat_words' : 'direct',
    #'Etc.no_nbsp_in_nobr' : 'direct',
    'Etc.unicode_convert' :
      'description' : 'Преобразовывать html-сущности в юникод'
      'selector' : '*'
      'setting' : 'dounicode'
      'disabled' : true
  ###
  Получить список имеющихся опций

  @return array
       all    - полный список
       group  - сгруппрованный по группам
  ###
  get_options_list:->
    arr = {}
    arr['all'] = []
    bygroup = {}
    for opt of @all_options
      arr['all'][opt] = @get_option_info(opt)
      x = opt.split(".")
      bygroup[x[0]].push opt

    arr['group'] = []
    for group of @group_list
      ginfo = @group_list[group]
      if typeof ginfo? is 'boolean'
        tret = @get_tret group
        if tret
          info['title'] = @title
        else
          info['title'] = "Не определено"
      else
        info = ginfo

      info['name'] = group
      info['options'] = []
      if @Lib.isArray bygroup[group]
        for opt in bygroup[group]
          info['options'].push opt
      arr['group'].push info

    arr

  ###
  Получить информацию о настройке
  @param [string] $key
  @return [array]|False
  ###
  get_option_info:(key)->
    return false unless @all_options(key)
    return @all_options[key] if @Lib.isArray @all_options[key]
    return @all_options[key] if @Lib.isObject @all_options[key]

    if @all_options[key] in ["direct",'reverse']
      pa = key.split(".")
      tret_pattern = pa[0]
      tret = @get_tret tret_pattern
      return false unless tret
      return false unless tret.rules.has_key(pa[1])
      array = tret.rules[pa[1]]
      array['way'] = self.all_options[key]
      return array

    return false

  ###
  Установка одной метанастройки
  @param [string] $name
  @param [mixed] $value
  ###
  do_setup:(name, value)->
    return unless @all_options[name]

    if typeof @all_options[name] is 'string'
      @set(name, "active", value)
      return

    if @all_options[name].selector
      settingname = "active"
      if @all_options[name].setting
        settingname = @all_options[name].setting
        @set @all_options[name].selector, settingname, value

    if name is 'OptAlign.layout'
      @set_tag_layout LAYOUT_STYLE if value is "style"
      @set_tag_layout LAYOUT_CLASS if value is "style"

  ###
  Запустить типограф со стандартными параметрами
  @param [string] $text
  @param [array] $options
  @return [string]
  ###
  fast_apply:(text, options)->
    @setup options if @Lib.isObject options
    @set_text text
    @apply()

  # constructor:->


