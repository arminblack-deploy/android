import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.1
import QtQuick.Window 2.0
import Qt.labs.settings 1.0

ApplicationWindow {

    id                  : window

    visible             : true

    width               : Screen.width
    height              : Screen.height

    title               : qsTr("hash")

    Material.theme      : Material.Dark
    Material.accent     : Material.Purple
    Material.foreground : Material.dark
    Material.primary    : Material.Purple

    Label {

        id              : lbl1
        x               : parent.width  / 2 - width  / 2
        y               : parent.height / 2 - height / 2 - 100
        text            : "Cryptographic"

    }

    RadioButton {

        id              : rb1
        text            : qsTr(" MD5")
        checked         : true
        x               : parent.width  / 2 - width  / 2 - 1
        y               : parent.height / 2 - height / 2 - 60
        onClicked       :{
            obj.printSlot("$QSETENCMD5$")
            if( txtf1.text != "" ) {
                obj.printSlot(txtf1.text)
                lbl4.text=obj.valret
            }
        }

    }

    RadioButton {

        id              : rb2
        text            : qsTr("SHA1")
        x               : parent.width  / 2 - width  / 2
        y               : parent.height / 2 - height / 2 - 25
        onClicked       :{
            obj.printSlot("$QSETENCSHA1$")
            if( txtf1.text != "" ) {
                obj.printSlot(txtf1.text)
                lbl4.text=obj.valret
            }
        }

    }

    Label {

        id              : lbl2
        x               : parent.width  / 2 - width  / 2
        y               : parent.height / 2 - height / 2 + 15
        text            : "INPUT"

    }

    TextField {

        id              : txtf1
        width           : 150
        x               : parent.width  / 2 - width  / 2
        y               : parent.height / 2 - height / 2 + 40
        onTextChanged   : {
            if(txtf1.text != "" ) {
            obj.printSlot(txtf1.text)
            lbl4.text=obj.valret
            }else {
                lbl4.text = "Empty !"
            }
        }
    }

    Label {

        id              : lbl3
        x               : parent.width  / 2 - width  / 2
        y               : parent.height / 2 - height / 2 + 90
        text            : "OUTPUT"

    }

    Label {

        id              : lbl4
        x               : parent.width  / 2 - width  / 2
        y               : parent.height / 2 - height / 2 + 125
        text            : "Empty !"
        color           : "Purple"

    }

    Button {

        id              : btn1
        x               : parent.width  / 2 - width  / 2
        y               : parent.height / 2 - height / 2 + 165
        text            : "Copy"

        onClicked :{

            if( lbl4.text != "Empty !" ) {
                obj.gethash(lbl4.text)
                gethashDialog.open()
            }

        }
    }

    Button {

    id                  : btn2
    x                   : parent.width  / 2 - width  / 2
    y                   : parent.height / 2 - height / 2 + 220
    text                : "About-Me"

    onClicked: {

        aboutDialog.open()

        }

    }

    Popup {

        id              : aboutDialog
        modal           : true
        focus           : true
        width           : 200
        contentHeight   : 150
        x               : parent.width  / 2 - width  / 2
        y               : parent.height / 2 - height / 2

        Column {

            id          : aboutColumn
            spacing     : 20

            Label {

                text    : "About"
                font.bold: true
            }

            Label {

                width   : aboutDialog.availableWidth
                text    : "details :"
                wrapMode: Label.Wrap
                font.pixelSize: 14
            }

            Label {

                width   : aboutDialog.availableWidth
                text    : "Development by arminblack\nArmin.deploy@Gmail.com\nhttps://telegram.me/apping\nLicence GPL v3.0"
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }
        }
    }

    Popup {

        id              : gethashDialog
        modal           : true
        focus           : true
        width           : 200
        contentHeight   : 210
        x               : parent.width  / 2 - width  / 2
        y               : parent.height / 2 - height / 2

        Column {

            id          : gethashColumn
            spacing     : 20

            Label {

                text    : "Clipboard"
                font.bold: true
            }

            Label {

                id      : lbx
                width   : gethashDialog.availableWidth
                text    : "Hash {\n\n" + lbl4.text + "\n\n}\n\nCopied to clipboard !"
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }

            Button {

                width   : gethashDialog.availableWidth
                text    : "Ok"
                font.pixelSize: 12
                onClicked: {
                    gethashDialog.close()
                }
            }

        }
    }

}
