// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application";
import { registerControllers } from "stimulus-vite-helpers";

const controllers = import.meta.globEager("./**/*_controller.ts");
registerControllers(application, controllers);
