EMTLib = require( '../libs/emt_lib').EMTLib
emt = new EMTLib()

console.log 'Test 0 clear_special_chars'
str = emt.clear_special_chars('your text', 'utf8')
console.log str

console.log 'Test 1 clear_special_chars'
str = emt.clear_special_chars('your text', 'html')
console.log str

console.log 'Test 2 clear_special_chars'
str = emt.clear_special_chars('your text')
console.log str
