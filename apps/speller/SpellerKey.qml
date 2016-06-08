import "../../lib/widgets"


PisakButton {
    property PisakTextArea target: ({})

    onClicked: target.typeText(text)

    property string textDefault: text
    property string textSpecial1: qsTr("")
    property string textSpecial2: qsTr("")

    function changeText(textType) {
        switch (textType) {
            case "default":
            default:
                text = textDefault
                break
            case "special1":
                text = textSpecial1
                break
            case "special2":
                text = textSpecial2
                break
        }
    }
}