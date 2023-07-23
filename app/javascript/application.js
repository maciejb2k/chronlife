// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "fslightbox";
import "chartkick";
import "Chart.bundle";

addEventListener("turbo:load", () => {
  if (document.body.dataset.gallery === "true") {
    refreshFsLightbox();
  }
});
