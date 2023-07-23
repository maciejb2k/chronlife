# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-notification", to: "https://ga.jspm.io/npm:stimulus-notification@2.2.0/dist/stimulus-notification.mjs"
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js"
pin "hotkeys-js", to: "https://ga.jspm.io/npm:hotkeys-js@3.11.2/dist/hotkeys.esm.js"
pin "stimulus-use", to: "https://ga.jspm.io/npm:stimulus-use@0.51.3/dist/index.js"
pin "sweetalert2", to: "https://ga.jspm.io/npm:sweetalert2@11.7.16/dist/sweetalert2.all.js"
pin "stimulus-dropdown", to: "https://ga.jspm.io/npm:stimulus-dropdown@2.1.0/dist/stimulus-dropdown.mjs"
pin "fslightbox", to: "https://ga.jspm.io/npm:fslightbox@3.4.1/index.js"
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
