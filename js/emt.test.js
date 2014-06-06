var Abbr, Dash, EmtDate, Etc, NoBr, Number, Obj, Punctmark, Quote, Space, Symbol, Text, UnTest, require, test, _i, _len, _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

require = function(str) {};

UnTest = (function() {
  UnTest.prototype.test = function(data) {
    var report, text;
    if (data.debug) {
      console.log(data.res);
    }
    report = [];
    if (this.emt) {
      report.push(data.text);
      text = this.emt.simple(data.text);
      if (data.debug) {
        console.log(text);
      }
      report.push(text);
      if (text === data.res) {
        report.push('ok');
      } else {
        report.push('error');
      }
      report.push(data.res);
    }
    return report;
  };

  function UnTest(opt) {
    this.opt = opt;
    this.emt = this.opt.emt;
    this;
  }

  return UnTest;

})();

Symbol = (function() {
  Symbol.prototype.description = 'Символы';

  Symbol.prototype.tests = [
    {
      text: "(tm)",
      res: "&trade;"
    }, {
      text: "(r)",
      res: "&reg;"
    }, {
      text: "(c)",
      res: "&copy;"
    }, {
      text: " тест'test",
      res: " тест&rsquo;test"
    }, {
      text: " 40F ",
      res: " <span class='nowrap'>40 &deg;F</span>"
    }, {
      text: " € ",
      res: " &euro;"
    }, {
      text: " <- -> → ←",
      res: " &larr; &rarr; &rarr; &larr;"
    }, {
      text: " +/- ",
      res: " &plusmn;"
    }
  ];

  function Symbol(opt) {
    this.opt = opt;
    this.emt = this.opt.emt;
    this.el = this.opt.el;
    this.report = [];
    this.unTest = new UnTest({
      emt: this.emt
    });
    this.el.append("<tr><th colspan='4'>" + this.description + "</th><tr>");
    this;
  }

  Symbol.prototype.test = function() {
    var data, _i, _len, _ref;
    _ref = this.tests;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      data = _ref[_i];
      this.report.push(this.unTest.test(data));
    }
    return this.report;
  };

  Symbol.prototype.display = function() {
    var paint, report, _i, _len, _ref, _results;
    _ref = this.report;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      report = _ref[_i];
      paint = 'success';
      if (report[2] !== 'ok') {
        paint = 'danger';
      }
      _results.push(this.el.append($("<tr class='" + paint + "'></tr>").append("<td>" + report[0] + "</td>").append("<td>" + report[1] + "</td>").append($("<td></td>").text(report[3])).append($("<td></td>").text(report[1]))));
    }
    return _results;
  };

  return Symbol;

})();

Number = (function(_super) {
  __extends(Number, _super);

  function Number() {
    return Number.__super__.constructor.apply(this, arguments);
  }

  Number.prototype.description = 'Числа, дроби, математические знаки';

  Number.prototype.tests = [
    {
      text: " 1-1 ",
      res: " 1&minus;1"
    }, {
      text: ' test 10х20х30 ',
      res: ' test 10&times;20&times;30'
    }, {
      text: ' test 1/2 1/4 3/4',
      res: " test &frac12; &frac14; &frac34;"
    }, {
      text: ' 123 123 123 ',
      res: " 123&thinsp;123&thinsp;123"
    }, {
      text: '№ 4, № 5',
      res: "&#8470;&thinsp;4, &#8470;&thinsp;5"
    }, {
      text: '§ 1',
      res: "&sect;&thinsp;1"
    }, {
      text: " test_3 ",
      res: " test<sub><small>3</small></sub>"
    }, {
      text: " test^3 ",
      res: " test<sup><small>3</small></sup>"
    }
  ];

  return Number;

})(Symbol);

Punctmark = (function(_super) {
  __extends(Punctmark, _super);

  function Punctmark() {
    return Punctmark.__super__.constructor.apply(this, arguments);
  }

  Punctmark.prototype.description = 'Пунктуация и знаки препинания';

  Punctmark.prototype.tests = [
    {
      text: 'тест а тест но',
      res: "тест, а&nbsp;тест но"
    }, {
      text: ' !!!! ',
      res: " !!!"
    }, {
      text: '::',
      res: ":"
    }, {
      text: ' ... ',
      res: " &hellip;"
    }, {
      text: ' test!? ',
      res: " test?!"
    }, {
      text: ' test!! ',
      res: " test!"
    }, {
      text: ' (   deijdei   ) ',
      res: " (deijdei)"
    }, {
      text: 'vfvfvf(   deijdei   ) ',
      res: "vfvfvf (deijdei)"
    }, {
      text: 'vfvfvf ',
      res: "vfvfvf."
    }
  ];

  return Punctmark;

})(Symbol);

Abbr = (function(_super) {
  __extends(Abbr, _super);

  function Abbr() {
    return Abbr.__super__.constructor.apply(this, arguments);
  }

  Abbr.prototype.description = 'Сокращения';

  Abbr.prototype.tests = [
    {
      text: ' гл. 4, стр. 5, рис. 7, илл. 9, ст. 6, п. 9 ',
      res: " гл&nbsp;4, стр&nbsp;5, рис&nbsp;7, илл&nbsp;9, ст&nbsp;6, п&nbsp;9"
    }, {
      text: ' см. 2, им. 4',
      res: " см&nbsp;2, им&nbsp;4"
    }, {
      text: ' г. Тест, пр-кт Тест,  д. 4 ',
      res: " г.&nbsp;Тест, пр&mdash;кт&nbsp;Тест, д.&nbsp;4"
    }, {
      text: ' 1 м2 ',
      res: ' 1&nbsp;м&sup2;'
    }, {
      text: ' 1кг. ',
      res: ' 1&nbsp;кг.'
    }, {
      text: ' 10в. ',
      res: " 10&nbsp;В."
    }, {
      text: ' ООО Биомед ',
      res: ' ООО&nbsp;Биомед'
    }, {
      text: " 300 dpi 150 lpi ",
      res: " 300&nbsp;dpi 150&nbsp;lpi"
    }, {
      text: " P. S. , P.P.S. ",
      res: " <span class='nowrap'>P. S.</span>, <span class='nowrap'>P. P. S.</span>"
    }, {
      text: " и т. д. и т. п. в т.ч.",
      res: " <span class='nowrap'>и т. д.</span> <span class='nowrap'>и т. п.</span> <span class='nowrap'>и т. ч.</span>"
    }, {
      text: " 40 тыс. руб.",
      res: " 40&nbsp;тыс.&nbsp;руб."
    }, {
      text: " ГОСТ 123-123 ",
      res: " <span class='nowrap'>ГОСТ 123&ndash;123</span>"
    }, {
      text: " тест те.",
      res: " тест<span class='nowrap'>те</span>"
    }
  ];

  return Abbr;

})(Symbol);

Dash = (function(_super) {
  __extends(Dash, _super);

  function Dash() {
    return Dash.__super__.constructor.apply(this, arguments);
  }

  Dash.prototype.description = "Дефисы и тире";

  Dash.prototype.tests = [
    {
      text: "привет - привет",
      res: "привет&nbsp;&mdash; привет",
      debug: true
    }, {
      text: " привет, - привет",
      res: " привет,&nbsp;&mdash; привет"
    }, {
      text: " привет\n- привет",
      res: " привет\n&nbsp;&mdash;привет"
    }, {
      text: " привет! - привет",
      res: " привет!&nbsp;&mdash;привет"
    }, {
      text: " из -за, из -под ",
      res: " из &mdash;за, из &mdash;под"
    }, {
      text: " кто -то кто -либо кто -нибудь",
      res: " кто &mdash;то кто &mdash;либо кто &mdash;нибудь"
    }, {
      text: "Кое -как,  кой -кого,  все -таки",
      res: "Кое &mdash;как, кой &mdash;кого, все &mdash;таки"
    }, {
      text: 'скажите ка, он де, ну кась ',
      res: "скажите&mdash;ка, он&mdash;де, ну&mdash;кась"
    }
  ];

  return Dash;

})(Symbol);

EmtDate = (function(_super) {
  __extends(EmtDate, _super);

  function EmtDate() {
    return EmtDate.__super__.constructor.apply(this, arguments);
  }

  EmtDate.prototype.description = "Даты и дни";

  EmtDate.prototype.tests = [
    {
      text: ' с 1990-2000 ',
      res: " с&nbsp;1990&mdash;2000"
    }, {
      text: ' сентября-август ',
      res: " сентября&mdash;август"
    }, {
      text: ' 1999год ',
      res: " 1999 год"
    }, {
      text: ' 1999г. ',
      res: " 1999&nbsp;г."
    }, {
      text: ' 24.03.1999 ',
      res: " <span class='nowrap'>24.03.1999 г.</span>"
    }
  ];

  return EmtDate;

})(Symbol);

Etc = (function(_super) {
  __extends(Etc, _super);

  function Etc() {
    return Etc.__super__.constructor.apply(this, arguments);
  }

  Etc.prototype.description = "Прочее";

  Etc.prototype.tests = [
    {
      obj: require('../libs/rules/etc/acute_accent'),
      text: ' приве`т ',
      res: " приве&#769;т"
    }, {
      obj: require('../libs/rules/etc/word_sup'),
      text: ' приве ^т ',
      res: " приве<sup><small>т</small></sup>"
    }, {
      obj: require('../libs/rules/etc/century_period'),
      text: ' X-V в ',
      res: " <span class='nowrap'>X&mdash;V вв.</span>"
    }, {
      obj: require('../libs/rules/etc/time_interval'),
      text: ' 10:00-20:00 ',
      res: " <span class='nowrap'>10:00&mdash;20:00</span>"
    }
  ];

  return Etc;

})(Symbol);

NoBr = (function(_super) {
  __extends(NoBr, _super);

  function NoBr() {
    return NoBr.__super__.constructor.apply(this, arguments);
  }

  NoBr.prototype.description = "Неразрывные конструкции";

  NoBr.prototype.tests = [
    {
      obj: require('../libs/rules/nobr/super_nbsp'),
      text: ' к вам ',
      res: " к&nbsp;вам"
    }, {
      obj: require('../libs/rules/nobr/nbsp_v_kak_to'),
      text: ' как то ',
      res: " как&nbsp;то"
    }, {
      obj: require('../libs/rules/nobr/nbsp_before_particle'),
      text: ' вам ли ',
      res: " вам&nbsp;ли"
    }, {
      obj: require('../libs/rules/nobr/nbsp_celcius'),
      text: ' 10 &deg;С ',
      res: " 10&nbsp;&deg;C"
    }, {
      obj: require('../libs/rules/nobr/ip_address'),
      text: '123.123.123.123',
      res: "<span class='nowrap'>123.123.123.123</span>"
    }, {
      obj: require('../libs/rules/nobr/spaces_nobr_in_surname_abbr'),
      text: ' Ccccc A.A. ',
      res: " <span class='nowrap'>Ccccc A. A.</span>"
    }
  ];

  return NoBr;

})(Symbol);

Quote = (function(_super) {
  __extends(Quote, _super);

  function Quote() {
    return Quote.__super__.constructor.apply(this, arguments);
  }

  Quote.prototype.description = "Кавычки";

  Quote.prototype.tests = [
    {
      obj: require('../libs/rules/quote/open_quote'),
      text: "привет \"test\" привет. привет \"test\" привет",
      res: "привет «test» привет. привет «test» привет"
    }, {
      obj: require('../libs/rules/quote/close_quote'),
      text: "привет \"test\" привет",
      res: "привет «test» привет"
    }
  ];

  return Quote;

})(Symbol);

Space = (function(_super) {
  __extends(Space, _super);

  function Space() {
    return Space.__super__.constructor.apply(this, arguments);
  }

  Space.prototype.description = "Расстановка и удаление пробелов";

  Space.prototype.tests = [
    {
      obj: require('../libs/rules/space/nobr_twosym_abbr'),
      text: "test test AS ",
      res: "test test&nbsp;AS"
    }, {
      obj: require('../libs/rules/space/remove_space_before_punctuationmarks'),
      text: "test test ; AS ; ",
      res: "test test; AS;"
    }, {
      obj: require('../libs/rules/space/autospace_after_comma'),
      text: " ,9 9,3 ",
      res: ", 9 9, 3"
    }, {
      obj: require('../libs/rules/space/autospace_after_pmarks'),
      text: "asasa ,ddsdss  asasa .ddsdss ",
      res: "asasa, ddsdss asasa. ddsdss"
    }, {
      obj: require('../libs/rules/space/autospace_after_dot'),
      text: "  test.ru привет.привет ",
      res: "  test.\\ru привет. привет"
    }, {
      obj: require('../libs/rules/space/autospace_after_hellips'),
      text: "!..привет ",
      res: "!.. привет"
    }, {
      obj: require('../libs/rules/space/many_spaces_to_one'),
      text: "привет  привет ",
      res: "привет"
    }, {
      obj: require('../libs/rules/space/clear_percent'),
      text: " 10 % ",
      res: " 10%"
    }, {
      obj: require('../libs/rules/space/nbsp_before_open_quote'),
      text: " a &laquo; ",
      res: " a&nbsp;&laquo;"
    }, {
      obj: require('../libs/rules/space/nbsp_before_month'),
      text: " 1 мая ",
      res: " 1&nbsp;мая"
    }, {
      obj: require('../libs/rules/space/spaces_on_end'),
      text: "test ",
      res: "test"
    }
  ];

  return Space;

})(Quote);

Text = (function(_super) {
  __extends(Text, _super);

  function Text() {
    return Text.__super__.constructor.apply(this, arguments);
  }

  Text.prototype.description = "Текст и абзацы";

  Text.prototype.tests = [
    {
      obj: require('../libs/rules/text/auto_links'),
      text: " http://alexsuslov.github.io/emt/ ",
      res: " <a href='http://alexsuslov.github.io/emt/'>alexsuslov.github.io/emt/</a>"
    }, {
      obj: require('../libs/rules/text/email'),
      text: " alexsuslov@github.com ",
      res: " <a href='mailto:alexsuslov@github.com'>alexsuslov@github.com</a>"
    }, {
      obj: require('../libs/rules/text/no_repeat_words'),
      text: " привет привет ",
      res: " привет"
    }
  ];

  return Text;

})(Quote);

_ref = [Symbol, Number, Abbr, Dash, EmtDate, Etc, NoBr, Quote, Space, Text, Punctmark];
for (_i = 0, _len = _ref.length; _i < _len; _i++) {
  Obj = _ref[_i];
  test = new Obj({
    emt: new EMT(),
    el: $('.report tbody')
  });
  test.test();
  test.display();
}

//# sourceMappingURL=../js/emt.test.js.map
