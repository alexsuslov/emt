# Dumper
# сохраняет объект в строку
# для coffee-script работает как компилятор
dump =
  # для объекта
  object: (obj) ->
    buff = undefined
    prop = undefined
    buff = []
    for prop of obj
      buff.push @toString(prop) + ": " + @toString(obj[prop])
    "{" + buff.join(", ") + "}"


  # для списка
  array: (arr) ->
    buff = undefined
    i = undefined
    len = undefined
    buff = []
    i = 0
    len = arr.length

    while i < len
      buff.push @toString(arr[i])
      i++
    "[" + buff.join(", ") + "]"


  # в строку
  toString: (obj) ->
    if Object::toString.call(obj) is "[object Function]"
      return obj.toString()
    else if Object::toString.call(obj) is "[object Array]"
      return @array(obj)
    else if Object::toString.call(obj) is "[object String]"
      return "\"" + obj.replace("\"", "\\\"") + "\""
    else return @object(obj)  if obj is Object(obj)
    obj.toString()

