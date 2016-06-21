.pragma library

Qt.include("lodash.js")


var style = {
    button: {}
};

var defaults = {
    fontFamily: "Helvetica",
    fontPixelSize: 20
};

style.button.normal = {
    background: "red",
    foreground: "black",
    border: "blue",
    radius: 10,
    borderWidth: 5,
    fontFamily: defaults.fontFamily,
    fontPixelSize: defaults.fontPixelSize
};

style.button.active = Qt._.clone(style.button.normal);

style.button.focus = Qt._.defaultsDeep({border: "green"},
                                    style.button.normal);

style.button.focusable = Qt._.defaultsDeep({border: "black"},
                                        style.button.normal);

style.button.disabled =  Qt._.defaultsDeep({border: "grey"},
                                        style.button.normal);
