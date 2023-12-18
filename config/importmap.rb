# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "flatpickr", to: "https://ga.jspm.io/npm:flatpickr@4.6.13/dist/esm/index.js"
pin "social-share-button", to: "https://ga.jspm.io/npm:social-share-button@2.2.0/index.js"
pin "attrobj", to: "https://ga.jspm.io/npm:attrobj@3.1.0/lib/attrobj.js"
pin "aug", to: "https://ga.jspm.io/npm:aug@4.0.0/dist/aug.js"
pin "domassist", to: "https://ga.jspm.io/npm:domassist@2.3.1/domassist.js"
pin "domodule", to: "https://ga.jspm.io/npm:domodule@8.1.0/lib/domodule.js"
