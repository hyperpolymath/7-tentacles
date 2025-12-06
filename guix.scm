;;; Seven Tentacles - GNU Guix development environment
;;; Teaching Compiler Architecture Ages 8-18

(use-modules (guix packages)
             (guix gexp)
             (gnu packages node)
             (gnu packages ruby)
             (gnu packages version-control)
             (gnu packages rust-apps)
             (gnu packages web))

;; Development environment specification
;; Usage: guix shell -D -f guix.scm

(packages->manifest
 (list
  ;; JavaScript / Node.js
  node

  ;; Documentation
  ruby                    ; For AsciiDoctor
  ;; Note: Install asciidoctor via: gem install asciidoctor

  ;; Development tools
  git
  ripgrep

  ;; Web development
  ;; Note: Use npm for http-server and live-server
  ))

;; Package definition for distribution
(define-public seven-tentacles
  (package
    (name "seven-tentacles")
    (version "0.1.0")
    (source (local-file "." "seven-tentacles-source"
                        #:recursive? #t))
    (build-system gnu-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (delete 'configure)
         (replace 'build
           (lambda _
             ;; Build documentation
             (mkdir-p "docs-html")
             (system* "asciidoctor" "-D" "docs-html" "README.adoc")
             (system* "asciidoctor" "-D" "docs-html" "VISION.adoc")
             #t))
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (copy-recursively "." out)
               #t))))
       #:tests? #f))
    (native-inputs
     (list ruby))  ; For asciidoctor
    (synopsis "Teaching Compiler Architecture Ages 8-18")
    (description
     "Seven Tentacles is a 10-year learning framework that teaches
university and graduate-level compiler architecture concepts to
children aged 8-18 through progressive reveal and playful mascots.")
    (home-page "https://gitlab.com/hyperpolymath/seven-tentacles")
    (license license:agpl3+)))

seven-tentacles
