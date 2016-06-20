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

style.button.active = _.clone(style.button.normal);

style.button.focus = _.extend(_.clone(style.button.normal),
                              {border: "green"});

style.button.focusable = _.extend(_.clone(style.button.normal),
                                  {border: "black"});

style.button.disabled =  _.extend(_.clone(style.button.normal),
                                  {border: "grey"});
