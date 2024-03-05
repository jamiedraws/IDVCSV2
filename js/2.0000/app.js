(function (global) {
    global.requestIdleCallback =
        global.requestIdleCallback ||
        function (cb) {
            var start = Date.now();
            return setTimeout(function () {
                cb({
                    didTimeout: false,
                    timeRemaining: function () {
                        return Math.max(0, 50 - (Date.now() - start));
                    }
                });
            }, 1);
        };

    global.cancelIdleCallback =
        global.cancelIdleCallback ||
        function (id) {
            clearTimeout(id);
        };

    if (global.Element && !Element.prototype.closest) {
        Element.prototype.closest = function (s) {
            var matches = (
                    this.document || this.ownerDocument
                ).querySelectorAll(s),
                i,
                el = this;
            do {
                i = matches.length;
                while (--i >= 0 && matches.item(i) !== el) {}
            } while (i < 0 && (el = el.parentElement));
            return el;
        };
    }

    // add fallback support for reportValidity method
    if (!HTMLFormElement.prototype.reportValidity) {
        HTMLFormElement.prototype.reportValidity = function () {
            const requiredFields = [].slice.call(
                this.querySelectorAll("[required]")
            );

            return requiredFields.every(function (requiredField) {
                return requiredField.checkValidity();
            });
        };
    }

    const create = Object.create(
        {
            addProperty: function (property, value) {
                Object.defineProperty(this, property, {
                    enumerable: true,
                    value: value
                });
            },
            addProperties: function (properties) {
                const access = this;
                Object.keys(properties).forEach(function (property) {
                    access.addProperty(property, properties[property]);
                });
            },
            createContext: function (inherit) {
                return Object.create(
                    inherit || Object.getPrototypeOf(this),
                    {}
                );
            },
            lock: function () {
                Object.freeze(this);
            }
        },
        {}
    );

    if (typeof global.app !== "object") {
        Object.defineProperty(global, "app", {
            value: create,
            writable: false,
            configurable: false
        });
    }

    app.addProperties({
        isString: function (data) {
            return typeof data === "string";
        },
        isArray: function (data) {
            return Array.isArray(data);
        },
        isFunction: function (data) {
            return typeof data === "function";
        },
        isObject: function (data) {
            return typeof data === "object" && !this.isArray(data);
        },
        elementExists: function (element) {
            let result = false;
            if (element) {
                let length = element.length;
                if (length !== undefined) {
                    result = length;
                } else {
                    result = document.body.contains(element);
                }
            }
            return result;
        },
        toArray: function (collection) {
            let ar = [];
            if (collection !== null && typeof collection !== "undefined") {
                ar = ar.slice.call(collection);
            }
            return ar;
        },
        listen: function (eles, method, e) {
            if (this.elementExists(eles)) {
                const elements = this.toArray(eles),
                    event = e || "click";
                if (elements.length > 0) {
                    elements.forEach(function (ele) {
                        ele.addEventListener(event, method, { passive: true });
                    });
                } else {
                    eles.addEventListener(event, method, { passive: true });
                }
            }
        },
        require: function (properties, callback) {
            let status = true;
            const access = this;

            if (this.isArray(properties)) {
                properties.forEach(function (property) {
                    if (!access.hasOwnProperty(property)) {
                        status = false;
                    }
                });
                if (status && this.isFunction(callback)) {
                    callback();
                }
            }

            return status;
        },
        createElement: function (tag, attributes) {
            const element = document.createElement(tag);
            if (typeof attributes === "object") {
                Object.keys(attributes).forEach(function (attribute) {
                    element.setAttribute(attribute, attributes[attribute]);
                });
            }
            return element;
        },
        appendElement: function (tag, attributes) {
            const element = this.createElement(tag, attributes);
            document.body.appendChild(element);
            return element;
        },
        getContextByElementId: function (id) {
            let res = {};
            const element = document.getElementById(id);

            const context = element.dataset.context;
            if (this.isString(context)) {
                try {
                    const contextJson = JSON.parse(context);
                    res = contextJson;
                } catch (e) {
                    console.warn(
                        "There was a problem converting the data-context to JSON",
                        e.message
                    );
                }
            }

            return res;
        },
        requestResource: function (src, tag, attributes) {
            if (typeof src !== "string") {
                console.warn("Cannot request a resource without a valid URL");
                return false;
            }

            if (typeof tag !== "string") {
                console.warn(
                    "Cannot request a resource without a valid element"
                );
                return false;
            }

            if (typeof attributes === "object") {
                if (tag === "link") {
                    attributes.href = src;
                    attributes.rel = "stylesheet";
                } else {
                    attributes.src = src;
                }
            } else {
                if (tag === "link") {
                    attributes = { href: src, rel: "stylesheet" };
                } else {
                    attributes = { src: src };
                }
            }

            try {
                return this.appendElement(tag, attributes);
            } catch (error) {
                console.log(error);
                return false;
            }
        }
    });

    const serviceWorker = app.createContext(app);

    serviceWorker.addProperties({
        hasServiceWorker: function () {
            return "serviceWorker" in navigator;
        },
        processRegistration: function (reg) {
            reg.addEventListener(
                "updatefound",
                serviceWorker.handleUpdate.bind(serviceWorker, reg)
            );

            serviceWorker.handleControllerChange();
        },
        handleControllerChange: function () {
            let refreshing = false;

            navigator.serviceWorker.addEventListener(
                "controllerchange",
                function () {
                    if (refreshing) {
                        return false;
                    } else {
                        window.location.reload();
                        refreshing = true;
                    }
                }
            );
        },
        handleUpdate: function (reg) {
            const worker = reg.installing;

            worker.addEventListener(
                "statechange",
                serviceWorker.handleStateChange.bind(serviceWorker, worker)
            );
        },
        handleStateChange: function (worker) {
            if (
                worker.state === "installed" &&
                navigator.serviceWorker.controller
            ) {
                serviceWorker.renderUpdateView(worker);
            }
        },
        renderUpdateView: function (worker) {
            if (app.require(["toast"])) {
                const toast = app.toast("update-response");
                const reload = toast.element.querySelector(
                    "#update-response-reload-link"
                );

                if (serviceWorker.elementExists(reload)) {
                    toast.show();

                    reload.addEventListener("click", function (event) {
                        event.preventDefault();

                        worker.postMessage({ action: "skipWaiting" });
                    });
                }
            }
        },
        register: function () {
            navigator.serviceWorker
                .register("/sw.js?covid=" + covid, { scope: "/" })
                .then(serviceWorker.processRegistration)
                .catch(function (error) {
                    console.log("Registration was unsuccessful: " + error);
                });
        },
        processTask: function () {
            if (serviceWorker.hasServiceWorker()) {
                serviceWorker.register();
            }
        }
    });

    serviceWorker.processTask();
})(window);
