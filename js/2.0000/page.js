(function (global) {
    if ("app" in global) {
        // defer
        const defer = app.createContext(app);

        defer.addProperties({
            updateContainer: function (placeholder, element, state) {
                let operation = state === true ? "add" : "remove";

                if (
                    this.elementExists(placeholder) &&
                    this.elementExists(element)
                ) {
                    placeholder.classList[operation]("defer--success");
                    element.classList[operation]("defer__success");
                }
            },
            setContainer: function (placeholder) {
                const element = placeholder.querySelector(".defer__progress");

                return Object.create(
                    {},
                    {
                        show: {
                            value: this.updateContainer.bind(
                                this,
                                placeholder,
                                element,
                                true
                            )
                        },
                        hide: {
                            value: this.updateContainer.bind(
                                this,
                                placeholder,
                                element,
                                false
                            )
                        }
                    }
                );
            },
            revealContainers: function () {
                const placeholders = app.toArray(
                    document.querySelectorAll(".defer")
                );
                placeholders.forEach(function (placeholder) {
                    const container = defer.setContainer(placeholder);
                    container.show();
                });
            },
            isAvailable: function (selector, response) {
                let result = response || false;
                if (this.isString(selector)) {
                    const element = document.querySelector(selector);
                    if (this.elementExists(element)) {
                        result = element;
                    }
                }
                return result;
            },
            viewElement: function (config, inRangeCallback, outRangeCallback) {
                if (this.isObject(config)) {
                    let element = this.isAvailable(config.selector);

                    if (element && this.isString(config.state)) {
                        element = this.isAvailable(config.neighbor, element);

                        if (app.require(["observer"])) {
                            const func = function () {},
                                inRange = inRangeCallback || func,
                                outRange = outRangeCallback || func;

                            app.observer.watch({
                                selector: config.selector,
                                inRange: inRange.bind(element, config),
                                outRange: outRange.bind(element, config),
                                unObserve: false
                            });
                        }
                    }
                }
            }
        });

        defer.revealContainers();

        app.require(["observer"], function () {
            app.require(["lazy"], function () {
                app.observer.watch({
                    selector: "[data-src-img]",
                    inRange: function (loadItem) {
                        defer.lazy(loadItem);
                    }
                });

                app.observer.watch({
                    selector: "[data-src-iframe]",
                    inRange: function (record) {
                        defer.lazy(record, {
                            tag: "iframe",
                            src: "data-src-iframe",
                            ondemand: true
                        });
                    }
                });
            });

            app.observer.watch({
                selector: ".view--remove-nav",
                inRange: function () {
                    if (app.require(["nav"])) {
                        app.nav.hide();
                    }
                },
                outRange: function () {
                    if (app.require(["nav"])) {
                        app.nav.show();
                    }
                },
                unObserve: false,
                options: {
                    threshold: 0.1
                }
            });
        });

        defer.lock();
        app.addProperty("defer", defer);

        // nav
        const nav = app.createContext(app);
        nav.addProperties({
            label: document.querySelector(".nav__label"),
            underlay: document.querySelector(".nav__underlay"),
            toggleNavigation: function () {
                if (nav.elementExists(nav.label)) {
                    nav.label.classList.toggle("nav__label--is-selected");
                }
            },
            closeNavigation: function () {
                if (nav.elementExists(nav.label)) {
                    nav.label.classList.remove("nav__label--is-selected");
                }
            }
        });

        nav.listen(nav.label, nav.toggleNavigation);
        nav.listen(nav.underlay, nav.closeNavigation);
        nav.listen(
            document.querySelectorAll(".nav__link"),
            nav.closeNavigation
        );

        // tooltip
        const tooltip = app.createContext(app);
        tooltip.addProperties({
            rootExistsWithClassName: function (props) {
                return (
                    tooltip.elementExists(props.element) &&
                    tooltip.isString(props.name)
                );
            },
            setElementToEventTargetOrDefault: function (props, event) {
                props.element =
                    tooltip.isObject(event) && event.target
                        ? event.target
                        : props.elements.item(0);

                return props;
            },
            makeVisible: function (props) {
                if (tooltip.rootExistsWithClassName(props)) {
                    props.element.classList.add(props.name);
                }
            },
            makeInvisible: function (props) {
                if (tooltip.rootExistsWithClassName(props)) {
                    props.element.classList.remove(props.name);
                }
            },
            processVisibleEvent: function (props, event) {
                tooltip.makeVisible(
                    tooltip.setElementToEventTargetOrDefault(props, event)
                );
            },
            processInvisibleEvent: function (props, event) {
                tooltip.makeInvisible(
                    tooltip.setElementToEventTargetOrDefault(props, event)
                );
            },
            setVisibleEvents: function (props) {
                tooltip.listen(
                    props.elements,
                    tooltip.processVisibleEvent.bind(tooltip, props),
                    "mouseenter"
                );
                tooltip.listen(
                    props.elements,
                    tooltip.processVisibleEvent.bind(tooltip, props),
                    "focus"
                );
            },
            setInvisibleEvents: function (props) {
                tooltip.listen(
                    props.elements,
                    tooltip.processInvisibleEvent.bind(tooltip, props),
                    "mouseleave"
                );
                tooltip.listen(
                    props.elements,
                    tooltip.processInvisibleEvent.bind(tooltip, props),
                    "blur"
                );
                addEventListener(
                    "keydown",
                    tooltip.makeInvisibleByKey.bind(tooltip, 27, props)
                );
            },
            makeInvisibleByKey: function (keyCode, props, event) {
                if (tooltip.isObject(event) && event.keyCode === keyCode) {
                    tooltip.makeInvisible(props);
                }
            },
            register: function (elements, name) {
                const props = { elements: elements, name: name };
                tooltip.setVisibleEvents(props);
                tooltip.setInvisibleEvents(props);
            }
        });

        app.addProperty("tooltip", tooltip.register);
        app.tooltip(document.querySelectorAll(".link"), "link--is-active");
        addEventListener("ECDrawFormComplete", function () {
            app.tooltip(
                document.querySelectorAll(".checkout-option .link"),
                "link--is-active"
            );
        });

        // content reveal
        const contentReveal = app.createContext(app);

        contentReveal.addProperties({
            revealContent: function (element) {
                element.classList.add("content-reveal--is-visible");
            },
            processTask: function () {
                if (app.require(["observer"])) {
                    app.observer.watch({
                        selector: ".content-reveal",
                        inRange: contentReveal.revealContent
                    });
                }
            }
        });

        contentReveal.processTask();

        // toast
        const toast = app.createContext(app);

        toast.addProperties({
            hide: function (element) {
                if (toast.elementExists(element)) {
                    element.classList.add("toast--hidden");
                }
            },
            show: function (element) {
                if (toast.elementExists(element)) {
                    element.classList.remove("toast--hidden");
                }
            },
            handleCloseButton: function (element) {
                const close = element.querySelector(".toast__close");
                if (toast.elementExists(close)) {
                    toast.listen(close, toast.hide.bind(this, element));
                }
            },
            register: function (id) {
                let element = false;

                if (toast.isString(id)) {
                    element = document.getElementById(id);
                    if (toast.elementExists(element)) {
                        element.classList.add("toast--is-ready");
                        toast.handleCloseButton(element);
                    }
                }

                return toast.publicInterface(element);
            },
            publicInterface: function (element) {
                return Object.create(
                    {},
                    {
                        element: {
                            value: element
                        },
                        title: {
                            value: element.querySelector(
                                "#" + element.id + "-title"
                            )
                        },
                        show: {
                            value: this.show.bind(this, element)
                        },
                        hide: {
                            value: this.hide.bind(this, element)
                        },
                        respondWith: {
                            value: function (response) {
                                this.title.innerHTML = response;
                            }
                        }
                    }
                );
            }
        });

        app.addProperty("toast", toast.register);

        // networkToast
        const networkToast = app.createContext(toast);
        networkToast.addProperties({
            showOnlineResponse: function (toast) {
                toast.show();
                toast.respondWith("You are online");
            },
            showOfflineResponse: function (toast) {
                toast.show();
                toast.respondWith("You are offline");
            },
            handleStatusResponse: function (toast) {
                addEventListener(
                    "online",
                    networkToast.showOnlineResponse.bind(networkToast, toast)
                );
                addEventListener(
                    "offline",
                    networkToast.showOfflineResponse.bind(networkToast, toast)
                );
            },
            processTask: function () {
                const toast = networkToast.register("network-response");

                networkToast.handleStatusResponse(toast);
            }
        });

        networkToast.processTask();
    }

    addEventListener("DOMContentLoaded", function () {
        const m = modal({
            modal: {
                value: document.querySelector(".modal")
            },
            text: {
                value: document.querySelector(".modal__text")
            },
            stateClass: {
                value: "modal--is-visible"
            },
            focusElement: {
                value: document.querySelector(".modal__button")
            }
        });

        // apply modal
        addEventListener("beforeunload", m.show.bind(m));
        if (app.elementExists(m.focusElement)) {
            m.focusElement.addEventListener("click", m.hide.bind(m));
        }
    });
})(window);
