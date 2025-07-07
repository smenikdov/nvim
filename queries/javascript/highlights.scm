; Проверка орфографии в комментариях
(comment) @spell

; Проверка орфографии в строках
; (string) @spell
; (template_string) @spel

(template_string
  (string_fragment) @spell
  (#not-match? @spell "^\\s*(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP)"))

(string
  (string_fragment) @spell
  (#not-match? @spell "^\\s*(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP)"))
