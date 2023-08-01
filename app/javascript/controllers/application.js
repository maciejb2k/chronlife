import { Application } from "@hotwired/stimulus";

import Notification from "stimulus-notification";
import Dropdown from "stimulus-dropdown";
import TextareaAutogrow from "stimulus-textarea-autogrow";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

// Stimulus Components
application.register("notification", Notification);
application.register("dropdown", Dropdown);
application.register("textarea-autogrow", TextareaAutogrow);

export { application };
