import QtQuick 2.5
import QtQuick.Layouts 1.2
import "../../lib/scanning"


ColumnLayout {
    id: keyboard
    spacing: 5

    property SpellerTextArea textArea: ({})

    property PisakScanningGroup menuGroup: null

    readonly property PisakScanningGroup mainScanningGroup: __mainScanningGroup

    readonly property var __polishCharsMap: [["a", "c", "e", "l", "n", "o", "s", "z", "x"],
                                             ["ą", "ć", "ę", "ł", "ń", "ó", "ś", "ż", "ź"]]

    property var defaultCharSet: [["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
                                  ["a", "s", "d", "f", "g", "h", "j", "k", "l",
                                   {iconName: "nav_up", text: "", disabled: true}],
                                  ["z", "x", "c", "v", "b", "n", "m",
                                   {iconName: "nav_left", text: "", onClicked: textArea.cursorBackward},
                                   {iconName: "nav_right", text: "", onClicked: textArea.cursorForward},
                                   {iconName: "nav_down", text: "", disabled: true}]]

    property string letterCase: __uppercase ? "upper" : "lower"

    property var __currentCharSet: defaultCharSet

    property var __keyboardModel: null

    readonly property int rows: __currentCharSet.length

    property var __scanningGroups: new Array(0)

    property var __rows: new Array(0)

    property bool __uppercase: false

    property bool __polishChars: false

    property bool __backToDefaultCharSetOnKeySelected: false
    property bool __backToDefaultCharSetOnUnwind: false

    PisakScanningGroup {
        id: __mainScanningGroup
        unwind: __keyboardUnwind

        onUnwindedFromSubgroup: {
            if (__backToDefaultCharSetOnKeySelected) {
                __backToDefaultCharSetOnKeySelected = false
                setDefaultCharSet()
            }
        }

        function __keyboardUnwind(levels) {
            if (__backToDefaultCharSetOnUnwind) {
                __backToDefaultCharSetOnUnwind = false
                setDefaultCharSet()
                startScanning()
            } else { __unwind(levels) }
        }
    }

    Repeater {
        model: __keyboardModel

        RowLayout {
            id: row
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                model: modelData

                SpellerKey {
                    id: key
                    text: modelData instanceof Object ? modelData.text : modelData
                    iconName: modelData instanceof Object ? modelData.iconName : ""
                    onClicked: modelData instanceof Object && modelData.onClicked ? modelData.onClicked() :
                                                                                    keyboard.__selectKey(key)
                    state: modelData instanceof Object && modelData.disabled ? "disabled" : key.state
                }
            }

            PisakScanningGroup {
                id: group
                elements: row.children
            }

            Component.onCompleted: {
                if (index === 0) {
                    keyboard.__scanningGroups.push(keyboard.menuGroup)
                }
                keyboard.__rows.push(row)
                keyboard.__scanningGroups.push(group)
            }
        }
    }

    Component.onCompleted: {
        __mainScanningGroup.elements = __scanningGroups
    }

    on__CurrentCharSetChanged: {
        __scanningGroups = new Array(0)
        __rows = new Array(0)
        __keyboardModel = __currentCharSet
        __mainScanningGroup.elements = __scanningGroups
    }

    function setCharSet(newCharSet, flag) {
        if (flag !== "polish") { __uppercase = false }
        if (flag !== "uppercase") {__polishChars = false }
        if (newCharSet === __currentCharSet) { newCharSet = null }
        __backToDefaultCharSetOnUnwind = newCharSet !== defaultCharSet
        __currentCharSet = newCharSet || defaultCharSet
    }

    function setDefaultCharSet() {
        setCharSet(defaultCharSet)
    }

    function setUpperCase() {
        if (!__uppercase) {
            setCharSet(__currentCharSet.map(function(row) {
                return row.map(function(x){ return x instanceof Object ? x : x.toUpperCase() }) }), "uppercase")
            __uppercase = true
        } else {
            setDefaultCharSet()
        }
    }

    function setPolishChars() {
        if (!__polishChars) {
            setCharSet(__currentCharSet.map(function(row) {
                return row.map(function(x){
                    if (!(x instanceof Object)) { x.toLowerCase() }
                    var polished = x instanceof Object || __polishCharsMap[0].indexOf(x) < 0 ? x :
                        function(p){ return (__uppercase ? p.toUpperCase() : p) }.call(
                            keyboard, __polishCharsMap[1][__polishCharsMap[0].indexOf(x)])
                    return polished }) }), "polish")
            __polishChars = true
        } else {
            setDefaultCharSet()
        }
    }

    function __selectKey(key) {
        textArea.typeText(key.text)
        if (__currentCharSet !== defaultCharSet) { __backToDefaultCharSetOnKeySelected = true }
    }
}
