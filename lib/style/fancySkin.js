.pragma library

import _ from "lodash"

.import "defaultSkin.js" as DefaultSkin


var style = _.cloneDeep(DefaultSkin.style);

style.button.normal.border = "yellow";

style.button.focus.border = "pink";
