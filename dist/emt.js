(function() {
  var Abbr, AcuteAccent, App, AutoComma, Dash, DotOnEnd, EMTLib, EmtDate, Etc, FixBrackets, FixBracketsSpace, FixExclQuestMarks, FixPmarks, Hellip, MinusBetweenNums, NbspBeforeUnit, NbspBeforeWeightUnit, NbspInTheEnd, NbspMoneyAbbr, NbspOrgAbbr, NbspTe, NoBr, NobrAbbreviation, NobrAcronym, NobrBeforeUnitVolt, NobrGost, NobrLocations, NobrSmIm, NobrVtchItdItp, Numbers, OaObracketComa, OaOquote, OpenQuote, OpenQuoteAdv, PsPps, Punctmark, PunctuationMarksBaseLimit, PunctuationMarksLimit, Quote, Rule, Space, Symbol, Text, chars_table, html4_char, isClient, module,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  isClient = !(typeof window === 'undefined');

  if (isClient) {
    module = {};
    App = {
      rules: [],
      text: '',
      Lib: {},
      Rules: {},
      order: ['Quote', 'Abbr', 'Numbers', 'Dash', 'EmtDate', 'Etc', 'NoBr', 'Text', 'Symbol', 'Space'],
      apply: function() {
        var rule, _i, _len, _ref;
        this.text = this.el.html();
        _ref = this.rules;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          rule = _ref[_i];
          rule.text = this.text;
          rule.apply();
          this.text = rule.text;
        }
        this.el.html(this.text);
        return this;
      },
      init: function(opt, el) {
        var ruleName, _i, _len, _ref;
        this.opt = opt;
        this.el = el;
        _ref = this.order;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          ruleName = _ref[_i];
          if (this.Rules[ruleName]) {
            this.rules.push(new this.Rules[ruleName]({
              Rules: this.Rules,
              Lib: this.Lib
            }));
          }
        }
        this.apply();
        return this;
      }
    };
    window.EMT = App;
    $(function() {
      return $.fn.emt = function(options) {
        return App.init(options, this);
      };
    });
  }

  chars_table = {
    '"': {
      html: ['&laquo;', '&raquo;', '&ldquo;', '&lsquo;', '&bdquo;', '&ldquo;', '&quot;', '&#171;', '&#187;'],
      utf8: [0x201E, 0x201C, 0x201F, 0x201D, 0x00AB, 0x00BB]
    },
    ' ': {
      html: ['&nbsp;', '&thinsp;', '&#160;'],
      utf8: [0x00A0, 0x2002, 0x2003, 0x2008, 0x2009]
    },
    '-': {
      html: ['&ndash;', '&minus;', '&#151;', '&#8212;', '&#8211;'],
      utf8: [0x002D, 0x2010, 0x2012, 0x2013]
    },
    '—': {
      html: ['&mdash;'],
      utf8: [0x2014]
    },
    '==': {
      html: ['&equiv;'],
      utf8: [0x2261]
    },
    '...': {
      html: ['&hellip;', '&#0133;'],
      utf8: [0x2026]
    },
    '!=': {
      html: ['&ne;', '&#8800;'],
      utf8: [0x2260]
    },
    '<=': {
      html: ['&le;', '&#8804;'],
      utf8: [0x2264]
    },
    '>=': {
      html: ['&ge;', '&#8805;'],
      utf8: [0x2265]
    },
    '1/2': {
      html: ['&frac12;', '&#189;'],
      utf8: [0x00BD]
    },
    '1/4': {
      html: ['&frac14;', '&#188;'],
      utf8: [0x00BC]
    },
    '3/4': {
      html: ['&frac34;', '&#190;'],
      utf8: [0x00BE]
    },
    '+-': {
      html: ['&plusmn;', '&#177;'],
      utf8: [0x00B1]
    },
    '&': {
      html: ['&amp;', '&#38;']
    },
    '(tm)': {
      html: ['&trade;', '&#153;'],
      utf8: [0x2122]
    },
    '(r)': {
      html: ['&reg;', '&#174;'],
      utf8: [0x00AE]
    },
    '(c)': {
      html: ['&copy;', '&#169;'],
      utf8: [0x00A9]
    },
    '§': {
      html: ['&sect;', '&#167;'],
      utf8: [0x00A7]
    },
    '`': {
      html: ['&#769;']
    },
    '\'': {
      html: ['&rsquo;', '’']
    },
    'x': {
      html: ['&times;', '&#215;'],
      utf8: ['×']
    }
  };

  if (typeof window !== "undefined" && window !== null) {
    window.chars_table = chars_table;
  } else {
    exports.module = chars_table;
  }

  html4_char = {
    'nbsp': 160,
    'iexcl': 161,
    'cent': 162,
    'pound': 163,
    'curren': 164,
    'yen': 165,
    'brvbar': 166,
    'sect': 167,
    'uml': 168,
    'copy': 169,
    'ordf': 170,
    'laquo': 171,
    'not': 172,
    'shy': 173,
    'reg': 174,
    'macr': 175,
    'deg': 176,
    'plusmn': 177,
    'sup2': 178,
    'sup3': 179,
    'acute': 180,
    'micro': 181,
    'para': 182,
    'middot': 183,
    'cedil': 184,
    'sup1': 185,
    'ordm': 186,
    'raquo': 187,
    'frac14': 188,
    'frac12': 189,
    'frac34': 190,
    'iquest': 191,
    'Agrave': 192,
    'Aacute': 193,
    'Acirc': 194,
    'Atilde': 195,
    'Auml': 196,
    'Aring': 197,
    'AElig': 198,
    'Ccedil': 199,
    'Egrave': 200,
    'Eacute': 201,
    'Ecirc': 202,
    'Euml': 203,
    'Igrave': 204,
    'Iacute': 205,
    'Icirc': 206,
    'Iuml': 207,
    'ETH': 208,
    'Ntilde': 209,
    'Ograve': 210,
    'Oacute': 211,
    'Ocirc': 212,
    'Otilde': 213,
    'Ouml': 214,
    'times': 215,
    'Oslash': 216,
    'Ugrave': 217,
    'Uacute': 218,
    'Ucirc': 219,
    'Uuml': 220,
    'Yacute': 221,
    'THORN': 222,
    'szlig': 223,
    'agrave': 224,
    'aacute': 225,
    'acirc': 226,
    'atilde': 227,
    'auml': 228,
    'aring': 229,
    'aelig': 230,
    'ccedil': 231,
    'egrave': 232,
    'eacute': 233,
    'ecirc': 234,
    'euml': 235,
    'igrave': 236,
    'iacute': 237,
    'icirc': 238,
    'iuml': 239,
    'eth': 240,
    'ntilde': 241,
    'ograve': 242,
    'oacute': 243,
    'ocirc': 244,
    'otilde': 245,
    'ouml': 246,
    'divide': 247,
    'oslash': 248,
    'ugrave': 249,
    'uacute': 250,
    'ucirc': 251,
    'uuml': 252,
    'yacute': 253,
    'thorn': 254,
    'yuml': 255,
    'fnof': 402,
    'Alpha': 913,
    'Beta': 914,
    'Gamma': 915,
    'Delta': 916,
    'Epsilon': 917,
    'Zeta': 918,
    'Eta': 919,
    'Theta': 920,
    'Iota': 921,
    'Kappa': 922,
    'Lambda': 923,
    'Mu': 924,
    'Nu': 925,
    'Xi': 926,
    'Omicron': 927,
    'Pi': 928,
    'Rho': 929,
    'Sigma': 931,
    'Tau': 932,
    'Upsilon': 933,
    'Phi': 934,
    'Chi': 935,
    'Psi': 936,
    'Omega': 937,
    'alpha': 945,
    'beta': 946,
    'gamma': 947,
    'delta': 948,
    'epsilon': 949,
    'zeta': 950,
    'eta': 951,
    'theta': 952,
    'iota': 953,
    'kappa': 954,
    'lambda': 955,
    'mu': 956,
    'nu': 957,
    'xi': 958,
    'omicron': 959,
    'pi': 960,
    'rho': 961,
    'sigmaf': 962,
    'sigma': 963,
    'tau': 964,
    'upsilon': 965,
    'phi': 966,
    'chi': 967,
    'psi': 968,
    'omega': 969,
    'thetasym': 977,
    'upsih': 978,
    'piv': 982,
    'bull': 8226,
    'hellip': 8230,
    'prime': 8242,
    'Prime': 8243,
    'oline': 8254,
    'frasl': 8260,
    'weierp': 8472,
    'image': 8465,
    'real': 8476,
    'trade': 8482,
    'alefsym': 8501,
    'larr': 8592,
    'uarr': 8593,
    'rarr': 8594,
    'darr': 8595,
    'harr': 8596,
    'crarr': 8629,
    'lArr': 8656,
    'uArr': 8657,
    'rArr': 8658,
    'dArr': 8659,
    'hArr': 8660,
    'forall': 8704,
    'part': 8706,
    'exist': 8707,
    'empty': 8709,
    'nabla': 8711,
    'isin': 8712,
    'notin': 8713,
    'ni': 8715,
    'prod': 8719,
    'sum': 8721,
    'minus': 8722,
    'lowast': 8727,
    'radic': 8730,
    'prop': 8733,
    'infin': 8734,
    'ang': 8736,
    'and': 8743,
    'or': 8744,
    'cap': 8745,
    'cup': 8746,
    'int': 8747,
    'there4': 8756,
    'sim': 8764,
    'cong': 8773,
    'asymp': 8776,
    'ne': 8800,
    'equiv': 8801,
    'le': 8804,
    'ge': 8805,
    'sub': 8834,
    'sup': 8835,
    'nsub': 8836,
    'sube': 8838,
    'supe': 8839,
    'oplus': 8853,
    'otimes': 8855,
    'perp': 8869,
    'sdot': 8901,
    'lceil': 8968,
    'rceil': 8969,
    'lfloor': 8970,
    'rfloor': 8971,
    'lang': 9001,
    'rang': 9002,
    'loz': 9674,
    'spades': 9824,
    'clubs': 9827,
    'hearts': 9829,
    'diams': 9830,
    'quot': 34,
    'amp': 38,
    'lt': 60,
    'gt': 62,
    'OElig': 338,
    'oelig': 339,
    'Scaron': 352,
    'scaron': 353,
    'Yuml': 376,
    'circ': 710,
    'tilde': 732,
    'ensp': 8194,
    'emsp': 8195,
    'thinsp': 8201,
    'zwnj': 8204,
    'zwj': 8205,
    'lrm': 8206,
    'rlm': 8207,
    'ndash': 8211,
    'mdash': 8212,
    'lsquo': 8216,
    'rsquo': 8217,
    'sbquo': 8218,
    'ldquo': 8220,
    'rdquo': 8221,
    'bdquo': 8222,
    'dagger': 8224,
    'Dagger': 8225,
    'permil': 8240,
    'lsaquo': 8249,
    'rsaquo': 8250,
    'euro': 8364
  };

  if (typeof window !== "undefined" && window !== null) {
    window.html4_char = html4_char;
  } else {
    exports.module = html4_char;
  }

  if (!chars_table) {
    chars_table = require('./chars_table');
  }

  if (!html4_char) {
    html4_char = require('./html4_char_ents');
  }

  EMTLib = (function() {
    function EMTLib() {}

    EMTLib.prototype.charsTable = chars_table;

    EMTLib.prototype.html4_char_ents = html4_char;

    EMTLib.prototype.domain_zones = ["ru", "ру", "com", "ком", "org", "орг", "уа", "ua"];

    EMTLib.prototype.QUOTE_FIRS_OPEN = '«';

    EMTLib.prototype.QUOTE_FIRS_CLOSE = '»';

    EMTLib.prototype.QUOTE_CRAWSE_OPEN = '&bdquo;';

    EMTLib.prototype.QUOTE_CRAWSE_CLOSE = '&ldquo;';

    EMTLib.prototype.LAYOUT_STYLE = 1;

    EMTLib.prototype.LAYOUT_CLASS = 2;

    EMTLib.prototype.INTERNAL_BLOCK_OPEN = '%%%INTBLOCKO235978%%%';

    EMTLib.prototype.INTERNAL_BLOCK_CLOSE = '%%%INTBLOCKC235978%%%';

    EMTLib.prototype._typographSpecificTagId = false;


    /*
    Проверка на целое
    @param [Number] число
    @return [boolean]
    TEST ok
     */

    EMTLib.prototype.isInt = function(n) {
      return n === +n && n === (n | 0);
    };

    EMTLib.prototype.isArray = function(o) {
      return Object.prototype.toString.call(o) === '[object Array]';
    };

    EMTLib.prototype.isObject = function(o) {
      return Object.prototype.toString.call(o) === '[object Object]';
    };

    EMTLib.prototype.trim = function(str) {
      return str.replace(/^\s+/, '').replace(/\s+$/, '');
    };

    EMTLib.prototype.repeat = function(input, multiplier) {
      var buf, i;
      buf = "";
      i = 0;
      while (i < multiplier) {
        buf += input;
        i++;
      }
      return buf;
    };


    /*
    Метод, осуществляющий декодирование информации
    @param     [String] text
    @return    [String]
    TEST ok
     */

    EMTLib.prototype.decrypt_tag = function(text) {
      return new Buffer(text.slice(0, -1), 'base64').toString();
    };


    /*
    Метод, осуществляющий кодирование (сохранение) информации
    с целью невозможности типографировать ее
    @param     [String] text
    @return    [String]
    TEST ok
     */

    EMTLib.prototype.encrypt_tag = function(text) {
      return new Buffer(text).toString('base64') + '=';
    };


    /*
      Сохраняем содержимое тегов HTML
    
    Тег 'a' кодируется со специальным префиксом для дальнейшей
    возможности выносить за него кавычки.
    
     @param  [String] $text
     @param  [boolean] $safe
     @return [String]
    
    TEST ok
     */

    EMTLib.prototype.safe_tag_chars = function(text, way) {
      var process, self;
      self = this;
      process = function(str) {
        var atag, match, options;
        match = str.match(new RegExp('(\</?)(.+?)(\>)'));
        atag = '';
        if (match[2][0] === 'a') {
          atag = "%%___";
        }
        match[2] = match[2].replace(/^%%___/, '');
        if (way) {
          options = self.encrypt_tag(match[2]);
        }
        if (!way) {
          options = self.decrypt_tag(match[2]);
        }
        return "" + match[1] + atag + options + match[3];
      };
      return text.replace(/\<.+?\>/gm, process);
    };


    /*
    Удаление кодов HTML из текста
    ```
    <code>
     // Remove UTF-8 chars:
        $str = EMT_Lib::clear_special_chars('your text', 'utf8');
     // ... or HTML codes only:
        $str = EMT_Lib::clear_special_chars('your text', 'html');
        // ... or combo:
     $str = EMT_Lib::clear_special_chars('your text');
    </code>
    ```
    @param   [String] $text
    @param   [Array] $mode
    @return  [String]|[boolean]
    TEST
     */

    EMTLib.prototype.clear_special_chars = function(text, mode) {
      var char, mod, moder, type, v, vals, _i, _j, _k, _l, _len, _len1, _len2, _len3, _ref, _ref1;
      if (!text) {
        return false;
      }
      if (typeof mode === 'string') {
        mode = [mode];
      }
      if (!mode) {
        mode = ['utf8', 'html'];
      }
      moder = [];
      for (_i = 0, _len = mode.length; _i < _len; _i++) {
        mod = mode[_i];
        if (mod === 'utf8' || mod === 'html') {
          moder.push(mod);
        }
      }
      if (!moder.length) {
        return false;
      }
      _ref = this.charsTable;
      for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
        char = _ref[_j];
        vals = this.charsTable[char];
        for (_k = 0, _len2 = mode.length; _k < _len2; _k++) {
          type = mode[_k];
          if (__indexOf.call(vals, type) >= 0) {
            _ref1 = vals[type];
            for (_l = 0, _len3 = _ref1.length; _l < _len3; _l++) {
              v = _ref1[_l];
              if ('utf8' === type && this.isInt(v)) {
                v = String.fromCharCode(v);
              }
              if ('html' === type) {
                if (v.search(/<[a-z]+>/i)) {
                  v = this.safe_tag_chars(v, true);
                }
              }
              text = text.replace(v, char);
            }
          }
        }
      }
      return text;
    };


    /*
     Кодирует спец блок
    
     @param   [String] $text
     @return  [String]
    
    TEST ok
     */

    EMTLib.prototype.encode_internal_blocks = function(text) {
      text = this.encrypt_tag(text);
      return "" + this.INTERNAL_BLOCK_OPEN + text + this.INTERNAL_BLOCK_CLOSE;
    };

    EMTLib.prototype.iblock = function(text) {
      return this.encode_internal_blocks(text);
    };


    /*
    Декодриует спец блоки
    
    @param   [String] $text
    @return  [String]
    
    TEST ok
     */

    EMTLib.prototype.decode_internal_blocks = function(text) {
      var decrypt_tag, process, re, reClose, reOpen, _CLOSE, _OPEN;
      decrypt_tag = this.decrypt_tag;
      _OPEN = this.INTERNAL_BLOCK_OPEN;
      reOpen = new RegExp("^" + _OPEN);
      _CLOSE = this.INTERNAL_BLOCK_CLOSE;
      reClose = new RegExp(_CLOSE + "$");
      re = new RegExp(_OPEN + "(.*?)" + _CLOSE, 'gm');
      process = function(str) {
        return decrypt_tag(str.replace(reOpen, '').replace(reClose, ''));
      };
      return text.replace(re, process);
    };

    EMTLib.prototype.rand = function(min, max) {
      if (min == null) {
        min = 0;
      }
      if (max == null) {
        max = 1;
      }
      return Math.random() * (max - min) + min;
    };


    /* Создание тега с защищенным содержимым
    
    @param     [String] $content текст, который будет обрамлен тегом
    @param     [String] $tag тэг
    @param     [array] $attribute список атрибутов,
    где ключ - имя атрибута, а значение - само значение данного атрибута
    @return    [String]
     */

    EMTLib.prototype.build_safe_tag = function(content, tag, attribute, layout) {
      var attr, classname, htmlTag, st, value, _i, _len;
      if (tag == null) {
        tag = 'span';
      }
      if (attribute == null) {
        attribute = {};
      }
      if (layout == null) {
        layout = this.LAYOUT_STYLE;
      }
      htmlTag = tag;
      if (this._typographSpecificTagId) {
        if (__indexOf.call(attribute, 'id') < 0) {
          attribute['id'] = 'emt-2' + this.rand(1000, 9999);
        }
      }
      classname = "";
      if (Object.keys(attribute).length) {
        if (layout & this.LAYOUT_STYLE) {
          if (__indexOf.call(attribute, '__style') >= 0 && attribute['__style']) {
            st = this.trim(attribute['style']);
            if (st[-1] !== ";") {
              st += ";";
            }
            st += attribute['__style'];
            attribute['style'] = st;
          } else {
            attribute['style'] = attribute['__style'];
            delete attribute['__style'];
          }
        }
        for (_i = 0, _len = attribute.length; _i < _len; _i++) {
          attr = attribute[_i];
          value = attribute[attr];
          if (attr === "__style") {
            continue;
          }
          if (attr === "class") {
            classname = value;
            continue;
          }
          htmlTag += " " + attr + "=\"" + value + "\"";
        }
      }
      if ((layout & this.LAYOUT_CLASS) && classname) {
        htmlTag += " class=\"" + classname + "\"";
      }
      return "<" + this.encrypt_tag(htmlTag) + ">" + content + "</" + this.encrypt_tag(tag) + ">";
    };


    /*
    Метод, осуществляющий декодирование информации
    
    @param   [String] $text
    @return  [String]
     */

    EMTLib.prototype.strpos_ex = function(haystack, needle, offset) {
      var m, n, p, w, _i, _len;
      if (this.isArray(needle)) {
        m = -1;
        w = -1;
        for (_i = 0, _len = needle.length; _i < _len; _i++) {
          n = needle[_i];
          p = haystack.find(n, offset);
          if (p === -1) {
            m = p;
            w = n;
            continue;
          }
          if (p < m) {
            m = p;
            w = n;
          }
        }
        if (m === -1) {
          return false;
        }
        return {
          pos: m,
          str: w
        };
      }
      return haystack.find(needle, offset);
    };

    EMTLib.prototype.process_selector_pattern = function(pattern) {
      if (pattern === false) {
        return;
      }
      return pattern.replace("*", "[a-z0-9_\-]*");
    };

    EMTLib.prototype.test_pattern = function(pattern, text) {
      if (pattern === false) {
        return True;
      }
      return re.match(pattern, text);
    };

    EMTLib.prototype.strtolower = function(string) {
      return string.toLowerCase();
    };


    /*
    @todo getUnicodeChar()
     */


    /*
    Вернуть уникод символ по html entinty
    
    @param [String] $entity
    @return [String]
     */

    EMTLib.prototype.html_char_entity_to_unicode = function(entity) {
      if (__indexOf.call(this.html4_char_ents, entity) >= 0) {
        return this.getUnicodeChar(this.html4_char_ents[entity]);
      }
      return false;
    };

    return EMTLib;

  })();

  if (typeof window !== "undefined" && window !== null) {
    App.Lib = new EMTLib();
  } else {
    module.exports = {
      EMTLib: EMTLib,
      emtlib: new EMTLib()
    };
  }


  /*
  Правило "Открывающая кавычка"
  используется как объект расширения для остальных правил
   */

  OpenQuote = (function() {
    OpenQuote.prototype.used = 0;

    OpenQuote.prototype.timer = 0;

    OpenQuote.prototype.description = "Открывающая кавычка";

    OpenQuote.prototype.version = '0.0.0';

    OpenQuote.prototype.configName = 'open_quote';

    OpenQuote.prototype.text = '';

    OpenQuote.prototype.config = {
      on: true,
      log: false,
      debug: false
    };


    /*
    Конструктор
    @param opt[object]
    - Lib[Object] обязательно
    - text[String] строка
     */

    function OpenQuote(opt) {
      var _ref;
      this.opt = opt;
      if ((_ref = this.opt.config) != null ? _ref[this.configName] : void 0) {
        this.config = this.opt.config[this.configName];
      }
      if (this.opt.Lib) {
        this.Lib = this.opt.Lib;
      } else {
        this.logger('error', 'No lib');
      }
      if (this.opt.text) {
        this.text = this.opt.text;
      }
      this;
    }


    /*
    Логер
    @param level[string] error|warning|info| debug
    @param message[string] сообщение
    @param obj[obj] object ошибки
     */

    OpenQuote.prototype.logger = function(level, message, obj) {
      if (!this.config.log) {
        return;
      }
      if (level === 'error') {
        throw new Error(message);
      }
      if (level === 'warning' || level === 'info') {
        console.log(new Date(+(" " + level + ": " + message)));
      }
      if (level === 'debug') {
        console.log("" + level + ": " + message, obj);
      }
      return this;
    };


    /*
    Debug
    @param level[string] error|warning|info
    @param message[string] сообщение
    @param obj[obj] object ошибки
     */

    OpenQuote.prototype.debug = function(obj) {
      if (!this.config.debug) {
        return;
      }
      this.logger('debug', this.configName, obj);
      return this;
    };

    OpenQuote.prototype.multiply = function() {
      var start;
      start = new Date().getTime();
      while (this.replace()) {
        this.used += 1;
        if (this.used > 4096) {
          break;
        }
      }
      this.profiling = new Date().getTime() - start;
      return this;
    };

    OpenQuote.prototype.apply = function() {
      if (!this.config.on) {
        return;
      }
      return this.multiply();
    };

    OpenQuote.prototype.replace = function() {
      var m, re, self, str;
      self = this;
      re = /(^|\(|\s|\>|-)(\"|\\\")(\S+)/i;
      m = this.text.match(re);
      if (m) {
        str = m[1] + this.Lib.QUOTE_FIRS_OPEN + m[3];
        this.text = this.text.replace(re, str);
      }
      return !!m;
    };


    /*
    Создание защищенного тега с содержимым
    
    @see  EMT_lib::build_safe_tag
    @param  [string] $content
    @param  [string] $tag
    @param  [array] $attribute
    @return   [string]
     */

    OpenQuote.prototype.tag = function(content, tag, attribute) {
      var classname, layout, style_inline, _ref;
      if (attribute == null) {
        attribute = {};
      }
      classname = '';
      if (tag == null) {
        tag = 'span';
      }
      if (attribute["class"]) {
        classname = attribute["class"];
      }
      if (classname === "nowrap") {
        if (!this.is_on('nowrap')) {
          tag = "nobr";
          attribute = {};
        }
      }
      if ((_ref = this.classes) != null ? _ref[classname] : void 0) {
        style_inline = this.classes[classname];
      }
      if (style_inline) {
        attribute['__style'] = style_inline;
      }
      if (this.class_layout_prefix) {
        classname = this.class_layout_prefix + classname;
      }
      attribute["class"] = classname;
      if (this.use_layout) {
        layout = this.use_layout;
      }
      return this.Lib.build_safe_tag(content, tag, attribute, layout);
    };


    /*
    Создание тега с содержимым
    
    @see  EMT_lib::build_safe_tag
    @param  [string] $content
    @param  [string] $tag
    @param  [array] $attribute
    @return   [string]
     */

    OpenQuote.prototype.ntag = function(content, tag, attributes) {
      var attribute, classname, param;
      if (attributes == null) {
        attributes = {};
      }
      classname = '';
      if (tag == null) {
        tag = 'span';
      }
      param = '';
      for (attribute in attributes) {
        param = " " + attribute + "='" + attributes[attribute] + "'";
      }
      return "<" + tag + param + ">" + content + "</" + tag + ">";
    };

    return OpenQuote;

  })();

  module.exports = OpenQuote;

  if (typeof window !== 'undefined') {
    App.Rules['open_quote'] = OpenQuote;
  }


  /*
  Правило "Открывающая кавычка"
  используется как объект расширения для остальных правил
   */

  OpenQuote = (function() {
    OpenQuote.prototype.used = 0;

    OpenQuote.prototype.timer = 0;

    OpenQuote.prototype.description = "Открывающая кавычка";

    OpenQuote.prototype.version = '0.0.0';

    OpenQuote.prototype.configName = 'open_quote';

    OpenQuote.prototype.text = '';

    OpenQuote.prototype.config = {
      on: true,
      log: false,
      debug: false
    };


    /*
    Конструктор
    @param opt[object]
    - Lib[Object] обязательно
    - text[String] строка
     */

    function OpenQuote(opt) {
      var _ref;
      this.opt = opt;
      if ((_ref = this.opt.config) != null ? _ref[this.configName] : void 0) {
        this.config = this.opt.config[this.configName];
      }
      if (this.opt.Lib) {
        this.Lib = this.opt.Lib;
      } else {
        this.logger('error', 'No lib');
      }
      if (this.opt.text) {
        this.text = this.opt.text;
      }
      this;
    }


    /*
    Логер
    @param level[string] error|warning|info| debug
    @param message[string] сообщение
    @param obj[obj] object ошибки
     */

    OpenQuote.prototype.logger = function(level, message, obj) {
      if (!this.config.log) {
        return;
      }
      if (level === 'error') {
        throw new Error(message);
      }
      if (level === 'warning' || level === 'info') {
        console.log(new Date(+(" " + level + ": " + message)));
      }
      if (level === 'debug') {
        console.log("" + level + ": " + message, obj);
      }
      return this;
    };


    /*
    Debug
    @param level[string] error|warning|info
    @param message[string] сообщение
    @param obj[obj] object ошибки
     */

    OpenQuote.prototype.debug = function(obj) {
      if (!this.config.debug) {
        return;
      }
      this.logger('debug', this.configName, obj);
      return this;
    };

    OpenQuote.prototype.multiply = function() {
      var start;
      start = new Date().getTime();
      while (this.replace()) {
        this.used += 1;
      }
      this.profiling = new Date().getTime() - start;
      return this;
    };

    OpenQuote.prototype.apply = function() {
      if (!this.config.on) {
        return;
      }
      return this.multiply();
    };

    OpenQuote.prototype.replace = function() {
      var m, re, self, str;
      self = this;
      re = /(^|\(|\s|\>|-)(\"|\\\")(\S+)/i;
      m = this.text.match(re);
      if (m) {
        str = m[1] + this.Lib.QUOTE_FIRS_OPEN + m[3];
        this.text = this.text.replace(re, str);
      }
      return !!m;
    };


    /*
    Создание защищенного тега с содержимым
    
    @see  EMT_lib::build_safe_tag
    @param  [string] $content
    @param  [string] $tag
    @param  [array] $attribute
    @return   [string]
     */

    OpenQuote.prototype.tag = function(content, tag, attribute) {
      var classname, layout, style_inline, _ref;
      if (attribute == null) {
        attribute = {};
      }
      classname = '';
      if (tag == null) {
        tag = 'span';
      }
      if (attribute["class"]) {
        classname = attribute["class"];
      }
      if (classname === "nowrap") {
        if (!this.is_on('nowrap')) {
          tag = "nobr";
          attribute = {};
        }
      }
      if ((_ref = this.classes) != null ? _ref[classname] : void 0) {
        style_inline = this.classes[classname];
      }
      if (style_inline) {
        attribute['__style'] = style_inline;
      }
      if (this.class_layout_prefix) {
        classname = this.class_layout_prefix + classname;
      }
      attribute["class"] = classname;
      if (this.use_layout) {
        layout = this.use_layout;
      }
      return this.Lib.build_safe_tag(content, tag, attribute, layout);
    };


    /*
    Создание тега с содержимым
    
    @see  EMT_lib::build_safe_tag
    @param  [string] $content
    @param  [string] $tag
    @param  [array] $attribute
    @return   [string]
     */

    OpenQuote.prototype.ntag = function(content, tag, attributes) {
      var attribute, classname, param;
      if (attributes == null) {
        attributes = {};
      }
      classname = '';
      if (tag == null) {
        tag = 'span';
      }
      param = '';
      for (attribute in attributes) {
        param = " " + attribute + "='" + attributes[attribute] + "'";
      }
      return "<" + tag + param + ">" + content + "</" + tag + ">";
    };

    return OpenQuote;

  })();

  module.exports = OpenQuote;

  if (typeof window !== 'undefined') {
    App.Rules['open_quote'] = OpenQuote;
  }


  /*
   *# Групповой Объект правил "Кавычки"
  используется как объект расширения для остальных груп правил
   */

  Quote = (function() {
    Quote.prototype.description = "Кавычки";

    Quote.prototype.version = '0.0.0';

    Quote.prototype.configName = 'Quote';

    Quote.prototype.config = {
      on: true,
      log: false,
      debug: false
    };

    Quote.prototype.rules = [];

    Quote.prototype.order = ["quotes_outside_a", "open_quote", "close_quote", "close_quote_adv", "open_quote_adv", "quotation"];


    /*
    Конструктор
    - Настраивает конфиг
    - Замыкает на себя text
    - Создает список правил согласно прядка
    
    @param opt[object]
    - Lib[Object] обязательно
    - text[String] строка
     */

    function Quote(opt) {
      var ruleName, _i, _len, _ref, _ref1;
      this.opt = opt;
      if ((_ref = this.opt.config) != null ? _ref[this.configName] : void 0) {
        this.config = this.opt.config[this.configName];
      }
      if (this.opt.Rules) {
        this.Rules = this.opt.Rules;
      }
      if (!this.config.on) {
        return;
      }
      if (this.opt.Lib) {
        this.Lib = this.opt.Lib;
      } else {
        this.logger('error', 'No lib');
      }
      if (this.opt.text) {
        this.text = this.opt.text;
      }
      _ref1 = this.order;
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        ruleName = _ref1[_i];
        if (this.Rules[ruleName]) {
          this.rules.push(new this.Rules[ruleName]({
            Lib: this.Lib
          }));
        }
      }
      this;
    }

    Quote.prototype.apply = function() {
      var rule, _i, _len, _ref, _results;
      if (!this.config.on) {
        return;
      }
      _ref = this.rules;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        rule = _ref[_i];
        rule.text = this.text;
        rule.apply();
        _results.push(this.text = rule.text);
      }
      return _results;
    };

    return Quote;

  })();

  module.exports = Quote;

  if (typeof window !== 'undefined') {
    App.Rules.Quote = Quote;
  }


  /*
   *# Групповой Объект правил "Кавычки"
  используется как объект расширения для остальных груп правил
   */

  Quote = (function() {
    Quote.prototype.description = "Кавычки";

    Quote.prototype.version = '0.0.0';

    Quote.prototype.configName = 'Quote';

    Quote.prototype.config = {
      on: true,
      log: false,
      debug: false
    };

    Quote.prototype.rules = [];

    Quote.prototype.order = ["open_quote", "close_quote"];


    /*
    Конструктор
    - Настраивает конфиг
    - Замыкает на себя text
    - Создает список правил согласно прядка
    
    @param opt[object]
    - Lib[Object] обязательно
    - text[String] строка
     */

    function Quote(opt) {
      var ruleName, _i, _len, _ref, _ref1;
      this.opt = opt;
      if ((_ref = this.opt.config) != null ? _ref[this.configName] : void 0) {
        this.config = this.opt.config[this.configName];
      }
      if (this.opt.Rules) {
        this.Rules = this.opt.Rules;
      }
      if (!this.config.on) {
        return;
      }
      if (this.opt.Lib) {
        this.Lib = this.opt.Lib;
      } else {
        this.logger('error', 'No lib');
      }
      if (this.opt.text) {
        this.text = this.opt.text;
      }
      _ref1 = this.order;
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        ruleName = _ref1[_i];
        if (this.Rules[ruleName]) {
          this.rules.push(new this.Rules[ruleName]({
            Lib: this.Lib
          }));
        }
      }
      this;
    }

    Quote.prototype.apply = function() {
      var rule, _i, _len, _ref, _results;
      if (!this.config.on) {
        return;
      }
      _ref = this.rules;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        rule = _ref[_i];
        rule.text = this.text;
        rule.apply();
        _results.push(this.text = rule.text);
      }
      return _results;
    };

    return Quote;

  })();

  module.exports = Quote;

  if (typeof window !== 'undefined') {
    App.Rules.Quote = Quote;
  }

  if (!Quote) {
    Quote = require('./quote');
  }


  /*
  Групповой Объект правил Сокращения
   */

  Abbr = (function(_super) {
    __extends(Abbr, _super);

    function Abbr() {
      return Abbr.__super__.constructor.apply(this, arguments);
    }

    Abbr.prototype.description = "Сокращения";

    Abbr.prototype.version = '0.0.0';

    Abbr.prototype.configName = 'Abbr';

    Abbr.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    Abbr.prototype.rules = [];

    Abbr.prototype.order = ["nobr_acronym", "nobr_sm_im", "nobr_locations", "nbsp_before_unit", "nbsp_before_weight_unit", "nobr_before_unit_volt", "nbsp_org_abbr", "nobr_abbreviation", "ps_pps", "nobr_vtch_itd_itp", "nbsp_money_abbr", "nobr_gost", "nbsp_in_the_end", "nbsp_te"];

    return Abbr;

  })(Quote);

  module.exports = Abbr;

  if (typeof window !== 'undefined') {
    App.Rules.Abbr = Abbr;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило Акцент AcuteAccent
   */

  AcuteAccent = (function(_super) {
    __extends(AcuteAccent, _super);

    function AcuteAccent() {
      return AcuteAccent.__super__.constructor.apply(this, arguments);
    }

    AcuteAccent.prototype.description = 'Акцент';

    AcuteAccent.prototype.version = '0.0.0';

    AcuteAccent.prototype.configName = 'acute_accent';

    AcuteAccent.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([уеыаоэяиюё])\`([а-яё])/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + "&#769;" + m[2]);
      }
      return !!m;
    };

    return AcuteAccent;

  })(OpenQuote);

  module.exports = AcuteAccent;

  if (typeof window !== 'undefined') {
    App.Rules['acute_accent'] = AcuteAccent;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Расстановка правильного апострофа в текстах';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'apostrophe';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\s|^|\>|\&rsquo\;)([a-zа-яё]{1,})\'([a-zа-яё]+)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + m[2] + "&rsquo;" + m[3]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['apostrophe'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Замена стрелок вправо-влево на html коды';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'arrows_symbols';

    Rule.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/(\s|\>|\&nbsp\;|^)\-\>($|\s|\&nbsp\;|\<)/, /(\s|\>|\&nbsp\;|^|;)\<\-(\s|\&nbsp\;|$)/, /→/, /←/];
      res = [
        function(m) {
          return "" + m[1] + "&rarr;" + m[2];
        }, function(m) {
          return "" + m[1] + "&rarr;" + m[2];
        }, function(m) {
          return '&rarr;';
        }, function(m) {
          return '&larr;';
        }
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['arrows_symbols'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило
   */

  AutoComma = (function(_super) {
    __extends(AutoComma, _super);

    function AutoComma() {
      return AutoComma.__super__.constructor.apply(this, arguments);
    }

    AutoComma.prototype.description = 'Расстановка запятых перед а, но';

    AutoComma.prototype.version = '0.0.0';

    AutoComma.prototype.configName = 'auto_comma';

    AutoComma.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([a-zа-яё])(\s|&nbsp;)(но|а)(\s|&nbsp;)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + "," + m[2] + m[3] + m[4]);
      }
      return !!m;
    };

    return AutoComma;

  })(OpenQuote);

  module.exports = AutoComma;

  if (typeof window !== 'undefined') {
    App.Rules['auto_comma'] = AutoComma;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Выделение ссылок из текста';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'auto_links';

    Rule.prototype.replace = function() {
      var idx, m, pntM4, re, rex, str, subM4, _i, _len;
      rex = [/(\s|^)(http|ftp|mailto|https)(:\/\/)([^\s\,\!\<]{4,})(\s|\.|\,|\!|\?|\<|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        subM4 = m[4].substr(-1);
        pntM4 = (subM4 === "." ? '.' : m[4]);
        str = m[1] + this.ntag(pntM4, "a", {
          href: m[2] + m[3] + pntM4
        }) + (m[4].substr(-1) === "." ? "." : "") + m[5];
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['auto_links'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Замена x на символ × в размерных единицах';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'auto_times_x';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/(\d+)(x|х)(\d+)(x|х)(\d+)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = [m[1], "&times;", m[3], "&times;", m[5]].join('');
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['auto_times_x'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Пробел после запятой';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'autospace_after_comma';

    Rule.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/(\040|\t|\&nbsp\;)\,([а-яёa-z0-9])/i, /([0-9])\,([а-яёa-z0-9])/i];
      res = [
        function(m) {
          return ", " + m[2];
        }, function(m) {
          return "" + m[1] + ", " + m[2];
        }
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['autospace_after_comma'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Пробел после точки';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'autospace_after_dot';

    Rule.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/(\040|\t|\&nbsp\;|^)([a-zа-яё0-9]+)(\040|\t|\&nbsp\;)?\.([а-яёa-z]{4,})/i, /(\040|\t|\&nbsp\;|^)([a-zа-яё0-9]+)\.([а-яёa-z]{1,3})/i];
      res = [
        function(m) {
          return "" + m[1] + m[2] + ". " + m[4];
        }, (function(_this) {
          return function(m) {
            var _ref;
            return m[1] + m[2] + "." + ((_ref = _this.Lib.strtolower(m[3]), __indexOf.call(_this.Lib.domain_zones, _ref) >= 0) ? '\\' : " ") + m[3];
          };
        })(this)
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['autospace_after_dot'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Пробел после знаков троеточий с вопросительным или восклицательными знаками';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'autospace_after_hellips';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([\?\!]\.\.)([а-яёa-z])/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + " " + m[2]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['autospace_after_hellips'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Пробел после знаков пунктуации, кроме точки';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'autospace_after_pmarks';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\040|\t|\&nbsp\;|^|\n)([a-zа-яё0-9]+)(\040|\t|\&nbsp\;)?(\:|\)|\,|\&hellip\;|(?:\!|\?)+)([а-яёa-z])/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + m[2] + m[4] + " " + m[5]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['autospace_after_pmarks'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Тире между диапазоном веков';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'century_period';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/(\040|\t|\&nbsp\;|^)([XIV]{1,5})(-|\&mdash\;)([XIV]{1,5})(( |\&nbsp\;)?(в\.в\.|вв\.|вв|в\.|в))/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = m[1] + this.ntag(m[2] + "&mdash;" + m[4] + " вв.", "span", {
          "class": "nowrap"
        });
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['century_period'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Удаление пробела перед символом процента';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'clear_percent';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\d+)([\t\040]+)\%/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + "%");
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['clear_percent'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = "Закрывающая кавычка";

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'close_quote';

    Rule.prototype.apply = function() {
      var m, re, self;
      self = this;
      re = /([a-zа-яё0-9]|\.|\&hellip\;|\!|\?|\>|\)|\:)(\"+)(\.|\&hellip\;|\;|\:|\?|\!|\,|\s|\)|\<\/|$)/i;
      m = this.text.match(re);
      if (m) {
        this.text = this.text.replace(re, function(str) {
          self.debug(str);
          self.debug(m);
          return m[1] + self.Lib.QUOTE_FIRS_CLOSE + m[3];
        });
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['close_quote'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
   *# Правило "Закрывающая кавычка особые случаи"
   */

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = "Закрывающая кавычка особые случаи";

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'close_quote_adv';

    Rule.prototype.apply = function() {
      var debug, re, self;
      if (this.config.on) {
        return;
      }
      self = this;
      debug = this.config.debug;
      re = /([a-zа-яё0-9]|\.|\&hellip\;|\!|\?|\>|\)|\:)((\"|\\\"|\&laquo\;)+)(\<[^\>]+\>)(\.|\&hellip\;|\;|\:|\?|\!|\,|\)|\<\/|$| )/i;
      this.text = this.text.replace(re, function(str) {
        var cnt, m, str_repeat;
        if (debug) {
          self.debug(str);
        }
        m = str.match(re);
        if (debug) {
          self.debug(m);
        }
        cnt = substr_count(m[2], "\"");
        cnt += substr_count(m[2], "&laquo;");
        str_repeat = this.Lib.repeat(this.Lib.QUOTE_FIRS_CLOSE, cnt);
        return m[1] + str_repeat + m[4] + m[5];
      });
      re(new RegExp(['/([a-zа-яё0-9]|\.|\&hellip\;|\!|\?|\>|\)|\:)', '(\s+)((\"|\\\")+)(\s+)', '(\.|\&hellip\;|\;|\:|\?|\!|\,|\)|\<\/|$| )/'].join('', 'i')));
      this.text = this.text.replace(re, function(str) {
        var cnt, m, str_repeat;
        if (debug) {
          self.debug(str);
        }
        m = str.match(re);
        if (debug) {
          self.debug(m);
        }
        cnt = substr_count(m[3], "\"");
        cnt += substr_count(m[3], "&laquo;");
        str_repeat = this.Lib.repeat(this.Lib.QUOTE_FIRS_CLOSE, cnt);
        return m[1] + m[2] + str_repeat + m[5] + m[6];
      });
      re = /\>(\&laquo\;)\.($|\s|\<)/i;
      this.text = this.text.replace(re, function(str) {
        var m;
        if (debug) {
          self.debug(str);
        }
        m = str.match(re);
        if (debug) {
          self.debug(m);
        }
        return '>&raquo;' + m[2];
      });
      re = /\>(\&laquo\;)\.($|\s|\<)/i;
      this.text = this.text.replace(re, function(str) {
        var m;
        if (debug) {
          self.debug(str);
        }
        m = str.match(re);
        if (debug) {
          self.debug(m);
        }
        return '>&raquo;' + m[2];
      });
      return this;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['close_quote_adv'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Замена (c) на символ копирайт';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'copy_replace';

    Rule.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/\((c|с)\)\s+/i, /\((c|с)\)($|\.|,|!|\?)/i];
      res = [
        function(m) {
          return '&copy;&nbsp;';
        }, function(m) {
          return "&copy;" + m[2];
        }
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['copy_replace'] = Rule;
  }

  if (!Quote) {
    Quote = require('./quote');
  }


  /*
   *# Групповой Объект правил "Сокращения"
   */

  Dash = (function(_super) {
    __extends(Dash, _super);

    function Dash() {
      return Dash.__super__.constructor.apply(this, arguments);
    }

    Dash.prototype.description = "Дефисы и тире";

    Dash.prototype.version = '0.0.0';

    Dash.prototype.configName = 'Dash';

    Dash.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    Dash.prototype.rules = [];

    Dash.prototype.order = ["mdash_2_html", "mdash", "mdash_2", "mdash_3", "iz_za_pod", "to_libo_nibud", "koe_kak", "ka_de_kas"];

    return Dash;

  })(Quote);

  module.exports = Dash;

  if (typeof window !== 'undefined') {
    App.Rules['Dash'] = Dash;
  }

  if (!Quote) {
    Quote = require('./quote');
  }


  /*
   *# Групповой Объект правил "Сокращения"
   */

  EmtDate = (function(_super) {
    __extends(EmtDate, _super);

    function EmtDate() {
      return EmtDate.__super__.constructor.apply(this, arguments);
    }

    EmtDate.prototype.description = "Даты и дни";

    EmtDate.prototype.version = '0.0.0';

    EmtDate.prototype.configName = 'EmtDate';

    EmtDate.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    EmtDate.prototype.rules = [];

    EmtDate.prototype.order = ['years', 'mdash_month_interval', 'space_posle_goda', 'nbsp_posle_goda_abbr', 'nobr_year_in_date'];

    return EmtDate;

  })(Quote);

  module.exports = EmtDate;

  if (typeof window !== 'undefined') {
    App.Rules['EmtDate'] = EmtDate;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Градусы по Фаренгейту';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'degree_f';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/([0-9]+)F($|\s|\.|\,|\;|\:|\&nbsp\;|\?|\!)/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = "" + this.ntag(m[1] + " &deg;F", "span", {
          "class": "nowrap"
        }) + m[2];
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['degree_f'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило DotOnEnd
  
  Точка в конце текста, если её там нет
   */

  DotOnEnd = (function(_super) {
    __extends(DotOnEnd, _super);

    function DotOnEnd() {
      return DotOnEnd.__super__.constructor.apply(this, arguments);
    }

    DotOnEnd.prototype.description = 'Точка в конце текста, если её там нет';

    DotOnEnd.prototype.version = '0.0.0';

    DotOnEnd.prototype.configName = 'dot_on_end';

    DotOnEnd.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([a-zа-яё0-9])(|\040|\t|\&nbsp\;)*$/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + ".");
      }
      return !!m;
    };

    return DotOnEnd;

  })(OpenQuote);

  module.exports = DotOnEnd;

  if (typeof window !== 'undefined') {
    App.Rules['dot_on_end'] = DotOnEnd;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Выделение эл. почты из текста';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'email';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, tag, _i, _len;
      rex = [/(\s|^|\&nbsp\;|\()([a-z0-9\-\_\.]{2,})\@([a-z0-9\-\.]{2,})\.([a-z]{2,6})(\)|\s|\.|\,|\!|\?|$|\<)/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        tag = this.ntag(m[2] + "@" + m[3] + "." + m[4], "a", {
          href: "mailto:" + m[2] + "@" + m[3] + "." + m[4]
        });
        this.text = this.text.replace(m[0], m[1] + tag + m[5]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['email'] = Rule;
  }

  if (!Quote) {
    Quote = require('./quote');
  }


  /*
   *# Групповой Объект правил "Сокращения"
   */

  Etc = (function(_super) {
    __extends(Etc, _super);

    function Etc() {
      return Etc.__super__.constructor.apply(this, arguments);
    }

    Etc.prototype.description = "Прочее";

    Etc.prototype.version = '0.0.0';

    Etc.prototype.configName = 'EmtDate';

    Etc.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    Etc.prototype.rules = [];

    Etc.prototype.order = ['acute_accent', 'word_sup', 'century_period', 'time_interval'];

    return Etc;

  })(Quote);

  module.exports = Etc;

  if (typeof window !== 'undefined') {
    App.Rules['Etc'] = Etc;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Символ евро';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'euro_symbol';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/€/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], '&euro;');
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['euro_symbol'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Удаление nbsp в nobr/nowrap тэгах';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'expand_no_nbsp_in_nobr';

    Rule.prototype.replace = function() {};

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['expand_no_nbsp_in_nobr'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило FixBrackets
  
  Лишние пробелы после открывающей скобочки и перед закрывающей
   */

  FixBrackets = (function(_super) {
    __extends(FixBrackets, _super);

    function FixBrackets() {
      return FixBrackets.__super__.constructor.apply(this, arguments);
    }

    FixBrackets.prototype.description = 'Лишние пробелы после открывающей скобочки и перед закрывающей';

    FixBrackets.prototype.version = '0.0.0';

    FixBrackets.prototype.configName = 'fix_brackets';

    FixBrackets.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/(\()(\040|\t)+/, /(\040|\t)+(\))/];
      res = [
        function(m) {
          return "" + m[1];
        }, function(m) {
          return "" + m[2];
        }
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return FixBrackets;

  })(OpenQuote);

  module.exports = FixBrackets;

  if (typeof window !== 'undefined') {
    App.Rules['fix_brackets'] = FixBrackets;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило FixBracketsSpace
  
  Пробел перед открывающей скобочкой
   */

  FixBracketsSpace = (function(_super) {
    __extends(FixBracketsSpace, _super);

    function FixBracketsSpace() {
      return FixBracketsSpace.__super__.constructor.apply(this, arguments);
    }

    FixBracketsSpace.prototype.description = 'Пробел перед открывающей скобочкой';

    FixBracketsSpace.prototype.version = '0.0.0';

    FixBracketsSpace.prototype.configName = 'fix_brackets_space';

    FixBracketsSpace.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([a-zа-яё0-9])(\()/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + " " + m[2]);
      }
      return !!m;
    };

    return FixBracketsSpace;

  })(OpenQuote);

  module.exports = FixBracketsSpace;

  if (typeof window !== 'undefined') {
    App.Rules['fix_brackets_space'] = FixBracketsSpace;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило FixExclQuestMarks
  
  Замена восклицательного и вопросительного знаков местами
   */

  FixExclQuestMarks = (function(_super) {
    __extends(FixExclQuestMarks, _super);

    function FixExclQuestMarks() {
      return FixExclQuestMarks.__super__.constructor.apply(this, arguments);
    }

    FixExclQuestMarks.prototype.description = 'Замена восклицательного и вопросительного знаков местами';

    FixExclQuestMarks.prototype.version = '0.0.0';

    FixExclQuestMarks.prototype.configName = 'fix_excl_quest_marks';

    FixExclQuestMarks.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([a-zа-яё0-9])\!\?(\s|$|\<)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + "?!" + m[2]);
      }
      return !!m;
    };

    return FixExclQuestMarks;

  })(OpenQuote);

  module.exports = FixExclQuestMarks;

  if (typeof window !== 'undefined') {
    App.Rules['fix_excl_quest_marks'] = FixExclQuestMarks;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило FixPmarks
  
  Замена сдвоенных знаков препинания на одинарные
   */

  FixPmarks = (function(_super) {
    __extends(FixPmarks, _super);

    function FixPmarks() {
      return FixPmarks.__super__.constructor.apply(this, arguments);
    }

    FixPmarks.prototype.description = 'Замена сдвоенных знаков препинания на одинарные';

    FixPmarks.prototype.version = '0.0.0';

    FixPmarks.prototype.configName = 'fix_pmarks';

    FixPmarks.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/([^\!\?])\.\./, /([a-zа-яё0-9])(\!|\.)(\!|\.|\?)(\s|$|\<)/i, /([a-zа-яё0-9])(\?)(\?)(\s|$|\<)/i];
      res = [
        function(m) {
          return "" + m[1] + ".";
        }, function(m) {
          return "" + m[1] + m[2] + m[4];
        }, function(m) {
          return "" + m[1] + m[2] + m[4];
        }
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return FixPmarks;

  })(OpenQuote);

  module.exports = FixPmarks;

  if (typeof window !== 'undefined') {
    App.Rules['fix_pmarks'] = FixPmarks;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило Hellip
  
  Замена трех точек на знак многоточия
   */

  Hellip = (function(_super) {
    __extends(Hellip, _super);

    function Hellip() {
      return Hellip.__super__.constructor.apply(this, arguments);
    }

    Hellip.prototype.description = 'Замена трех точек на знак многоточия';

    Hellip.prototype.version = '0.0.0';

    Hellip.prototype.configName = 'hellip';

    Hellip.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/\.\.\./i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "&hellip;");
      }
      return !!m;
    };

    return Hellip;

  })(OpenQuote);

  module.exports = Hellip;

  if (typeof window !== 'undefined') {
    App.Rules['hellip'] = Hellip;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Обрамление пятисимвольных слов разделенных дефисом в неразрывные блоки';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'hyphen_nowrap';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\&nbsp\;|\s|\>|^)([a-zа-яё]{1}\-[a-zа-яё]{4}|[a-zа-яё]{2}\-[a-zа-яё]{3}|[a-zа-яё]{3}\-[a-zа-яё]{2}|[a-zа-яё]{4}\-[a-zа-яё]{1}|когда\-то|кое\-как|кой\-кого|вс[её]\-таки|[а-яё]+\-(кась|ка|де))(\s|\.|\,|\!|\?|\&nbsp\;|\&hellip\;|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        return this.text = this.text.replace(m[0], "" + m[1] + m[2] + "&nbsp;" + m[4] + "C" + m[6]);
      }
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['hyphen_nowrap'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Обрамление пятисимвольных слов разделенных дефисом в неразрывные блоки';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'nbsp_celcius';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\&nbsp\;|\s|\>|^)([a-zа-яё]{1}\-[a-zа-яё]{4}|[a-zа-яё]{2}\-[a-zа-яё]{3}|[a-zа-яё]{3}\-[a-zа-яё]{2}|[a-zа-яё]{4}\-[a-zа-яё]{1}|когда\-то|кое\-как|кой\-кого|вс[её]\-таки|[а-яё]+\-(кась|ка|де))(\s|\.|\,|\!|\?|\&nbsp\;|\&hellip\;|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        return this.text = this.text.replace(m[0], "" + m[1] + m[2] + "&nbsp;" + m[4] + "C" + m[6]);
      }
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_celcius'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Объединение IP-адресов';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'ip_address';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, strIp, _i, _len;
      rex = [/(\s|\&nbsp\;|^)(\d{0,3}\.\d{0,3}\.\d{0,3}\.\d{0,3})/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        strIp = this.nowrap_ip_address(m[2]);
        if (strIp) {
          this.text = this.text.replace(m[0], strIp);
        } else {
          return false;
        }
      }
      return !!m;
    };

    Rule.prototype.nowrap_ip_address = function(ip) {
      var triad, triads, _i, _len, _ref;
      triads = ip.split('.');
      for (_i = 0, _len = triads.length; _i < _len; _i++) {
        triad = triads[_i];
        if (!((0 <= (_ref = parseInt(triad)) && _ref <= 255))) {
          return false;
        }
      }
      return this.ntag(triads.join('.'), 'span', {
        "class": "nowrap"
      });
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['ip_address'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Расстановка дефисов между из-за, из-под';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'iz_za_pod';

    Rule.prototype.replace = function() {
      var m, re, self;
      self = this;
      re = /(\s|\&nbsp\;|\>|^)(из)(\040|\t|\&nbsp\;)\-?(за|под)([\.\,\!\?\:\;]|\040|\&nbsp\;)/i;
      m = this.text.match(re);
      if (m) {
        this.text = this.text.replace(re, function(str) {
          var reStr;
          self.debug(str);
          self.debug(m);
          reStr = '';
          if (m[1] !== "&nbsp;") {
            reStr += m[1];
          }
          reStr += "" + m[2] + "-" + m[4];
          if (m[5] !== "&nbsp;") {
            return reStr += m[5];
          }
        });
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['iz_za_pod'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Расстановка дефисов с частицами ка, де, кась';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'ka_de_kas';

    Rule.prototype.replace = function() {
      var m, re, reStr, rex, self, use, _i, _len;
      self = this;
      use = 0;
      rex = [/(\s|^|\&nbsp\;|\>)([а-яё]+)(\040|\t|\&nbsp\;)(ка)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i, /(\s|^|\&nbsp\;|\>)([а-яё]+)(\040|\t|\&nbsp\;)(де)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i, /(\s|^|\&nbsp\;|\>)([а-яё]+)(\040|\t|\&nbsp\;)(кась)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i];
      for (_i = 0, _len = rex.length; _i < _len; _i++) {
        re = rex[_i];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        reStr = '';
        if (m[1] !== "&nbsp;") {
          reStr += m[1];
        }
        reStr += "" + m[2] + "-" + m[4];
        if (m[5] !== "&nbsp;") {
          reStr += m[5];
        }
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['ka_de_kas'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Кое-как, кой-кого, все-таки';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'koe_kak';

    Rule.prototype.replace = function() {
      var m, re, reStr, rex, self, use, _i, _len;
      self = this;
      use = 0;
      rex = [/(\s|^|\&nbsp\;|\>)(кое)\-?(\040|\t|\&nbsp\;)\-?(как)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i, /(\s|^|\&nbsp\;|\>)(кой)\-?(\040|\t|\&nbsp\;)\-?(кого)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i, /(\s|^|\&nbsp\;|\>)(вс[её])\-?(\040|\t|\&nbsp\;)\-?(таки)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i];
      for (_i = 0, _len = rex.length; _i < _len; _i++) {
        re = rex[_i];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        reStr = '';
        if (m[1] !== "&nbsp;") {
          reStr += m[1];
        }
        reStr += "" + m[2] + "-" + m[4];
        if (m[5] !== "&nbsp;") {
          reStr += m[5];
        }
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['koe_kak'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Удаление лишних пробельных символов и табуляций';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'many_spaces_to_one';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\s\s|\t\s|\t\t|\s\t)+/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], ' ');
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['many_spaces_to_one'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Математические знаки больше/меньше/плюс минус/неравно';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'math_chars';

    Rule.prototype.replace = function() {
      var idx, m, re, rep, rex, _i, _len;
      rex = [/!=/, /\<=/, /([^=]|^)\>=/, /~=/, /\+-/];
      rep = [
        function(m) {
          return '&ne;';
        }, function(m) {
          return '&le;';
        }, function(m) {
          return "m[1]&ge;";
        }, function(m) {
          return '&cong;';
        }, function(m) {
          return '&plusmn;';
        }
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], rep[idx](m));
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['math_chars'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = "Тире после кавычек, скобочек, пунктуации";

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'mdash';

    Rule.prototype.replace = function() {
      var m, re, self, use;
      self = this;
      use = true;
      re = /([a-zа-яё0-9]+|\,|\:|\)|\&(ra|ld)quo\;|\|\"|\>)(\040|\t)(—|\-|\&mdash\;)(\s|$|\<)/;
      m = this.text.match(re);
      if (m) {
        this.text = this.text.replace(re, function(str) {
          self.debug(str);
          self.debug(m);
          return m[1] + '&nbsp;&mdash;' + m[5];
        });
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['mdash'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Тире после переноса строки';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'mdash2';

    Rule.prototype.replace = function() {
      var m, re, self;
      self = this;
      re = /(\n|\r|^|\>)(\-|\&mdash\;)(\t|\040)/;
      m = this.text.match(re);
      if (m) {
        this.text = this.text.replace(re, function(str) {
          self.debug(str);
          self.debug(m);
          return m[1] + '&nbsp;&mdash;';
        });
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['mdash2'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Тире после знаков восклицания, троеточия и прочее';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'mdash3';

    Rule.prototype.replace = function() {
      var m, re, self;
      self = this;
      re = /(\.|\!|\?|\&hellip\;)(\040|\t|\&nbsp\;)(\-|\&mdash\;)(\040|\t|\&nbsp\;)/;
      m = this.text.match(re);
      if (m) {
        this.text = this.text.replace(re, function(str) {
          self.debug(str);
          self.debug(m);
          return m[1] + '&nbsp;&mdash;';
        });
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['mdash3'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = "Замена символа тире на html конструкцию";

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'mdash_2_html';

    Rule.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    Rule.prototype.replace = function() {
      var m;
      m = this.text.match(/-/);
      if (m) {
        this.text = this.text.replace(/-/, function() {
          return '&mdash;';
        });
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['mdash_2_html'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Расстановка тире и объединение в неразрывные периоды месяцев';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'mdash_month_interval';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/((январ|феврал|сентябр|октябр|ноябр|декабр)([ьяюе]|[её]м)|(апрел|июн|июл)([ьяюе]|ем)|(март|август)([ауе]|ом)?|ма[йяюе]|маем)\-((январ|феврал|сентябр|октябр|ноябр|декабр)([ьяюе]|[её]м)|(апрел|июн|июл)([ьяюе]|ем)|(март|август)([ауе]|ом)?|ма[йяюе]|маем)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + "&mdash;" + m[8]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['mdash_month_interval'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило MinusBetweenNums
  
  Расстановка знака минус между числами
   */

  MinusBetweenNums = (function(_super) {
    __extends(MinusBetweenNums, _super);

    function MinusBetweenNums() {
      return MinusBetweenNums.__super__.constructor.apply(this, arguments);
    }

    MinusBetweenNums.prototype.description = 'Расстановка знака минус между числами';

    MinusBetweenNums.prototype.version = '0.0.0';

    MinusBetweenNums.prototype.configName = 'minus_between_nums';

    MinusBetweenNums.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\d+)\-(\d)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        return this.text = this.text.replace(m[0], "" + m[1] + "&minus;" + m[2]);
      }
    };

    return MinusBetweenNums;

  })(OpenQuote);

  module.exports = MinusBetweenNums;

  if (typeof window !== 'undefined') {
    App.Rules['minus_between_nums'] = MinusBetweenNums;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Расстановка знака минус между диапозоном чисел';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'minus_in_numbers_range';

    Rule.prototype.replace = function() {};

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['minus_in_numbers_range'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Расстановка тире и объединение в неразрывные периоды дней';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'nbsp_and_dash_month_interval';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([^\>]|^)(\d+)(\-|\&minus\;|\&mdash\;)(\d+)( |\&nbsp\;)(января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря)([^\<]|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + "&mdash;" + m[8]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_and_dash_month_interval'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Неразрывный пробел в датах перед числом и месяцем';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'nbsp_before_month';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\d)(\s)+(января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря)([^\<]|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + "&nbsp;" + m[3] + m[4]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_before_month'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Неразрывный пробел перед открывающей скобкой';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'nbsp_before_open_quote';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(^|\s|\t|>)([a-zа-яё]{1,2})\s(\&laquo\;|\&bdquo\;)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + m[2] + "&nbsp;" + m[3]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_before_open_quote'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Неразрывный пробел перед частицей';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'nbsp_before_particle';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/(\040|\t)+(ли|бы|б|же|ж)(\&nbsp\;|\.|\,|\:|\;|\&hellip\;|\?|\s)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = "&nbsp;" + m[2];
        if (m[3] !== "&nbsp;") {
          str += m[3];
        }
        return this.text = this.text.replace(m[0], str);
      }
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_before_particle'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /* Правило NbspBeforeUnit
  Замена символов и привязка сокращений в весовых величинах: г, кг, мг…
   */

  NbspBeforeUnit = (function(_super) {
    __extends(NbspBeforeUnit, _super);

    function NbspBeforeUnit() {
      return NbspBeforeUnit.__super__.constructor.apply(this, arguments);
    }

    NbspBeforeUnit.prototype.description = 'Замена символов и привязка сокращений в весовых величинах: г, кг, мг…';

    NbspBeforeUnit.prototype.version = '0.0.0';

    NbspBeforeUnit.prototype.configName = 'nbsp_before_unit';

    NbspBeforeUnit.prototype.replace = function() {
      var idx, m, re, rex, strs, _i, _len;
      rex = [/(\s|^|\>|\&nbsp\;|\,)(\d+)(\s)?(м|мм|см|дм|км|гм|km|dm|cm|mm)(\s|\.|\!|\?|\,|$|\&plusmn\;|\;)/i, /(\s|^|\>|\&nbsp\;|\,)(\d+)(\s)?(м|мм|см|дм|км|гм|km|dm|cm|mm)([32]|&sup3;|&sup2;)(\s|\.|\!|\?|\,|$|\&plusmn\;|\;)/i];
      strs = [
        function(m) {
          return m[1] + m[2] + '&nbsp;' + m[4] + m[5];
        }, function(m) {
          var str, _ref;
          str = m[1] + m[2] + "&nbsp;" + m[4];
          if ((_ref = m[5]) === "3" || _ref === "2") {
            str += "&sup" + m[5] + ";";
          } else {
            str += m[5];
          }
          return str + m[6];
        }
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], strs[idx](m));
      }
      return !!m;
    };

    return NbspBeforeUnit;

  })(OpenQuote);

  module.exports = NbspBeforeUnit;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_before_unit'] = NbspBeforeUnit;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NbspBeforeWeightUnit
   */

  NbspBeforeWeightUnit = (function(_super) {
    __extends(NbspBeforeWeightUnit, _super);

    function NbspBeforeWeightUnit() {
      return NbspBeforeWeightUnit.__super__.constructor.apply(this, arguments);
    }

    NbspBeforeWeightUnit.prototype.description = 'Замена символов и привязка сокращений в весовых величинах: г, кг, мг…';

    NbspBeforeWeightUnit.prototype.version = '0.0.0';

    NbspBeforeWeightUnit.prototype.configName = 'nbsp_before_weight_unit';

    NbspBeforeWeightUnit.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\s|^|\>|\&nbsp\;|\,)(\d+)(\s)?(г|кг|мг|т)(\s|\.|\!|\?|\,|$|\&nbsp\;|\;)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + m[2] + "&nbsp;" + m[4] + m[5]);
      }
      return !!m;
    };

    return NbspBeforeWeightUnit;

  })(OpenQuote);

  module.exports = NbspBeforeWeightUnit;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_before_weight_unit'] = NbspBeforeWeightUnit;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Привязка градусов к числу';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'nbsp_celcius';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\s|^|\>|\&nbsp\;)(\d+)(\s)?(°|\&deg\;)(C|С)(\s|\.|\!|\?|\,|$|\&nbsp\;|\;)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        return this.text = this.text.replace(m[0], "" + m[1] + m[2] + "&nbsp;" + m[4] + "C" + m[6]);
      }
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_celcius'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NbspInTheEnd
  
  Привязка союзов и предлогов к предыдущим словам в случае конца предложения
   */

  NbspInTheEnd = (function(_super) {
    __extends(NbspInTheEnd, _super);

    function NbspInTheEnd() {
      return NbspInTheEnd.__super__.constructor.apply(this, arguments);
    }

    NbspInTheEnd.prototype.description = 'Привязка союзов и предлогов к предыдущим словам в случае конца предложения';

    NbspInTheEnd.prototype.version = '0.0.0';

    NbspInTheEnd.prototype.configName = 'nbsp_in_the_end';

    NbspInTheEnd.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([a-zа-яё0-9\-]{3,})\s([a-zа-яё]{1,2})\.(\s[A-ZА-ЯЁ]|$)/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + "&nbsp;" + m[2] + "." + m[3]);
      }
      return !!m;
    };

    return NbspInTheEnd;

  })(OpenQuote);

  module.exports = NbspInTheEnd;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_in_the_end'] = NbspInTheEnd;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
   Правило NbspMoneyAbbr
  
   Форматирование денежных сокращений (расстановка пробелов и привязка названия валюты к числу
   */

  NbspMoneyAbbr = (function(_super) {
    __extends(NbspMoneyAbbr, _super);

    function NbspMoneyAbbr() {
      return NbspMoneyAbbr.__super__.constructor.apply(this, arguments);
    }

    NbspMoneyAbbr.prototype.description = 'Форматирование денежных сокращений (расстановка пробелов и привязка названия валюты к числу)';

    NbspMoneyAbbr.prototype.version = '0.0.0';

    NbspMoneyAbbr.prototype.configName = 'nbsp_money_abbr';

    NbspMoneyAbbr.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/(\d)((\040|\s)?(тыс|млн|млрд)\.?(\040|\&nbsp\;)?)?(\040|\&nbsp\;)?(руб\.|долл\.|евро|€|&euro;|\$|у[\.]? ?е[\.]?)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = m[1] + (m[4] ? "&nbsp;" + m[4] + (m[4] === "тыс" ? '.' : '') : '') + "&nbsp;" + (m[7].match(/у[\\\\.]? ?е[\\\\.]?/i) ? "у.е." : m[7]);
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return NbspMoneyAbbr;

  })(OpenQuote);

  module.exports = NbspMoneyAbbr;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_money_abbr'] = NbspMoneyAbbr;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NbspOrgAbbr
   */

  NbspOrgAbbr = (function(_super) {
    __extends(NbspOrgAbbr, _super);

    function NbspOrgAbbr() {
      return NbspOrgAbbr.__super__.constructor.apply(this, arguments);
    }

    NbspOrgAbbr.prototype.description = 'Привязка сокращений форм собственности к названиям организаций';

    NbspOrgAbbr.prototype.version = '0.0.0';

    NbspOrgAbbr.prototype.configName = 'nbsp_org_abbr';

    NbspOrgAbbr.prototype.replace = function() {
      var idx, m, re, reStr, rex, _i, _len;
      rex = [/([^a-zA-Zа-яёА-ЯЁ]|^)(ООО|ЗАО|ОАО|НИИ|ПБОЮЛ)\s([a-zA-Zа-яёА-ЯЁ]|\"|\&laquo\;|\&bdquo\;|<)/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        reStr = m[1] + m[2] + '&nbsp;' + m[3];
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return NbspOrgAbbr;

  })(OpenQuote);

  module.exports = NbspOrgAbbr;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_org_abbr'] = NbspOrgAbbr;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Пробел после года';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'nbsp_posle_goda_abbr';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(^|\040|\&nbsp\;|\"|\&laquo\;)([0-9]{3,4})[ ]?(г\.)([^a-zа-яё]|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + m[2] + "&nbsp;" + m[3] + m[4]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_posle_goda_abbr'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NbspTe
  
  Обработка т.е.
   */

  NbspTe = (function(_super) {
    __extends(NbspTe, _super);

    function NbspTe() {
      return NbspTe.__super__.constructor.apply(this, arguments);
    }

    NbspTe.prototype.description = 'Обработка т.е.';

    NbspTe.prototype.version = '0.0.0';

    NbspTe.prototype.configName = 'nbsp_te';

    NbspTe.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/([a-zа-яё0-9\-]{3,})\s(те|т\.е|т\sе|т\s\.е)\.(\s[A-ZА-ЯЁ]|$)/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = m[1] + this.ntag(m[2], "span", {
          "class": "nowrap"
        });
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return NbspTe;

  })(OpenQuote);

  module.exports = NbspTe;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_te'] = NbspTe;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Неразрывный пробел в как то';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'nbsp_v_kak_to';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/как то/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        return this.text = this.text.replace(m[0], "как&nbsp;то");
      }
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_v_kak_to'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Удаление повторяющихся слов';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'no_repeat_words';

    Rule.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/([а-яё]{3,})( |\t|\&nbsp\;)\1/i, /(\s|\&nbsp\;|^|\.|\!|\?)(([А-ЯЁ])([а-яё]{2,}))( |\t|\&nbsp\;)(([а-яё])\4)/];
      res = [
        function(m) {
          return m[1];
        }, (function(_this) {
          return function(m) {
            return m[1] + (m[7] === _this.Lib.strtolower(m[3]) ? m[2] : m[2] + m[5] + m[6]);
          };
        })(this)
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['no_repeat_words'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Отсутствие пробела после троеточия после открывающей кавычки';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'no_space_posle_hellip';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\&laquo\;|\&bdquo\;)(\s|\&nbsp\;)?\&hellip\;(\s|\&nbsp\;)?([a-zа-яё])/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[1], "" + m[1] + "&hellip;" + m[4]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['no_space_posle_hellip'] = Rule;
  }

  if (!Quote) {
    Quote = require('./quote');
  }


  /*
   *# Групповой Объект правил "Сокращения"
   */

  NoBr = (function(_super) {
    __extends(NoBr, _super);

    function NoBr() {
      return NoBr.__super__.constructor.apply(this, arguments);
    }

    NoBr.prototype.description = "Неразрывные конструкции";

    NoBr.prototype.version = '0.0.0';

    NoBr.prototype.configName = 'NoBr';

    NoBr.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    NoBr.prototype.rules = [];

    NoBr.prototype.order = ["super_nbsp", "nbsp_v_kak_to", "nbsp_before_particle", "nbsp_celcius", "nbsp_in_the_end", "phone_builder", "ip_address", "spaces_nobr_in_surname_abbr"];

    return NoBr;

  })(Quote);

  module.exports = NoBr;

  if (typeof window !== 'undefined') {
    App.Rules['NoBr'] = NoBr;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NobrAbbreviation
  
  Расстановка пробелов перед сокращениями dpi, lpi
   */

  NobrAbbreviation = (function(_super) {
    __extends(NobrAbbreviation, _super);

    function NobrAbbreviation() {
      return NobrAbbreviation.__super__.constructor.apply(this, arguments);
    }

    NobrAbbreviation.prototype.description = 'Расстановка пробелов перед сокращениями dpi, lpi';

    NobrAbbreviation.prototype.version = '0.0.0';

    NobrAbbreviation.prototype.configName = 'nobr_abbreviation';

    NobrAbbreviation.prototype.replace = function() {
      var m, re, reStr, rex, self, use, _i, _len;
      self = this;
      use = 0;
      rex = [/(\s+|^|\>)(\d+)(\040|\t)*(dpi|lpi)([\s\;\.\?\!\:\(]|$)/i];
      for (_i = 0, _len = rex.length; _i < _len; _i++) {
        re = rex[_i];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5];
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return NobrAbbreviation;

  })(OpenQuote);

  module.exports = NobrAbbreviation;

  if (typeof window !== 'undefined') {
    App.Rules['nobr_abbreviation'] = NobrAbbreviation;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NobrAcronym
  Расстановка пробелов перед сокращениями гл., стр., рис., илл., ст., п.
   */

  NobrAcronym = (function(_super) {
    __extends(NobrAcronym, _super);

    function NobrAcronym() {
      return NobrAcronym.__super__.constructor.apply(this, arguments);
    }

    NobrAcronym.prototype.description = 'Расстановка пробелов перед сокращениями гл., стр., рис., илл., ст., п.';

    NobrAcronym.prototype.version = '0.0.0';

    NobrAcronym.prototype.configName = 'nobr_acronym';

    NobrAcronym.prototype.replace = function() {
      var m, re, reStr, rex, _i, _len;
      rex = [/(\s|^|\>|\()(гл|стр|рис|илл?|ст|п|с)\.(\040|\t)*(\d+)(\&nbsp\;|\s|\.|\,|\?|\!|$)/i];
      for (_i = 0, _len = rex.length; _i < _len; _i++) {
        re = rex[_i];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5];
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return NobrAcronym;

  })(OpenQuote);

  module.exports = NobrAcronym;

  if (typeof window !== 'undefined') {
    App.Rules['nobr_acronym'] = NobrAcronym;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NobrBeforeUnitVolt
  
  Установка пробельных символов в сокращении вольт
   */

  NobrBeforeUnitVolt = (function(_super) {
    __extends(NobrBeforeUnitVolt, _super);

    function NobrBeforeUnitVolt() {
      return NobrBeforeUnitVolt.__super__.constructor.apply(this, arguments);
    }

    NobrBeforeUnitVolt.prototype.description = 'Установка пробельных символов в сокращении вольт';

    NobrBeforeUnitVolt.prototype.version = '0.0.0';

    NobrBeforeUnitVolt.prototype.configName = 'nobr_before_unit_volt';

    NobrBeforeUnitVolt.prototype.replace = function() {
      var idx, m, re, reStr, rex, _i, _len;
      rex = [/(\d+)([вВ]|\s[вВ])(\s|\.|\!|\?|\,|$)/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        reStr = m[1] + '&nbsp;В.';
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return NobrBeforeUnitVolt;

  })(OpenQuote);

  module.exports = NobrBeforeUnitVolt;

  if (typeof window !== 'undefined') {
    App.Rules['nobr_before_unit_volt'] = NobrBeforeUnitVolt;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NobrGost
  
  Привязка сокращения ГОСТ к номеру
   */

  NobrGost = (function(_super) {
    __extends(NobrGost, _super);

    function NobrGost() {
      return NobrGost.__super__.constructor.apply(this, arguments);
    }

    NobrGost.prototype.description = 'Привязка сокращения ГОСТ к номеру';

    NobrGost.prototype.version = '0.0.0';

    NobrGost.prototype.configName = 'nobr_gost';

    NobrGost.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/(\040|\t|\&nbsp\;|^)ГОСТ( |\&nbsp\;)?(\d+)((\-|\&minus\;|\&mdash\;)(\d+))?(( |\&nbsp\;)(\-|\&mdash\;))?/i, /(\040|\t|\&nbsp\;|^|\>)ГОСТ( |\&nbsp\;)?(\d+)(\-|\&minus\;|\&mdash\;)(\d+)/i];
      res = [
        (function(_this) {
          return function(m) {
            var mdash, ndash;
            ndash = (m[6] ? "&ndash;" + m[6] : "");
            mdash = (m[7] ? " &mdash;" : "");
            return m[1] + _this.ntag("ГОСТ " + m[3] + ndash + mdash, "span", {
              "class": "nowrap"
            });
          };
        })(this), function(m) {
          return "m[1]\"ГОСТ \"m[3]\"&ndash;\"m[5]";
        }
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return NobrGost;

  })(OpenQuote);

  module.exports = NobrGost;

  if (typeof window !== 'undefined') {
    App.Rules['nbsp_money_abbr'] = NobrGost;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NobrLocations
  Расстановка пробелов в сокращениях г., ул., пер., д.
   */

  NobrLocations = (function(_super) {
    __extends(NobrLocations, _super);

    function NobrLocations() {
      return NobrLocations.__super__.constructor.apply(this, arguments);
    }

    NobrLocations.prototype.description = 'Расстановка пробелов в сокращениях г., ул., пер., д.';

    NobrLocations.prototype.version = '0.0.0';

    NobrLocations.prototype.configName = 'nobr_locations';

    NobrLocations.prototype.replace = function() {
      var idx, m, re, reStr, rex, _i, _len;
      rex = [/(\s|^|\>)(г|ул|пер|просп|пл|бул|наб|пр|ш|туп)\.(\040|\t)*([а-яё0-9a-z]+)(\s|\.|\,|\?|\!|$)/i, /(\s|^|\>)(б\-р|пр\-кт)(\040|\t)*([а-яё0-9a-z]+)(\s|\.|\,|\?|\!|$)/i, /(\s|^|\>)(д|кв|эт)\.(\040|\t)*(\d+)(\s|\.|\,|\?|\!|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        if (idx === 1) {
          reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5];
        } else {
          reStr = m[1] + m[2] + '.&nbsp;' + m[4] + m[5];
        }
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return NobrLocations;

  })(OpenQuote);

  module.exports = NobrLocations;

  if (typeof window !== 'undefined') {
    App.Rules['nobr_locations'] = NobrLocations;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NobrSmIm
  Расстановка пробелов перед сокращениями см., им.
   */

  NobrSmIm = (function(_super) {
    __extends(NobrSmIm, _super);

    function NobrSmIm() {
      return NobrSmIm.__super__.constructor.apply(this, arguments);
    }

    NobrSmIm.prototype.description = 'Расстановка пробелов перед сокращениями см., им.';

    NobrSmIm.prototype.version = '0.0.0';

    NobrSmIm.prototype.configName = 'nobr_sm_im';

    NobrSmIm.prototype.replace = function() {
      var m, re, reStr, rex, _i, _len;
      rex = [/(\s|^|\>|\()(см|им)\.(\040|\t)*([а-яё0-9a-z]+)(\s|\.|\,|\?|\!|$)/i];
      for (_i = 0, _len = rex.length; _i < _len; _i++) {
        re = rex[_i];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        reStr = m[1] + m[2] + '&nbsp;' + m[4] + m[5];
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return NobrSmIm;

  })(OpenQuote);

  module.exports = NobrSmIm;

  if (typeof window !== 'undefined') {
    App.Rules['nobr_sm_im'] = NobrSmIm;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Неразрывный перед 2х символьной аббревиатурой';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'nobr_twosym_abbr';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([a-zA-Zа-яёА-ЯЁ])(\s|\t)+([A-ZА-ЯЁ]{2})([\s\;\.\?\!\:\(\"]|\&(ra|ld)quo\;|$)/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + "&nbsp;" + m[3] + m[4]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['nobr_twosym_abbr'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило NobrVtchItdItp
  
  Объединение сокращений и т.д., и т.п., в т.ч.
   */

  NobrVtchItdItp = (function(_super) {
    __extends(NobrVtchItdItp, _super);

    function NobrVtchItdItp() {
      return NobrVtchItdItp.__super__.constructor.apply(this, arguments);
    }

    NobrVtchItdItp.prototype.description = 'Объединение сокращений и т.д., и т.п., в т.ч.';

    NobrVtchItdItp.prototype.version = '0.0.0';

    NobrVtchItdItp.prototype.configName = 'nobr_vtch_itd_itp';

    NobrVtchItdItp.prototype.replace = function() {
      var idx, m, re, reStr, res, rex, tag, _i, _len;
      rex = [/(^|\s|\&nbsp\;)и(\s|\&nbsp\;)т\.?[ ]?д(\.|$|\s|\&nbsp\;)/, /(^|\s|\&nbsp\;)и(\s|\&nbsp\;)т\.?[ ]?п(\.|$|\s|\&nbsp\;)/, /(^|\s|\&nbsp\;)в(\s|\&nbsp\;)т\.?[ ]?ч(\.|$|\s|\&nbsp\;)/];
      res = ["и т. д.", "и т. п.", "и т. ч."];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        tag = this.ntag(res[idx], "span", {
          "class": "nowrap"
        });
        reStr = m[1] + tag + (m[3] !== '.' ? m[3] : '');
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return NobrVtchItdItp;

  })(OpenQuote);

  module.exports = NobrVtchItdItp;

  if (typeof window !== 'undefined') {
    App.Rules['nobr_vtch_itd_itp'] = NobrVtchItdItp;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Привязка года к дате';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'nobr_year_in_date';

    Rule.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/(\s|\&nbsp\;)([0-9]{2}\.[0-9]{2}\.([0-9]{2})?[0-9]{2})(\s|\&nbsp\;)?г(\.|\s|\&nbsp\;)/i, /(\s|\&nbsp\;)([0-9]{2}\.[0-9]{2}\.([0-9]{2})?[0-9]{2})(\s|\&nbsp\;|\.(\s|\&nbsp\;|$)|$)/i];
      res = [
        (function(_this) {
          return function(m) {
            var tag;
            tag = _this.ntag(m[2] + " г.", "span", {
              "class": "nowrap"
            });
            return m[1] + tag + (m[5] === "." ? "" : " ");
          };
        })(this), (function(_this) {
          return function(m) {
            var tag;
            tag = _this.ntag(m[2] + " г.", "span", {
              "class": "nowrap"
            });
            return m[1] + tag + m[4];
          };
        })(this)
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['nobr_year_in_date'] = Rule;
  }

  if (!Quote) {
    Quote = require('./quote');
  }


  /*
   *# Групповой Объект правил "Сокращения"
   */

  Numbers = (function(_super) {
    __extends(Numbers, _super);

    function Numbers() {
      return Numbers.__super__.constructor.apply(this, arguments);
    }

    Numbers.prototype.description = "Сокращения";

    Numbers.prototype.version = '0.0.0';

    Numbers.prototype.configName = 'Numbers';

    Numbers.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    Numbers.prototype.rules = [];

    Numbers.prototype.order = ["minus_between_nums", "minus_in_numbers_range", "auto_times_x", "numeric_sub", "numeric_sup", "simple_fraction", "math_chars", "thinsp_between_number_triads", "thinsp_between_no_and_number", "thinsp_between_sect_and_number"];

    return Numbers;

  })(Quote);

  module.exports = Numbers;

  if (typeof window !== 'undefined') {
    App.Rules.Numbers = Numbers;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Нижний индекс';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'numeric_sub';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/([a-zа-яё0-9])\_([\d]{1,3})([^а-яёa-z0-9]|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = m[1] + this.ntag(this.ntag(m[2], "small"), "sub") + m[3];
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['numeric_sub'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Верхний индекс';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'numeric_sup';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/([a-zа-яё0-9])\^([\d]{1,3})([^а-яёa-z0-9]|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = m[1] + this.ntag(this.ntag(m[2], "small"), "sup") + m[3];
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['numeric_sup'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило OaObracketComa
  
  Оптическое выравнивание для пунктуации (скобка и запятая)
   */

  OaObracketComa = (function(_super) {
    __extends(OaObracketComa, _super);

    function OaObracketComa() {
      return OaObracketComa.__super__.constructor.apply(this, arguments);
    }

    OaObracketComa.prototype.description = 'Оптическое выравнивание для пунктуации (скобка и запятая)';

    OaObracketComa.prototype.version = '0.0.0';

    OaObracketComa.prototype.configName = 'oa_obracket_coma';

    OaObracketComa.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/(\040|\&nbsp\;|\t)\(/i, /(\n|\r|^)\(/i, /([а-яёa-z0-9]+)\,(\040+)/i];
      res = [
        (function(_this) {
          return function(m) {
            return _this.ntag(m[1], "span", {
              "class": "oa_obracket_sp_s"
            }) + _this.ntag("(", "span", {
              "class": "oa_obracket_sp_b"
            });
          };
        })(this), (function(_this) {
          return function(m) {
            return m[1] + _this.ntag("(", "span", {
              "class": "oa_obracket_nl_b"
            });
          };
        })(this), (function(_this) {
          return function(m) {
            return m[1] + _this.ntag(",", "span", {
              "class": "oa_comma_b"
            }) + _this.ntag(" ", "span", {
              "class": "oa_comma_e"
            });
          };
        })(this)
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return OaObracketComa;

  })(OpenQuote);

  module.exports = OaObracketComa;

  if (typeof window !== 'undefined') {
    App.Rules['oa_obracket_coma'] = OaObracketComa;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило OaOquote
  
  Расстановка знака минус между числами
   */

  OaOquote = (function(_super) {
    __extends(OaOquote, _super);

    function OaOquote() {
      return OaOquote.__super__.constructor.apply(this, arguments);
    }

    OaOquote.prototype.description = 'Оптическое выравнивание открывающей кавычки';

    OaOquote.prototype.version = '0.0.0';

    OaOquote.prototype.configName = 'oa_oquote';

    OaOquote.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/([a-zа-яё\-]{3,})(\040|\&nbsp\;|\t)(\&laquo\;)/i, /(\n|\r|^)(\&laquo\;)/i];
      res = [
        (function(_this) {
          return function(m) {
            return m[1] + _this.ntag(m[2], "span", {
              "class": "oa_oqoute_sp_s"
            }) + _this.ntag(m[3], "span", {
              "class": "oa_oqoute_sp_q"
            });
          };
        })(this), (function(_this) {
          return function(m) {
            return m[1] + _this.ntag(m[2], "span", {
              "class": "oa_oquote_nl"
            });
          };
        })(this)
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return OaOquote;

  })(OpenQuote);

  module.exports = OaOquote;

  if (typeof window !== 'undefined') {
    App.Rules['oa_oquote'] = OaOquote;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
   *# Открывающая кавычка особые случаи
   */

  OpenQuoteAdv = (function(_super) {
    __extends(OpenQuoteAdv, _super);

    function OpenQuoteAdv() {
      return OpenQuoteAdv.__super__.constructor.apply(this, arguments);
    }

    OpenQuoteAdv.prototype.description = "Открывающая кавычка особые случаи";

    OpenQuoteAdv.prototype.version = '0.0.0';

    OpenQuoteAdv.prototype.configName = 'open_quote_adv';

    OpenQuoteAdv.prototype.apply = function() {
      var debug, re, self;
      if (this.config.on) {
        return;
      }
      self = this;
      debug = this.config.debug;
      re = /(^|\(|\s|\>)(\"|\\\")(\s)(\S+)/i;
      this.text = this.text.replace(re, function(str) {
        var m;
        if (debug) {
          self.debug(str);
        }
        m = str.match(re);
        if (debug) {
          self.debug(m);
        }
        return m[1] + self.Lib.QUOTE_FIRS_OPEN + m[4];
      });
      return this;
    };

    return OpenQuoteAdv;

  })(OpenQuote);

  module.exports = OpenQuoteAdv;

  if (typeof window !== 'undefined') {
    App.Rules['open_quote_adv'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Простановка параграфов';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'paragraphs';

    Rule.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/([а-яё]{3,})( |\t|\&nbsp\;)\1/i, /(\s|\&nbsp\;|^|\.|\!|\?)(([А-ЯЁ])([а-яё]{2,}))( |\t|\&nbsp\;)(([а-яё])\4)/];
      res = [
        function(m) {
          return m[1];
        }, (function(_this) {
          return function(m) {
            return m[1] + (m[7] === _this.Lib.strtolower(m[3]) ? m[2] : m[2] + m[5] + m[6]);
          };
        })(this)
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], res[idx](m));
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['paragraphs'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Объединение в неразрывные конструкции номеров телефонов';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'phone_builder';

    Rule.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/(^|\>|\s)(\+)([0-9]{1})(\(|\s)([0-9]{3})(\)|\s)([0-9]{1,3})(\.|\,|\s|\-)([0-9]{2,3})(\s|\-)([0-9]{2,3})($|\<|\s)/, /(^|\>|\s)([0-9]{3})(\s|\-)([0-9]{2,3})(\s|\-)([0-9]{2,3})(\.|\,|$|\<|\s)/];
      res = [
        (function(_this) {
          return function(m) {
            m[4] = '(';
            m[6] = ')';
            m[8] = '&nbsp;';
            m[10] = '-';
            m.splice(0, 1);
            return _this.ntag(m.join(''), "span", {
              "class": "nowrap"
            });
          };
        })(this), (function(_this) {
          return function(m) {
            var first, last;
            first = '';
            if (m[1] === '>') {
              m[1] = '';
              first = '>';
            }
            last = '';
            if (m[7] === '<') {
              m[7] = '';
              last = '<';
            }
            m[3] = '&nbsp;';
            m[5] = '-';
            m.splice(0, 1);
            return first + _this.ntag(m.join(''), "span", {
              "class": "nowrap"
            }) + last;
          };
        })(this)
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          if (m[1] === '>' && m[12] === '<') {
            m = false;
          }
          if (m[1] === '>' && m[7] === '<') {
            m = false;
          }
        }
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(re, res[idx](m));
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['phone_builder'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило PsPps
  
  Объединение сокращений P.S., P.P.S.
   */

  PsPps = (function(_super) {
    __extends(PsPps, _super);

    function PsPps() {
      return PsPps.__super__.constructor.apply(this, arguments);
    }

    PsPps.prototype.description = 'Объединение сокращений P.S., P.P.S.';

    PsPps.prototype.version = '0.0.0';

    PsPps.prototype.configName = 'ps_pps';

    PsPps.prototype.replace = function() {
      var content, idx, m, re, reStr, rex, _i, _len;
      rex = [/(^|\040|\t|\>|\r|\n)(p\.\040?)(p\.\040?)?(s\.)([^\<])/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        content = this.Lib.trim(m[2]) + ' ';
        if (m[3]) {
          content += this.Lib.trim(m[3]) + ' ';
        }
        reStr = m[1] + this.ntag(content + m[4], "span", {
          "class": "nowrap"
        }) + m[5];
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return PsPps;

  })(OpenQuote);

  module.exports = PsPps;

  if (typeof window !== 'undefined') {
    App.Rules['ps_pps'] = PsPps;
  }

  if (!Quote) {
    Quote = require('./quote');
  }


  /*
  Групповой Объект
  
  Пунктуация и знаки препинания
   */

  Punctmark = (function(_super) {
    __extends(Punctmark, _super);

    function Punctmark() {
      return Punctmark.__super__.constructor.apply(this, arguments);
    }

    Punctmark.prototype.description = "Пунктуация и знаки препинания";

    Punctmark.prototype.version = '0.0.0';

    Punctmark.prototype.configName = 'Punctmark';

    Punctmark.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    Punctmark.prototype.rules = [];

    Punctmark.prototype.order = ['auto_comma', 'punctuation_marks_limit', 'punctuation_marks_base_limit', 'hellip', 'fix_excl_quest_marks', 'fix_pmarks', 'fix_brackets', 'fix_brackets_space', 'dot_on_end'];

    return Punctmark;

  })(Quote);

  module.exports = Punctmark;

  if (typeof window !== 'undefined') {
    App.Rules.Punctmark = Punctmark;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило PunctuationMarksBaseLimit
  
  Лишние запятые, двоеточия, точки с запятой
   */

  PunctuationMarksBaseLimit = (function(_super) {
    __extends(PunctuationMarksBaseLimit, _super);

    function PunctuationMarksBaseLimit() {
      return PunctuationMarksBaseLimit.__super__.constructor.apply(this, arguments);
    }

    PunctuationMarksBaseLimit.prototype.description = 'Лишние запятые, двоеточия, точки с запятой';

    PunctuationMarksBaseLimit.prototype.version = '0.0.0';

    PunctuationMarksBaseLimit.prototype.configName = 'punctuation_marks_base_limit';

    PunctuationMarksBaseLimit.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([\,]|[\:]|[\;]]){2,}/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1]);
      }
      return !!m;
    };

    return PunctuationMarksBaseLimit;

  })(OpenQuote);

  module.exports = PunctuationMarksBaseLimit;

  if (typeof window !== 'undefined') {
    App.Rules['punctuation_marks_base_limit'] = PunctuationMarksBaseLimit;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }


  /*
  Правило PunctuationMarksLimit
  
  Лишние восклицательные, вопросительные знаки и точки
   */

  PunctuationMarksLimit = (function(_super) {
    __extends(PunctuationMarksLimit, _super);

    function PunctuationMarksLimit() {
      return PunctuationMarksLimit.__super__.constructor.apply(this, arguments);
    }

    PunctuationMarksLimit.prototype.description = 'Лишние восклицательные, вопросительные знаки и точки';

    PunctuationMarksLimit.prototype.version = '0.0.0';

    PunctuationMarksLimit.prototype.configName = 'punctuation_marks_limit';

    PunctuationMarksLimit.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/([\!\.\?]){4,}/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + m[1] + m[1]);
      }
      return !!m;
    };

    return PunctuationMarksLimit;

  })(OpenQuote);

  module.exports = PunctuationMarksLimit;

  if (typeof window !== 'undefined') {
    App.Rules['punctuation_marks_limit'] = PunctuationMarksLimit;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Замена (R) на символ зарегистрированной торговой марки';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'r_sign_replace';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(.|^)\(r\)(.|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + "&reg;" + m[2]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['r_sign_replace'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Удаление пробела перед точкой, запятой, двоеточием, точкой с запятой';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'remove_space_before_punctuationmarks';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/((\040|\t|\&nbsp\;)+)([\,\:\.\;\?])(\s+|$)/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[3] + m[4]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['remove_space_before_punctuationmarks'] = Rule;
  }


  /*
  Индекс правил
   */

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Замена дробей 1/2, 1/4, 3/4 на соответствующие символы';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'simple_fraction';

    Rule.prototype.replace = function() {
      var idx, m, re, rep, rex, _i, _len;
      rex = [/1\/(2|4)/, /3\/4/];
      rep = [
        function(m) {
          return "&frac1" + m[1] + ";";
        }, function(m) {
          return "&frac34;";
        }
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], rep[idx](m));
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['simple_fraction'] = Rule;
  }

  if (!Quote) {
    Quote = require('./quote');
  }


  /*
   *# Групповой Объект
   */

  Space = (function(_super) {
    __extends(Space, _super);

    function Space() {
      return Space.__super__.constructor.apply(this, arguments);
    }

    Space.prototype.description = "Расстановка и удаление пробелов";

    Space.prototype.version = '0.0.0';

    Space.prototype.configName = 'Space';

    Space.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    Space.prototype.rules = [];

    Space.prototype.order = ['nobr_twosym_abbr', 'remove_space_before_punctuationmarks', 'autospace_after_comma', 'autospace_after_pmarks', 'autospace_after_dot', 'autospace_after_hellips', 'many_spaces_to_one', 'clear_percent', 'nbsp_before_open_quote', 'nbsp_before_month', 'spaces_on_end'];

    return Space;

  })(Quote);

  module.exports = Space;

  if (typeof window !== 'undefined') {
    App.Rules.Space = Space;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Пробел после года';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'space_posle_goda';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(^|\040|\&nbsp\;)([0-9]{3,4})(год([ауе]|ом)?)([^a-zа-яё]|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "" + m[1] + m[2] + " " + m[3] + m[5]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['space_posle_goda'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Привязка инициалов к фамилиям';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'spaces_nobr_in_surname_abbr';

    Rule.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/(\s|^|\.|\,|\;|\:|\?|\!|\&nbsp\;)([A-ZА-ЯЁ])\.?(\s|\&nbsp\;)?([A-ZА-ЯЁ])(\.(\s|\&nbsp\;)?|(\s|\&nbsp\;))([A-ZА-ЯЁ][a-zа-яё]+)(\s||\.|\,|\;|\:|\?|\!|\&nbsp\;)/, /(\s|^|\.|\,|\;|\:|\?|\!|\&nbsp\;)([A-ZА-ЯЁ][a-zа-яё]+)(\s|\&nbsp\;)([A-ZА-ЯЁ])\.?(\s|\&nbsp\;)?([A-ZА-ЯЁ])\.?(\s|$|\.|\,|\;|\:|\?|\!|\&nbsp\;)/];
      res = [
        (function(_this) {
          return function(m) {
            return m[1] + _this.ntag(m[2] + ". " + m[4] + ". " + m[8], "span", {
              "class": "nowrap"
            }) + m[9];
          };
        })(this), (function(_this) {
          return function(m) {
            return m[1] + _this.ntag(m[2] + " " + m[4] + ". " + m[6] + ".", "span", {
              "class": "nowrap"
            }) + m[7];
          };
        })(this)
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        return this.text = this.text.replace(m[0], res[idx](m));
      }
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['spaces_nobr_in_surname_abbr'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Удаление пробелов в конце текста';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'spaces_on_end';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(\s+$)/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(re, '');
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['spaces_on_end'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Привязка союзов и предлогов к написанным после словам';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'super_nbsp';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/(\s|^|\&(la|bd)quo\;|\>|\(|\&mdash\;\&nbsp\;)([a-zа-яё]{1,2}\s+)([a-zа-яё]{1,2}\s+)?([a-zа-яё0-9\-]{2,}|[0-9])/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = m[1] + this.Lib.trim(m[3]) + "&nbsp;";
        if (m[4]) {
          str += this.Lib.trim(m[4]) + "&nbsp;";
        }
        str += m[5];
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['super_nbsp'] = Rule;
  }

  if (!Quote) {
    Quote = require('./quote');
  }


  /*
   *# Групповой Объект правил "Сокращения"
   */

  Symbol = (function(_super) {
    __extends(Symbol, _super);

    function Symbol() {
      return Symbol.__super__.constructor.apply(this, arguments);
    }

    Symbol.prototype.description = "Текст и абзацы";

    Symbol.prototype.version = '0.0.0';

    Symbol.prototype.configName = 'Symbol';

    Symbol.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    Symbol.prototype.rules = [];

    Symbol.prototype.order = ["tm_replace", "r_sign_replace", "copy_replace", "apostrophe", "degree_f", "euro_symbol", "arrows_symbols"];

    return Symbol;

  })(Quote);

  module.exports = Symbol;

  if (typeof window !== 'undefined') {
    App.Rules.Symbol = Symbol;
  }

  if (!Quote) {
    Quote = require('./quote');
  }


  /*
   *# Групповой Объект правил "Сокращения"
   */

  Text = (function(_super) {
    __extends(Text, _super);

    function Text() {
      return Text.__super__.constructor.apply(this, arguments);
    }

    Text.prototype.description = "Текст и абзацы";

    Text.prototype.version = '0.0.0';

    Text.prototype.configName = 'Text';

    Text.prototype.config = {
      on: true,
      log: true,
      debug: true
    };

    Text.prototype.rules = [];

    Text.prototype.order = ["auto_links", "email", "no_repeat_words", 'paragraphs', 'breakline'];

    return Text;

  })(Quote);

  module.exports = Text;

  if (typeof window !== 'undefined') {
    App.Rules.Text = Text;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Пробел между символом номера и числом';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'thinsp_between_no_and_number';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(№|\&#8470\;)(\s|&nbsp;)*(\d)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "&#8470;&thinsp;" + m[3]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['thinsp_between_no_and_number'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Объединение триад чисел полупробелом';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'thinsp_between_number_triads';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/([0-9]{1,3}( [0-9]{3}){1,})(.|$)/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        if (m[3] === '-') {
          str = m[0];
        } else {
          str = m[1].replace(" ", "&thinsp;");
        }
        str += m[3];
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['thinsp_between_number_triads'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Пробел между параграфом и числом';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'thinsp_between_sect_and_number';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, _i, _len;
      rex = [/(§|\&sect\;)(\s|&nbsp;)*(\d+|[IVX]+|[a-zа-яё]+)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], "&sect;&thinsp;" + m[3]);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['thinsp_between_sect_and_number'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Тире между диапозоном веков';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'time_interval';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/([^\d\>]|^)([\d]{1,2}\:[\d]{2})(-|\&mdash\;|\&minus\;)([\d]{1,2}\:[\d]{2})([^\d\<]|$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = m[1] + this.ntag(m[2] + "&mdash;" + m[4], "span", {
          "class": "nowrap"
        }) + m[5];
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['time_interval'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Замена (tm) на символ торговой марки';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'tm_replace';

    Rule.prototype.replace = function() {
      var idx, m, re, res, rex, _i, _len;
      rex = [/([\040\t])?\(tm\)/i];
      res = [
        function(m) {
          return m[1];
        }, (function(_this) {
          return function(m) {
            return m[1] + (m[7] === _this.Lib.strtolower(m[3]) ? m[2] : m[2] + m[5] + m[6]);
          };
        })(this)
      ];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        this.text = this.text.replace(m[0], '&trade;');
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['tm_replace'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Автоматическая простановка дефисов в обезличенных местоимениях и междометиях';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'to_libo_nibud';

    Rule.prototype.replace = function() {
      var m, re, self;
      self = this;
      re = /(\s|^|\&nbsp\;|\>)(кто|кем|когда|зачем|почему|как|что|чем|где|чего|кого)\-?(\040|\t|\&nbsp\;)\-?(то|либо|нибудь)([\.\,\!\?\;]|\040|\&nbsp\;|$)/i;
      m = this.text.match(re);
      if (m) {
        this.text = this.text.replace(re, function(str) {
          var reStr;
          self.debug(str);
          self.debug(m);
          reStr = '';
          if (m[1] !== "&nbsp;") {
            reStr += m[1];
          }
          reStr += "" + m[2] + "-" + m[4];
          if (m[5] !== "&nbsp;") {
            return reStr += m[5];
          }
        });
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['to_libo_nibud'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Надстрочный текст после символа ^';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'word_sup';

    Rule.prototype.replace = function() {
      var idx, m, re, rex, str, _i, _len;
      rex = [/((\s|\&nbsp\;|^)+)\^([a-zа-яё0-9\.\:\,\-]+)(\s|\&nbsp\;|$|\.$)/i];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        str = this.ntag(this.ntag(m[3], "small"), "sup") + m[4];
        this.text = this.text.replace(m[0], str);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['word_sup'] = Rule;
  }

  if (!OpenQuote) {
    OpenQuote = require('./open_quote');
  }

  Rule = (function(_super) {
    __extends(Rule, _super);

    function Rule() {
      return Rule.__super__.constructor.apply(this, arguments);
    }

    Rule.prototype.description = 'Установка тире и пробельных символов в периодах дат';

    Rule.prototype.version = '0.0.0';

    Rule.prototype.configName = 'years';

    Rule.prototype.replace = function() {
      var idx, m, re, reStr, rex, _i, _len;
      rex = [/(с|по|период|середины|начала|начало|конца|конец|половины|в|между|\([cс]\)|\&copy\;)(\s+|\&nbsp\;)([\d]{4})(-|\&minus\;)([\d]{4})(( |\&nbsp\;)?(г\.г\.|гг\.|гг|г\.|г)([^а-яёa-z]))?/];
      for (idx = _i = 0, _len = rex.length; _i < _len; idx = ++_i) {
        re = rex[idx];
        m = this.text.match(re);
        if (m) {
          break;
        }
      }
      if (m) {
        reStr = m[1] + m[2];
        if (parseInt([3] >= parseInt(m[5]))) {
          reStr += m[3] + m[4] + m[5];
        } else {
          reStr += m[3] + "&mdash;" + m[5];
        }
        if (m[6]) {
          reStr += "&nbsp;гг.";
        }
        if (m[9]) {
          reStr += m[9];
        }
        this.text = this.text.replace(m[0], reStr);
      }
      return !!m;
    };

    return Rule;

  })(OpenQuote);

  module.exports = Rule;

  if (typeof window !== 'undefined') {
    App.Rules['years'] = Rule;
  }

}).call(this);

//# sourceMappingURL=../dist/emt.js.map
