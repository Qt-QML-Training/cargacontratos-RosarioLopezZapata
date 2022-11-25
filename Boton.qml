import QtQuick 2.0

Item {
    id: boton
    width: 150
    height: 50

    property alias texto: textoBoton.text
    property color color: "#3574B3"
    property color colortext: textoBoton.color
    property alias radius: rectanguloBoton.radius

    signal clicked()

    Rectangle {
        id: rectanguloBoton
        color: boton.color
        radius: height / 5
        anchors.fill: parent

        Text {
            id: textoBoton
            text: "Boton"
            font.pointSize: boton.height / 4
            anchors.centerIn: parent
            color: Qt.lighter(boton.color)
        }
    }

    MouseArea {
        id: mouseAreaBoton
        anchors.fill: parent
        onPressed: {
            rectanguloBoton.color = Qt.darker(boton.color)
        }

        onReleased: {
            rectanguloBoton.color = boton.color
        }

        onClicked: {
            boton.clicked()
        }
    }
}
