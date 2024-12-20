import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus-loading"

const application = Application.start()
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

import "@hotwired/turbo-rails"
