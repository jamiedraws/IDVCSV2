(function (global) {
    if ("app" in global) {
        const deferVimeo = app.createContext(app);
        deferVimeo.addProperties({
            rootMap: new WeakMap(),
            iframeMap: new WeakMap(),
            hasVimeo: function () {
                return "Vimeo" in global;
            },
            getPropsByElement: function (element) {
                let result = false;

                if (deferVimeo.elementExists(element)) {
                    result = {
                        id: element.id,
                        vimeo: element.dataset.deferVimeo
                    };
                }

                return result;
            },
            showVimeo: function (map) {
                map.root.classList.add("defer-vimeo--has-vimeo");

                const props = deferVimeo.rootMap.get(map.root);
                props.isVimeoShown = true;

                deferVimeo.hideButton(map.button);
                deferVimeo.disableButtonProgressMode(map.button);
            },
            createVimeoParameterObject: function (element) {
                const parameters = element.src.split("?").pop();
                const parametersArray = parameters.split("&");
                const parametersObject = {};

                parametersArray.forEach(function (parameter) {
                    const keyValuePair = parameter.split("=");
                    parametersObject[keyValuePair[0]] = keyValuePair[1];
                });

                return parametersObject;
            },
            processPlayer: function (player, map) {
                deferVimeo.iframeMap.set(map.iframe, player);

                const parameters = deferVimeo.createVimeoParameterObject(
                    map.iframe
                );

                if (parameters.background) {
                    props.isBackgroundMode = true;
                }

                map.iframe.onload = deferVimeo.showVimeo.bind(deferVimeo, map);
            },
            showButton: function (button) {
                if (deferVimeo.elementExists(button)) {
                    button.classList.remove("shape-icon-button--is-hidden");
                }
            },
            hideButton: function (button) {
                if (deferVimeo.elementExists(button)) {
                    button.classList.add("shape-icon-button--is-hidden");
                }
            },
            enableButtonProgressMode: function (button) {
                if (deferVimeo.elementExists(button)) {
                    button.classList.add("shape-icon-button--in-progress");
                }
            },
            disableButtonProgressMode: function (button) {
                if (deferVimeo.elementExists(button)) {
                    button.classList.remove("shape-icon-button--in-progress");
                }
            },
            makeRequest: function (id, responseMethods) {
                const xhr = new XMLHttpRequest();

                xhr.addEventListener(
                    "load",
                    responseMethods.success.bind(xhr, xhr)
                );
                xhr.addEventListener("error", responseMethods.error);

                xhr.open(
                    "GET",
                    "https://vimeo.com/api/oembed.json?url=https://player.vimeo.com/video/" +
                        id
                );
                xhr.send();
            },
            preconnectToRequiredOrigins: function () {
                const origins = [
                    "https://player.vimeo.com",
                    "https://i.vimeocdn.com",
                    "https://f.vimeocdn.com",
                    "https://fresnel.vimeocdn.com"
                ];

                origins.forEach(function (origin) {
                    deferVimeo.appendElement("link", {
                        rel: "preconnect",
                        href: origin
                    });
                });
            },
            processResponse: function (response, map) {
                deferVimeo.preconnectToRequiredOrigins();
                deferVimeo.processEvent(JSON.parse(response.response), map);
            },
            processEvent: function (response, map) {
                deferVimeo.addIframeToElement(response, map);
                map.iframe.onload = deferVimeo.showVimeo.bind(deferVimeo, map);
            },
            addIframeToElement: function (response, map) {
                map.element.innerHTML = response.html;
                map.iframe = map.element.querySelector("iframe");
            },
            initializeRequest: function (map) {
                map.props = deferVimeo.getPropsByElement(map.element);

                deferVimeo.makeRequest(map.props.vimeo, {
                    success: function (response) {
                        deferVimeo.processResponse(response, map);
                    }
                });
            },
            processTask: function (root) {
                const map = {
                    root: root,
                    element: root.querySelector("[data-defer-vimeo]")
                };

                deferVimeo.rootMap.set(root, {
                    isBackgroundMode: false,
                    isVimeoShown: false,
                    map: map
                });

                deferVimeo.initializeRequest(map);
            }
        });

        app.require(["observer"], function () {
            app.observer.watch({
                selector: ".defer-vimeo",
                inRange: deferVimeo.processTask
            });
        });
    }
})(window);
