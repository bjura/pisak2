.pragma library


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

style.button.active = {
    background: style.button.normal.background,
    foreground: style.button.normal.foreground,
    border: style.button.normal.border,
    radius: style.button.normal.radius,
    borderWidth: style.button.normal.borderWidth,
    fontFamily: style.button.normal.fontFamily,
    fontPixelSize: style.button.normal.fontPixelSize
};

style.button.focus = {
    background: style.button.normal.background,
    foreground: style.button.normal.foreground,
    border: "green",
    radius: style.button.normal.radius,
    borderWidth: style.button.normal.borderWidth,
    fontFamily: style.button.normal.fontFamily,
    fontPixelSize: style.button.normal.fontPixelSize
};

style.button.focusable = {
    background: style.button.normal.background,
    foreground: style.button.normal.foreground,
    border: "black",
    radius: style.button.normal.radius,
    borderWidth: style.button.normal.borderWidth,
    fontFamily: style.button.normal.fontFamily,
    fontPixelSize: style.button.normal.fontPixelSize
};

style.button.disabled =  {
    background: style.button.normal.background,
    foreground: style.button.normal.foreground,
    border: "grey",
    radius: style.button.normal.radius,
    borderWidth: style.button.normal.borderWidth,
    fontFamily: style.button.normal.fontFamily,
    fontPixelSize: style.button.normal.fontPixelSize
};
