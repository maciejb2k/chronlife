import { Application } from "@hotwired/stimulus";
import Notification from "stimulus-notification";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

// Stimulus Component
application.register("notification", Notification);

export { application };
