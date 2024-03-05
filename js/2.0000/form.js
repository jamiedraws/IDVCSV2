(function (global) {
    if ("app" in global) {
        // toggle
        const toggle = app.createContext(app);

        toggle.addProperties({
            default: function (element, states) {
                if (toggle.elementExists(element) && toggle.isObject(states)) {
                    element.classList.remove(states.success);
                    element.classList.remove(states.progress);
                }
            },
            progress: function (element, states) {
                if (toggle.elementExists(element) && toggle.isObject(states)) {
                    element.classList.remove(states.success);
                    element.classList.add(states.progress);
                }
            },
            success: function (element, states) {
                if (toggle.elementExists(element) && toggle.isObject(states)) {
                    element.classList.remove(states.progress);
                    element.classList.add(states.success);
                }
            },
            register: function (element, states) {
                return Object.create(
                    {
                        default: toggle.default.bind(toggle, element, states),
                        progress: toggle.progress.bind(toggle, element, states),
                        success: toggle.success.bind(toggle, element, states)
                    },
                    {
                        element: {
                            value: element
                        }
                    }
                );
            }
        });

        // validate
        const validate = app.createContext(app);

        validate.addProperties({
            fieldMap: new WeakMap(),
            formMap: new WeakMap(),
            handleValidationEvent: function (event) {
                const field = event.target;
                const validity = field.validity;

                if (validity.valid) {
                    field.classList.remove("message__is-invalid");
                    field.classList.add("message__is-valid");
                } else {
                    field.classList.remove("message__is-valid");
                    field.classList.add("message__is-invalid");
                }
            },
            setValidResponse: function (field, response) {
                validate.setResponseByState(field, response, "valid");
            },
            setInvalidResponse: function (field, response) {
                validate.setResponseByState(field, response, "invalid");
            },
            setResponseByState: function (field, response, state) {
                if (validate.fieldMap.has(field)) {
                    const messages =
                        validate.fieldMap.get(field).message[state];

                    messages.forEach(function (message) {
                        message.innerHTML = response;
                    });

                    field.setCustomValidity(
                        field.validity.valid ? "" : response
                    );
                }
            },
            getFieldById: function (id, form) {
                let result = false;

                if (validate.formMap.has(form)) {
                    const fields = validate.formMap.get(form);

                    result = fields.filter(function (field) {
                        return field.id === id;
                    })[0];
                }

                return result;
            },
            registerFields: function (fields) {
                fields.forEach(function (field) {
                    validate.fieldMap.set(field, {
                        message: {
                            valid: validate.toArray(
                                document.querySelectorAll(
                                    '[data-message-valid="' + field.id + '"]'
                                )
                            ),
                            invalid: validate.toArray(
                                document.querySelectorAll(
                                    '[data-message-invalid="' + field.id + '"]'
                                )
                            )
                        }
                    });
                });
            },
            processEvents: function (form) {
                const fields = validate.toArray(
                    form.querySelectorAll("[required]")
                );

                validate.formMap.set(form, fields);
                validate.registerFields(fields);
                validate.listen(fields, validate.handleValidationEvent, "blur");

                if (validate.isObject(this)) {
                    validate.processConfig(this, form, fields);
                }
            },
            processConfig: function (config, form, fields) {
                if (validate.isFunction(config.submit)) {
                    form.addEventListener("submit", config.submit);
                }

                if (validate.isFunction(config.rules)) {
                    config.rules(fields);
                }
            },
            form: function (elements, config) {
                validate
                    .toArray(elements)
                    .forEach(validate.processEvents.bind(config));
            }
        });

        // productLeadForm
        const productLeadForm = app.createContext(validate);

        productLeadForm.addProperties({
            root: document.querySelectorAll(".form--product-lead"),
            context: productLeadForm.getContextByElementId("formJs"),
            flip: document.querySelector(".form--product-lead .flip"),
            response: toggle.register(
                document.querySelector(".form--product-lead .form__response"),
                {
                    progress: "response--in-progress",
                    success: "response--success"
                }
            ),
            checkmark: toggle.register(
                document.querySelector(".form--product-lead .form__checkmark"),
                {
                    progress: "checkmark--in-progress",
                    success: "checkmark--is-checked"
                }
            ),
            toggleFlip: function () {
                if (productLeadForm.elementExists(productLeadForm.flip)) {
                    productLeadForm.flip.classList.toggle(
                        "flip--show-backside"
                    );
                }
            },
            setStatusToProgress: function () {
                productLeadForm.response.progress();
                productLeadForm.checkmark.progress();
                productLeadForm.response.element.scrollIntoView();
            },
            setStatusToSuccess: function () {
                productLeadForm.response.success();
                productLeadForm.checkmark.success();
                productLeadForm.response.element.scrollIntoView();
            },
            makeRequest: function (form) {
                const getFieldValueById = function (id) {
                    const field = productLeadForm.getFieldById(id, form);

                    return field.value;
                };

                if ("jQuery" in global) {
                    $.post(
                        productLeadForm.context.page,
                        {
                            BillingFullName:
                                getFieldValueById("BillingFullName"),
                            Email: getFieldValueById("Email"),
                            Company: getFieldValueById("Company"),
                            Description: getFieldValueById("Description"),
                            acceptOffer: "acceptOffer",
                            RemoteType: "ProductLead",
                            CardType: "none"
                        },
                        function () {
                            productLeadForm.setStatusToSuccess();

                            $.post(
                                productLeadForm.context.page,
                                {
                                    createOrder: "createOrder",
                                    RemoteType: "Lead"
                                },
                                function () {
                                    $.get(
                                        "/ActivateVisitor?covid=" +
                                            productLeadForm.context.covid
                                    );
                                }
                            );
                        }
                    );
                }
            },
            validate: function () {
                productLeadForm.form(productLeadForm.root, {
                    rules: function (fields) {
                        const handleValidationEvent = function (event) {
                            const field = event.target;
                            const validity = field.validity;

                            if (validity.valid) {
                                productLeadForm.setValidResponse(
                                    field,
                                    "Accepted."
                                );
                            }
                        };

                        productLeadForm.listen(
                            fields,
                            handleValidationEvent,
                            "keyup"
                        );
                    },
                    submit: function (event) {
                        event.preventDefault();
                        const form = event.target;

                        if (form.reportValidity()) {
                            productLeadForm.toggleFlip();
                            productLeadForm.setStatusToProgress();
                            productLeadForm.makeRequest(form);
                        }

                        return false;
                    }
                });
            }
        });

        productLeadForm.validate();
    }
})(window);
