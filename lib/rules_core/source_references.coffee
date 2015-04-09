

#-----------------------------------------------------------------------------------------------------------
insert = ( list, idx, value ) ->
  list.splice idx, 0, value
  return list

#-----------------------------------------------------------------------------------------------------------
new_reference = ( marker, start, stop ) -> {
  type:         "html_inline"
  # type:         "inline"
  tag:          ""
  attrs:        null
  map:          [ start, stop, ]
  nesting:      0
  level:        0
  children:     null
  content:      marker
  markup:       ""
  info:         ""
  meta:         null
  block:        true
  hidden:       false }

#-----------------------------------------------------------------------------------------------------------
module.exports = ( md, options ) ->
  md.core.ruler.push "checkbox", (state) ->
    seen = {}
    { tokens } = state
    for token_idx in [ tokens.length - 1 .. 0 ] by -1
      token = tokens[ token_idx ]
      continue unless ( map = token[ 'map' ] )?
      [ start, stop, ]  = map
      marker            = "<!--@(#{start},#{stop})-->"
      continue if seen[ marker ]?
      seen[ marker ] = 1
      insert tokens, token_idx + 1, new_reference marker, start, stop
    #.......................................................................................................
    return null



