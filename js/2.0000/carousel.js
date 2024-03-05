(function (global) {
    if ("app" in global) {
        // slide
        const slide = app.createContext(app);

        slide.addProperties({
            elements: slide.toArray(document.querySelectorAll(".slide")),
            hasSlide: function () {
                return "Slide" in global;
            },
            extendConfig: function (slideApi) {
                const config = slideApi.parent.dataset.slideConfig;

                if (config) {
                    try {
                        const keyValuePairs = JSON.parse(config);

                        Object.keys(keyValuePairs).forEach(function (key) {
                            if (slide.isFunction(slideApi[key])) {
                                slideApi[key](keyValuePairs[key]);
                            }
                        });
                    } catch (e) {
                        console.warn(
                            "There was a problem converting the data-slide-config to JSON",
                            e.message
                        );
                    }
                }
            },
            createSlideByElement: function (element) {
                let result = {};

                if (slide.elementExists(element)) {
                    const id = element.querySelector("[id]");

                    if (slide.elementExists(id)) {
                        result = Slide.into(
                            id,
                            {
                                root: element
                            },
                            function () {
                                slide.extendConfig(this);

                                return this;
                            }
                        );
                    }
                }

                return result;
            },
            processTask: function () {
                slide.elements.forEach(slide.register);
            },
            register: function (element) {
                const slideApi = slide.createSlideByElement(element);

                slide.observeImages(slideApi);
            },
            observeImages: function (slideApi) {
                if (
                    slide.elementExists(slideApi.parent) &&
                    app.require(["observer"]) &&
                    app.require(["lazy"])
                ) {
                    const selector =
                        "#" + slideApi.parent.id + " [data-src-img]";

                    app.observer.watch({
                        selector: selector,
                        inRange: function (slideItem) {
                            app.lazy(slideItem);
                        }
                    });
                }

                if (slide.isFunction(slideApi.watch)) {
                    slideApi.watch(function (index) {
                        app.lazy(slideApi.children.item(index));
                    });
                }
            }
        });

        slide.processTask();

        // fade
        const fade = app.createContext(slide);

        fade.addProperties({
            map: new WeakMap(),
            elements: fade.toArray(document.querySelectorAll(".slide--fade")),
            updateElements: function (fadeApi) {
                fadeApi.currentElement = fadeApi.parent.querySelector(
                    ".slide__item--current"
                );

                fadeApi.nextElement = fadeApi.children.item(
                    fadeApi.nextIndex()
                );
            },
            rotateToNext: function (fadeApi) {
                if (fade.elementExists(fadeApi.currentElement)) {
                    fadeApi.currentElement.classList.remove(
                        "slide__item--current"
                    );
                }

                if (fade.elementExists(fadeApi.nextElement)) {
                    fadeApi.nextElement.classList.add("slide__item--current");
                }
            },
            preloadImage: function (element) {
                if (app.require(["lazy"])) {
                    app.lazy(element, {
                        src: "data-slide-fade-src"
                    });
                }
            },
            handleRotate: function (fadeApi) {
                fade.updateElements(fadeApi);
                fade.rotateToNext(fadeApi);
            },
            startWatch: function (fadeApi) {
                if (fadeApi.isAuto()) {
                    fade.preloadImage(
                        fadeApi.children.item(
                            fadeApi.getIndex(fadeApi.nextIndex() + 1)
                        )
                    );

                    fadeApi.timeout = setTimeout(function () {
                        fade.handleRotate(fadeApi);
                        fade.startWatch(fadeApi);
                    }, fadeApi.getDelay());
                }
            },
            stopWatch: function (fadeApi) {
                if (!isNaN(fadeApi.timeout)) {
                    clearTimeout(fadeApi.timeout);
                }
            },
            enableAuto: function (element) {
                if (fade.map.has(element)) {
                    const fadeApi = fade.map.get(element);

                    fadeApi.play(true);

                    fade.updateElements(fadeApi);
                    fade.preloadImage(fadeApi.currentElement);

                    fade.preloadImage(fadeApi.nextElement);
                    fade.startWatch(fadeApi);
                }
            },
            disableAuto: function (element) {
                if (fade.map.has(element)) {
                    const fadeApi = fade.map.get(element);

                    fadeApi.pause();
                    fade.stopWatch(fadeApi);
                }
            },
            register: function (element) {
                const fadeApi = fade.createSlideByElement(element);

                fadeApi.handleRotation(false);

                fade.map.set(element, fadeApi);
            },
            processTask: function () {
                fade.elements.forEach(fade.register);

                if (app.require(["observer"])) {
                    app.observer.watch({
                        selector: ".slide--fade",
                        inRange: fade.enableAuto,
                        outRange: fade.disableAuto,
                        unObserve: false,
                        options: {
                            rootMargin: "0px 0px 10% 0px"
                        }
                    });
                }
            }
        });

        fade.processTask();

        // autoScroll
        const autoScroll = app.createContext(slide);

        autoScroll.addProperties({
            store: [],
            elements: autoScroll.toArray(
                document.querySelectorAll(".slide--will-auto-scroll")
            ),
            processTask: function () {
                autoScroll.elements.forEach(autoScroll.register);
            },
            register: function (element) {
                const autoScrollApi = autoScroll.createSlideByElement(element);

                autoScroll.store.push(autoScrollApi);
                autoScroll.createObserver(autoScrollApi);
                autoScroll.processEvents(autoScrollApi);
            },
            createObserver: function (autoScrollApi) {
                autoScrollApi.observer =
                    autoScrollApi.root.querySelector(".slide__observer");
            },
            processEvents: function (autoScrollApi) {
                autoScroll.listen(
                    autoScrollApi.root.querySelectorAll("[data-slide-play]"),
                    autoScroll.play.bind(this, autoScrollApi)
                );

                autoScroll.listen(
                    autoScrollApi.root.querySelectorAll("[data-slide-pause]"),
                    autoScroll.pause.bind(this, autoScrollApi)
                );

                autoScroll.listen(
                    autoScrollApi.root.querySelectorAll("[data-slide-start]"),
                    autoScroll.start.bind(this, autoScrollApi)
                );

                autoScroll.listen(
                    autoScrollApi.root.querySelectorAll("[data-slide-stop]"),
                    autoScroll.stop.bind(this, autoScrollApi)
                );
            },
            hasClones: function (autoScrollApi) {
                return autoScroll.elementExists(
                    autoScrollApi.parent.querySelectorAll(
                        '[data-slide-type="clone"]'
                    )
                );
            },
            addClones: function (autoScrollApi) {
                if (!autoScroll.hasClones(autoScrollApi)) {
                    const children = autoScroll.toArray(autoScrollApi.children);

                    children.forEach(function (child) {
                        const clone = autoScroll.registerClone(child);
                        autoScrollApi.parent.appendChild(clone);
                    });

                    autoScroll.observe(autoScrollApi);
                    autoScroll.observeImages(autoScrollApi);
                }
            },
            registerClone: function (child) {
                const clone = child.cloneNode(true);

                clone.setAttribute("data-slide-type", "clone");
                clone.setAttribute("aria-hidden", "true");
                clone.setAttribute("tabindex", "-1");

                return clone;
            },
            removeClones: function (autoScrollApi) {
                const children = autoScroll.toArray(
                    autoScrollApi.parent.querySelectorAll(
                        '[data-slide-type="clone"]'
                    )
                );

                children.forEach(function (child) {
                    child.remove();
                });
            },
            observe: function (autoScrollApi) {
                if (
                    autoScroll.elementExists(autoScrollApi.observer) &&
                    !autoScroll.getSlidesLoadItemStatus(autoScrollApi) &&
                    !autoScroll.isPaused(autoScrollApi)
                ) {
                    autoScrollApi.observer.scrollIntoView();

                    setTimeout(
                        autoScroll.observe.bind(autoScroll, autoScrollApi),
                        1000
                    );
                }
            },
            getSlidesLoadItemStatus: function (autoScrollApi) {
                return autoScroll
                    .toArray(autoScrollApi.children)
                    .every(function (child) {
                        return child.classList.contains("load-item--success");
                    });
            },
            isPaused: function (autoScrollApi) {
                return autoScrollApi.root.classList.contains(
                    "slide--pause-auto-scroll"
                );
            },
            start: function (autoScrollApi) {
                if (autoScroll.elementExists(autoScrollApi.root)) {
                    autoScrollApi.root.classList.add(
                        "slide--enable-auto-scroll"
                    );
                }

                autoScroll.play(autoScrollApi);
                autoScroll.addClones(autoScrollApi);
            },
            play: function (autoScrollApi) {
                if (autoScroll.elementExists(autoScrollApi.root)) {
                    autoScrollApi.root.classList.remove(
                        "slide--pause-auto-scroll"
                    );
                }
            },
            pause: function (autoScrollApi) {
                if (autoScroll.elementExists(autoScrollApi.root)) {
                    autoScrollApi.root.classList.add(
                        "slide--pause-auto-scroll"
                    );
                }
            },
            stop: function (autoScrollApi) {
                if (autoScroll.elementExists(autoScrollApi.root)) {
                    autoScrollApi.root.classList.remove(
                        "slide--enable-auto-scroll"
                    );
                }

                autoScroll.pause(autoScrollApi);
                autoScroll.removeClones(autoScrollApi);
            }
        });

        autoScroll.processTask();

        // autoScrollToggle
        const autoScrollToggle = app.createContext(autoScroll);

        autoScrollToggle.addProperties({
            element: document.querySelector("[data-slide-toggle]"),
            subscribers: [],
            subscribe: function (id, handler) {
                autoScrollToggle.subscribers.push({ id: id, update: handler });
            },
            notify: function () {
                autoScrollToggle.subscribers.forEach(function (subscriber) {
                    subscriber.update(autoScrollToggle.element.checked);
                });
            },
            toggleStatus: function (autoScrollApi) {
                switch (autoScrollToggle.element.dataset.slideToggle) {
                    case "stop":
                        autoScrollToggle.element.checked
                            ? autoScrollToggle.start(autoScrollApi)
                            : autoScrollToggle.pause(autoScrollApi);
                        break;
                    default:
                        autoScrollToggle.element.checked
                            ? autoScrollToggle.play(autoScrollApi)
                            : autoScrollToggle.pause(autoScrollApi);
                        break;
                }
            },
            toggleState: function () {
                switch (autoScrollToggle.element.dataset.slideToggle) {
                    case "stop":
                        autoScrollToggle.setToggleStateToStart();
                        break;
                }
            },
            setToggleStateToStop: function () {
                autoScrollToggle.element.dataset.slideToggle = "stop";
            },
            setToggleStateToStart: function () {
                autoScrollToggle.element.dataset.slideToggle = "start";
            },
            activateToggle: function () {
                autoScrollToggle.element.checked = true;
            },
            deactivateToggle: function () {
                autoScrollToggle.element.checked = false;
            },
            processEvents: function () {
                autoScrollToggle.store.forEach(autoScrollToggle.toggleStatus);
                autoScrollToggle.toggleState();
                autoScrollToggle.notify();
            },
            processTask: function () {
                if (autoScrollToggle.elementExists(autoScrollToggle.element)) {
                    autoScrollToggle.listen(
                        autoScrollToggle.element,
                        autoScrollToggle.processEvents
                    );
                }
            }
        });

        autoScrollToggle.processTask();

        const photoStrip = app.createContext(autoScrollToggle);

        (function () {
            let userToggleState = true;

            photoStrip.addProperties({
                element: document.querySelector(".photo-strip"),
                showToggle: function () {
                    photoStrip.element.classList.remove(
                        "photo-strip--remove-toggle"
                    );
                },
                hideToggle: function () {
                    photoStrip.element.classList.add(
                        "photo-strip--remove-toggle"
                    );
                },
                enableAutoScroll: function () {
                    photoStrip.showToggle();

                    if (userToggleState) {
                        photoStrip.activateToggle();
                        photoStrip.store.forEach(photoStrip.start);
                    }
                },
                disableAutoScroll: function () {
                    photoStrip.hideToggle();

                    photoStrip.deactivateToggle();
                    photoStrip.store.forEach(photoStrip.pause);
                },
                stopAutoScroll: function () {
                    photoStrip.deactivateToggle();
                    photoStrip.setToggleStateToStop();
                    photoStrip.store.forEach(photoStrip.stop);
                },
                processEvents: function () {
                    photoStrip.listen(
                        photoStrip.element,
                        photoStrip.stopAutoScroll,
                        "touchmove"
                    );
                },
                processTask: function () {
                    if (app.require(["observer"])) {
                        app.observer.watch({
                            selector: ".photo-strip",
                            inRange: photoStrip.enableAutoScroll,
                            outRange: photoStrip.disableAutoScroll,
                            unObserve: false
                        });
                    }

                    photoStrip.subscribe(
                        "photoStripToggleState",
                        function (checked) {
                            userToggleState = checked;
                        }
                    );
                }
            });
        })();

        photoStrip.processTask();
    }
})(window);
