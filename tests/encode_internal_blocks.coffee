EMT = require( '../emt')
emt = new EMT.EMTLib()

console.log 'Test 0 en / decode_internal_blocks'
text = '<a href="http://mdash.ru">test</a><p>test</p>'


# console.log emt.decode_internal_blocks emt.encode_internal_blocks text
if emt.decode_internal_blocks( emt.iblock(text) ) is text
  console.log 'Test OK'

