// Generated by CoffeeScript 1.9.0
(function() {
  var insert, new_reference;

  insert = function(list, idx, value) {
    list.splice(idx, 0, value);
    return list;
  };

  new_reference = function(marker, start, stop) {
    return {
      type: "html_inline",
      tag: "",
      attrs: null,
      map: [start, stop],
      nesting: 0,
      level: 0,
      children: null,
      content: marker,
      markup: "",
      info: "",
      meta: null,
      block: true,
      hidden: false
    };
  };

  module.exports = function(md, options) {
    return md.core.ruler.push("checkbox", function(state) {
      var attrs, map, seen, start, stop, tag, token, token_idx, tokens, _i, _ref;
      seen = {};
      tokens = state.tokens;
      for (token_idx = _i = _ref = tokens.length - 1; _i >= 0; token_idx = _i += -1) {
        token = tokens[token_idx];
        map = token.map, tag = token.tag, attrs = token.attrs;
        if (!((map != null) && (tag != null) && tag.length > 0)) {
          continue;
        }
        start = map[0], stop = map[1];
        if (attrs == null) {
          token['attrs'] = attrs = [];
        }
        attrs.push(['loc', start + "," + stop]);
      }
      return null;
    });
  };

}).call(this);