EMTLib = require( '../libs/emt_lib').EMTLib
emt = new EMTLib()

console.log 'Test 0 encrypt_tag'

if emt.decrypt_tag( emt.encrypt_tag( 'your text') ) is 'your text'
  console.log 'Test OK'

