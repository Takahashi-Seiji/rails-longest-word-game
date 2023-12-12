import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bar", "result"]
  static classes = ["display"]

  connect() {
    console.log(this.barTarget);

    var i = 0;

    if (i == 0) {
      i = 1;
      var elem = this.barTarget;
      var results = this.resultTarget;
      var width = 10;
      var id = setInterval(frame, 10);
      function frame() {
        if (width >= 100) {
          clearInterval(id);
          i = 0;
          if (width >= 100) {
            results.classList.remove("d-none")
          }
        } else {
          width++;
          elem.style.width = width + "%";
          elem.innerHTML = width + "%";
        }
      }
    }

    console.log(this.resultTarget);
    console.log("SIEJI");
  }
}
