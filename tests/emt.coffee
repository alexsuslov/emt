EMT = require( '../emt')

emt = new EMT.Typograph()
emt.set_text '''"Эдиториум.ру" - сайт, созданный по материалам сборника "О редактировании и редакторах" Аркадия Эммануиловича Мильчина, который с 1944 года коллекционировал выдержки из статей, рассказов, фельетонов, пародий, писем и книг, где так или иначе затрагивается тема редакторской работы. Эта коллекция легла в основу обширной антологии, представляющей историю и природу редактирования в первоисточниках. '''
result = emt.apply()

console.log result

console.log '<p><span style="margin-left:-0.44em;">&laquo;</span>Эдиториум.ру&raquo;&nbsp;&mdash; сайт<span style="margin-right:-0.2em;">,</span><span style="margin-left:0.2em;"> </span>созданный по&nbsp;материалам сборника<span style="margin-right:0.44em;"> </span><span style="margin-left:-0.44em;">&laquo;</span>О&nbsp;редактировании и&nbsp;редакторах&raquo; Аркадия Эммануиловича Мильчина<span style="margin-right:-0.2em;">,</span><span style="margin-left:0.2em;"> </span>который с&nbsp;1944 года коллекционировал выдержки из&nbsp;статей<span style="margin-right:-0.2em;">,</span><span style="margin-left:0.2em;"> </span>рассказов<span style="margin-right:-0.2em;">,</span><span style="margin-left:0.2em;"> </span>фельетонов<span style="margin-right:-0.2em;">,</span><span style="margin-left:0.2em;"> </span>пародий<span style="margin-right:-0.2em;">,</span><span style="margin-left:0.2em;"> </span>писем и&nbsp;книг<span style="margin-right:-0.2em;">,</span><span style="margin-left:0.2em;"> </span>где так или иначе затрагивается тема редакторской работы. Эта коллекция легла в&nbsp;основу обширной антологии<span style="margin-right:-0.2em;">,</span><span style="margin-left:0.2em;"> </span>представляющей историю и&nbsp;природу редактирования в&nbsp;первоисточниках.</p>'
