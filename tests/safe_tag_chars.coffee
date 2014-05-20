EMTLib = require( '../libs/emt_lib').EMTLib
emt = new EMTLib()

console.log 'Test 0 safe_tag_chars'
text = '<a href="http://mdash.ru">test</a><p>test</p>'

# console.log emt.safe_tag_chars( emt.safe_tag_chars( text, true), false)
if emt.safe_tag_chars( emt.safe_tag_chars( text, true), false) is text
  console.log 'Test OK'

