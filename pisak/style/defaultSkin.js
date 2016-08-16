.pragma library

.import"../js/lodash.js" as Lodash


var _ = Lodash._;

var style = {
    button: {},
    tile: {},
    textArea: {}
};

var defaults = {
    fontFamily: "Kelson Sans",
    fontPixelSize: 20
};

style.button.normal = {
    background: "white",
    foreground: "black",
    border: "black",
    radius: 0,
    borderWidth: 4,
    fontFamily: defaults.fontFamily,
    fontPixelSize: defaults.fontPixelSize
};

style.button.active = _.defaultsDeep({border: "cyan",
                                      background: "cyan",
                                      foreground: "white",
                                      feedbackAnimation: {
                                        backgroundFrom: "cyan",
                                        foregroundFrom: "white",
                                        borderFrom: "cyan",
                                        backgroundTo: "white",
                                        foregroundTo: "black",
                                        borderTo: "black"
                                      }},
                                     style.button.normal);

style.button.focus = _.defaultsDeep({border: "purple",
                                     background: "purple",
                                     foreground: "white"},
                                    style.button.normal);

style.button.focusable = _.defaultsDeep({border: "black",
                                         background: "black",
                                         foreground: "white"},
                                        style.button.normal);

style.button.disabled =  _.defaultsDeep({border: "grey",
                                         foreground: "grey"},
                                        style.button.normal);

style.tile.normal = {
    background: Qt.rgba(0.8, 0.8, 0.8, 1),
    foreground: "black",
    border: "black",
    radius: 0,
    borderWidth: 0,
    fontFamily: defaults.fontFamily,
    fontPixelSize: defaults.fontPixelSize
};

style.tile.active = _.defaultsDeep({background: "cyan",
                                    foreground: "white"},
                                   style.tile.normal);

style.tile.focus = _.defaultsDeep({background: "purple",
                                   foreground: "white"},
                                  style.tile.normal);

style.tile.focusable = _.defaultsDeep({background: "black",
                                       foreground: "white"},
                                      style.tile.normal);

style.tile.disabled =  _.defaultsDeep({foreground: "grey"},
                                      style.tile.normal);

style.textArea.cursorColor = "black"
