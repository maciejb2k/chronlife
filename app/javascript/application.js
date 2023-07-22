// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "fslightbox";

addEventListener("turbo:load", () => {
  if (document.body.dataset.gallery === "true") {
    refreshFsLightbox();
  }
});
