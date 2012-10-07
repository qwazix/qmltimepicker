import QtQuick 1.1
import com.nokia.meego 1.0


Page {
    tools: commonTools

    Label {
        id: label
        anchors.centerIn: parent
        text: qsTr("Hello world!")
        visible: false
    }
    Column{
        anchors.fill: parent
        spacing: 20

//        CircularSlider{
//            id: cs
//            topValueMax: true
//            minimumValue: 0
//            maximumValue: 60

//        }
        DatePicker{
            width: parent.width
            minute: 27
            hour: 3
        }

//        Label{
//            text: cs.value
//        }
    }
}

