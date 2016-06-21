.pragma library

import _ from "lodash"


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

style.button.active = _.clone(style.button.normal);

style.button.focus = _.defaultsDeep({border: "green"},
                                    style.button.normal);

style.button.focusable = _.defaultsDeep({border: "black"},
                                        style.button.normal);

style.button.disabled =  _.defaultsDeep({border: "grey"},
                                        style.button.normal);
