import QtQuick 2.6
Item {
    id: inputField
    property alias color:  rectangleInputField.color
    property alias label:  rectangleInputFieldLabel.text
    property alias input: rectangleInputFieldTextInput.text

    height: rectangleInputField.height

    Rectangle{

        id: rectangleInputField
        radius:5
        width: parent.width
        height: 60
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.top: parent.top
        anchors.topMargin: 15

        Text{
            id:rectangleInputFieldLabel
            color:Qt.lighter(rectangleInputField.color)
            text: ""
            width: parent.width
            height:20
            anchors.top: parent.top
            font.pointSize: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
        }

        TextInput{
            id:rectangleInputFieldTextInput
            color: Qt.lighter(rectangleInputField.color)
            anchors.fill: parent
            width: 265
            anchors.top: parent.top
            anchors.topMargin: 26
            font.pointSize: 15
            anchors.left: parent.left
            anchors.leftMargin: 95
            focus:true
            text:""
            /*
            MouseArea{
                id: mouseAreaTextInput
               anchors.fill:parent
               cursorShape: Qt.IBeamCursor
               onClicked: {
               rectangleInputFieldTextInput.focus = true;
                }
            }
                */
            property string texto
            property bool editing
            onEditingFinished: {
                if (editing) {
                    text = texto
                    editing = false
                }
            }
     }
    }
}
