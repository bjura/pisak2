.pragma library

.import"../js/lodash.js" as Lodash


var _ = Lodash._;

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

style.button.focus = _.defaults({border: "green"},
                                    style.button.normal);

style.button.focusable = _.defaults({border: "black"},
                                        style.button.normal);

style.button.disabled =  _.defaults({border: "grey"},
                                        style.button.normal);
