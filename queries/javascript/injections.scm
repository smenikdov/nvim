(template_string
   (string_fragment) @injection.content
   (#match? @injection.content "^\\s*(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP|WITH)")
   (#set! injection.language "sql"))

(string
   (string_fragment) @injection.content
   (#match? @injection.content "^\\s*(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP|WITH)")
   (#set! injection.language "sql"))
