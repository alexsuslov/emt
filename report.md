# Тесты
```
[4mRunning "mochaTest:test" (mochaTest) task[24m


  EMTBase
    ✓ is present EMTretQuote 
    add_safe_tag
      ✓ xid 
      ✓ xopen 
      ✓ close 
      ✓ tag 
    add_safe_block
      ✓ xid 
      ✓ xopen 
      ✓ close 

  EMTLib
    ✓ trim 
    ✓ encrypt_tag / decrypt_tag 
    ✓ decode_internal_blocks / encode_internal_blocks 
    ✓ safe_tag_chars 
    isInt
      ✓ 1 
      ✓ 1.25 
    isArray
      ✓ array 
      ✓ object 
      ✓ number 
      ✓ string 
      ✓ function 
    isObject
      ✓ array 
      ✓ object 
      ✓ number 
      ✓ string 
      ✓ function 

  EMTret
    set_text
      ✓ @_text = 'test  
    set_tag_layout
      ✓ set_tag_layout() 
      ✓ set_tag_layout(10) 
    set_rule
      ✓ rulename key value 
    apply
      ✓ string 
      ✓ array 

  EMTretDash
    set_text
      ✓ @_text = 'test  

  EMTretNobr
    set_text
      ✓ @_text = 'test  

  EMTretNumber
    set_text
      ✓ @_text = 'test  

  EMTretPunctmark
    set_text
      ✓ @_text = 'test  

  EMTretQuote
    open_quote
      ✓ Тест "Хроники Ехо"? 

  EMTretSpace
    set_text
      ✓ @_text = 'test  

  EMTretSymbol
    set_text
      ✓ @_text = 'test  

  EMTypograph
    set_text
      ✓ @_text = 'test  
    apply
      ✓ test 
      ✓ <a href='#test'> "test"</a> 


  40 passing (10ms)


[32mDone, without errors.[39m
```
