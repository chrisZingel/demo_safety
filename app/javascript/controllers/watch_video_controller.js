import { Controller } from "@hotwired/stimulus"
import videojs from "video.js";

// Connects to data-controller="watch-video"
export default class extends Controller {
  connect() {
    console.log("connected for watch_video controller");
  }
}

