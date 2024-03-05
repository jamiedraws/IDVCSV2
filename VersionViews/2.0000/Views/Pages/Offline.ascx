<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Offline</title>
        <link rel="stylesheet" href="/css/2.0000/dist/shell.rev-1.css" />
        <style>
            @keyframes pulse-ring {
                0% {
                    transform: scale(1);
                    opacity: 1;
                }

                100% {
                    transform: scale(1.5);
                    opacity: 0;
                }
            }

            .idv-icon {
                width: 2em;
                margin: auto;
            }

            .idv-icon svg {
                overflow: visible;
            }

            .idv-icon__sphere {
                fill: url(#IDV-circle-gradient);
            }

            .idv-icon__ring {
                fill: #fdb927;
                transform-origin: center 30%;
            }

            .idv-icon__block {
                fill: #e03a3e;
            }

            .response--success .response__pulse {
                animation: pulse-ring 2s infinite;
            }
        </style>
    </head>
    <body>
        <main
            aria-labelledby="main-title"
            class="view content content--title-text response"
        >
            <div class="response__icon">
                <div class="idv-icon">
                    <svg x="0" y="0" viewBox="0 0 165.4 181.2">
                        <radialGradient
                            id="IDV-circle-gradient"
                            cx="82.7122"
                            cy="88.2695"
                            r="82.7122"
                            gradientUnits="userSpaceOnUse"
                        >
                            <stop offset="0" style="stop-color: #ffffff" />
                            <stop offset="0.4406" style="stop-color: #fcfcfc" />
                            <stop offset="0.7939" style="stop-color: #f2f2f2" />
                            <stop offset="1" style="stop-color: #e8e8e8" />
                        </radialGradient>
                        <circle
                            class="idv-icon__sphere"
                            cx="82.7"
                            cy="88.3"
                            r="82.7"
                        />
                        <g>
                            <path
                                class="idv-icon__ring"
                                d="M82.3,105.4c-29,0-52.7-23.7-52.6-52.7C29.7,23.6,53.3,0,82.4,0c29,0,52.7,23.7,52.6,52.7
                            C135,81.8,111.3,105.4,82.3,105.4z M82.4,10.2c-23.4,0-42.5,19-42.5,42.4c0,23.4,19,42.5,42.4,42.5c23.4,0,42.5-19,42.5-42.4
                            C124.8,29.3,105.8,10.2,82.4,10.2z"
                            />
                            <path
                                class="idv-icon__ring response__pulse"
                                d="M82.3,105.4c-29,0-52.7-23.7-52.6-52.7C29.7,23.6,53.3,0,82.4,0c29,0,52.7,23.7,52.6,52.7
                        C135,81.8,111.3,105.4,82.3,105.4z M82.4,10.2c-23.4,0-42.5,19-42.5,42.4c0,23.4,19,42.5,42.4,42.5c23.4,0,42.5-19,42.5-42.4
                        C124.8,29.3,105.8,10.2,82.4,10.2z"
                            />
                            <g>
                                <path
                                    d="M68.5,51.3c0-1.9,0.4-3.6,1.1-5.3c0.7-1.6,1.7-3.1,2.9-4.3c1.2-1.2,2.7-2.2,4.3-2.9c1.6-0.7,3.4-1.1,5.3-1.1
                                c1.9,0,3.6,0.4,5.3,1.1c1.6,0.7,3.1,1.7,4.3,2.9c1.2,1.2,2.2,2.7,2.9,4.3c0.7,1.6,1.1,3.4,1.1,5.3c0,1.9-0.4,3.6-1.1,5.3
                                c-0.7,1.6-1.7,3.1-2.9,4.3c-1.2,1.2-2.7,2.2-4.3,2.9c-1.6,0.7-3.4,1.1-5.3,1.1c-1.9,0-3.6-0.4-5.3-1.1c-1.6-0.7-3.1-1.7-4.3-2.9
                                c-1.2-1.2-2.2-2.7-2.9-4.3C68.8,54.9,68.5,53.1,68.5,51.3z M94.2,77.6l-0.1,68.4l-24.1,0L70,77.5L94.2,77.6z"
                                />
                            </g>
                        </g>
                        <rect
                            x="70"
                            y="164.7"
                            class="idv-icon__block"
                            width="23.9"
                            height="16.4"
                        />
                    </svg>
                </div>
            </div>
            <div class="response__status">
                <div class="response__progress">
                    <div class="content__title">Offline</div>
                    <p>
                        Your connection went offline there! We'll notify you
                        when you're connected again.
                    </p>
                </div>
                <div class="response__success">
                    <div class="content__title">Online</div>
                    <p>
                        You're connected again! Please try to reload the page.
                    </p>
                    <button onclick="javascript:window.location.reload();" class="button response__button">
                        <svg class="icon">
                            <use xlink:href="#icon-reload" href="#icon-reload"></use>
                        </svg>&nbsp;
                        Reload
                    </button>
                </div>
            </div>
        </main>
        <script>
            (function () {
                const showOfflineResponse = function (element, states) {
                    element.classList.remove(states.success);
                    element.classList.add(states.progress);
                };

                const showOnlineResponse = function (element, states) {
                    element.classList.remove(states.progress);
                    element.classList.add(states.success);
                };

                const handleNetworkResponse = function (element, states) {
                    addEventListener(
                        "offline",
                        showOfflineResponse.bind(element, element, states)
                    );
                    addEventListener(
                        "online",
                        showOnlineResponse.bind(element, element, states)
                    );

                    navigator.onLine
                        ? showOnlineResponse(element, states)
                        : showOfflineResponse(element, states);
                };

                handleNetworkResponse(document.querySelector(".response"), {
                    progress: "response--in-progress",
                    success: "response--success"
                });
            })();
        </script>
        <span class="svg-symbols">
            <svg>
                <symbol id="icon-reload" viewBox="0 0 32 32">
                    <path fill="currentColor" d="M26.034 16.767l-4.090-4.090h2.396c-0.022-0.060-0.045-0.119-0.068-0.178-1.421-3.602-4.933-6.15-9.040-6.15-5.365 0-9.715 4.35-9.715 9.715s4.35 9.716 9.715 9.716c3.947 0 7.344-2.354 8.864-5.733 0.015-0.031 0.024-0.066 0.038-0.099l2.605 2.589c-0.017 0.030-0.029 0.064-0.047 0.096-0.004 0.007-0.008 0.014-0.012 0.020-2.299 3.972-6.594 6.643-11.513 6.643-7.34-0.002-13.292-5.954-13.292-13.296s5.952-13.294 13.294-13.294c6.138 0 11.303 4.158 12.833 9.812 0.015 0.052 0.019 0.107 0.032 0.159h2.091l-4.091 4.090z"></path>
                </symbol>
            </svg>
        </span>
    </body>
</html>
