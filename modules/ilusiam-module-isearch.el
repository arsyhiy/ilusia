(with-eval-after-load 'isearch
  (setq isearch-lazy-count t
    lazy-count-prefix-format "(%s/%s) "
    lazy-count-suffix-format nil
    search-whitespace-regexp ".*?"))
