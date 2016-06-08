import QtQuick.Controls 1.4


TextArea {
    canUndo: true

    function typeText(text) {
        insert(length, text)
    }

    function clearAll() {
        remove(0, length)
    }
}