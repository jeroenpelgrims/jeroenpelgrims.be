require [], ->
  String::rot = (alphabet) ->
    swap = (c) ->
      if c in alphabet
        length = alphabet.length
        alphabet[(alphabet.indexOf(x) + length/2) % length]
      else
        c

    (swap x for x in @).join ''

  String::rot18 = ->
    @rot 'abcdefghijklmnopqrstuvwxyz0123456789'