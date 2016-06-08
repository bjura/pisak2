import QtQuick.Layouts 1.2


GridLayout {
    columns: 5

    function __changeCharSet(setName) {
        for(var i = 0; i < children.length; i++) {
            children[i].changeText(setName)
        }
    }

    function defaultCharSet() {
        __changeCharSet("default")
    }

    function special1CharSet() {
        __changeCharSet("special1")
    }

    function special2CharSet() {
        __changeCharSet("special2")
    }
}
