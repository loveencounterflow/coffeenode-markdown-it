

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
  # template = options?[ 'template' ] ? "<!--@(${start},${stop})-->"
  md.core.ruler.push "checkbox", (state) ->
    seen = {}
    { tokens } = state
    for token_idx in [ tokens.length - 1 .. 0 ] by -1
      token = tokens[ token_idx ]
      { map, tag, attrs, } = token
      continue unless map? and tag? and tag.length > 0
      # continue unless ( map = token[ 'map' ] )?
      [ start, stop, ]  = map
      token[ 'attrs' ]  = attrs = [] unless attrs?
      attrs.push [ 'loc', "#{start},#{stop}", ]
      # marker            = template
      # marker            = marker.replace '${start}', start
      # marker            = marker.replace '${stop}',  stop
      # continue if seen[ marker ]?
      # seen[ marker ] = 1
      # insert tokens, token_idx + 1, new_reference marker, start, stop
    #.......................................................................................................
    return null



