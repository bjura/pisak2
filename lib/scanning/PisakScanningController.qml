import QtQuick 2.5
import Qt.labs.settings 1.0

/*!
    \qmltype PisakScanningController
    \brief Controller of the scanning

    Controls transitions between different scanning groups,
    receives inputs from external devices and selects elements.
*/
Item {
    id: controller

    property PisakScanningGroup mainGroup: ({})

    property bool running: false

    property var __previousGroup: ({})
    property var __currentGroup: ({})
    property var __currentGroupStrategy: ({})

    Component.onCompleted: {
        controller.__onInputMethodChange()
    }

    on__CurrentGroupChanged: {
        __currentGroupStrategy = __currentGroup.strategy
        if (__currentGroupStrategy !== undefined) {
            __currentGroupStrategy.groupExhausted.connect(__unwind)
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Space) {
            controller.__onInputEvent()
        }
    }

    function startScanning() {
        if (!running) {
            __currentGroup = mainGroup
            __runCurrentGroup()
            running = true
        }
    }

    function stopScanning() {
        if (running) {
            __stopCurrentGroup()
            running = false
        }
    }

    function goToGroup(group) {
        __stopCurrentGroup()
        __onNewGroupEntered(group)
    }

    function __runCurrentGroup() {
        __currentGroupStrategy.startCycle()
    }

    function __stopCurrentGroup() {
        __currentGroupStrategy.stopCycle()
    }

    function __onInputMethodChange() {
        var input = pisak.settings.input || "keyboard"
        if (input === "mouse-switch") {
            mouseArea.onClicked = controller.__onInputEvent()
        } else if (input === "keyboard") {
            controller.focus = true
        }
    }

    function __onNewGroupEntered(newGroup) {
        __previousGroup = __currentGroup
        __currentGroup = newGroup
        __runCurrentGroup()
    }

    function __onElementSelected(element) {
        element.select()
        // Here the select could have lead to some other group and started it - if not then do unwind:
        if (!__currentGroupStrategy.running) { __unwind() }
    }

    function __onInputEvent() {
        if (running) {
            var selected = __currentGroupStrategy.select()
            if (selected.scannableType === "ScanningGroup") {
                __onNewGroupEntered(selected)
            } else if (selected.scannableType === "ScannableElement") {
                __onElementSelected(selected)
            }
        } else { __runCurrentGroup() }
    }

    function __unwind() {
        __previousGroup = __currentGroup
        if (__currentGroup != mainGroup) {
            if (__currentGroup.parentScanningGroup) {
                __currentGroup = __currentGroup.parentScanningGroup
            } else {
                __currentGroup = mainGroup
            }
            __runCurrentGroup()
        } else {
            __goStandBy()
        }
    }

    function __goStandBy() {
        stopScanning()
    }
}
