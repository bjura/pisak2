.pragma library

.import "defaultSkin.js" as DefaultSkin

Qt.include("lodash.js")


var style = Qt._.cloneDeep(DefaultSkin.style);

style.button.normal.border = "yellow";

style.button.focus.border = "pink";
