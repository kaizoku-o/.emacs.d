;;; ox-pukiwiki-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ox-pukiwiki" "ox-pukiwiki.el" (0 0 0 0))
;;; Generated autoloads from ox-pukiwiki.el

(autoload 'org-pukiwiki-export-as-pukiwiki "ox-pukiwiki" "\
Export current buffer to a buffer in Pukiwiki format.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting buffer should be accessible
through the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

Export is done in a buffer named \"*Org PUKIWIKI Export*\", which
will be displayed when `org-export-show-temporary-export-buffer'
is non-nil.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY)" t nil)

(autoload 'org-pukiwiki-export-to-pukiwiki "ox-pukiwiki" "\
Export current buffer to a Pukiwiki file.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting file should be accessible through
the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

Return output file name.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ox-pukiwiki" '("ox-puki-" "org-pukiwiki-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ox-pukiwiki-autoloads.el ends here
