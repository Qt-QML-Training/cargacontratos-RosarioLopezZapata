import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.0

import QtQuick.Dialogs 1.0
import templatehandler.interface 1.0

ApplicationWindow{
    id:window
    width: 640
    height: 480
    visible: true
    title: "Contract Generator"

    FileDialog {
        id: loadTemplate
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            var url = loadTemplate.fileUrl
            url = url.toString();

            url =url.split("///home/rosario/")[1];
            url="../../"+url;
            print("tanta gloria",url);

           templateHandler.cargarTemplate(url);
           print("esperado por el mundo",templateHandler.obtenerCampos());
           vista.model= templateHandler.obtenerCampos();

        }
        onRejected: {
            console.log("Canceled")
            Qt.quit()
        }
    }

    menuBar: MenuBar{

        Menu{
            title: "&File"
            MenuItem{
                id: menuFile
                text:"&Open Template"
                onTriggered:{
                    console.log("holi")
                    loadTemplate.open();
                }
            }
        }
  }
    TemplateHandler{
        id: templateHandler
    }

    Rectangle{
        id: barraMenu
        color:"#3C9391"
        width: window.width
        height: window.height
    }
    ListView{
        id: vista
        anchors.fill: parent
        spacing:25
        delegate: delegado

        Component{
            id: delegado

            InputField{
              height: 50
              id: textoDelegado1
              width: window.width-30
              label:modelData
              color: "#51606F"
              input: input
           }
         }
    }
    Boton{
        texto: "Generate PDF"
        anchors.bottom: barraMenu.bottom
        anchors.bottomMargin: 30
        anchors.right: barraMenu.right
        anchors.rightMargin: 7
        color:"#1D456B"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                for(let i=0;i<vista.count;i++){
                    vista.currentIndex = i;
                    let campito=vista.currentItem.label;
                    let valor=vista.currentItem.input;
                    templateHandler.completarCampo(campito,valor);
                }
                templateHandler.guardarPDF("../../Qt-ejercicios/cargandingContract/Guadanding.pdf")
            }
        }
    }
}
