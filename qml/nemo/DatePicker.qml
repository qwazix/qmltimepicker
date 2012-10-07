// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    height: width
    color: "transparent"
    property int hour : 12
    property int minute : 00
    CircularSlider{
        id: cs
        topValueMax: true
        minimumValue: 0
        maximumValue: 60
        value: parent.minute
        width: parent.width
        height: parent.height
    }
    CircularSlider{
        id: csH
        topValueMax: true
        minimumValue: 0
        maximumValue: 12
        value: parent.hour
        width: parent.width*0.6
        height: parent.width*0.6
        anchors.centerIn: parent
    }
    Row{
        anchors.centerIn: parent
        Text{
            text: Math.round(csH.value)
            font.pixelSize: parent.parent.width*0.1
            color: csH.pressed?"orange":"black"
        }
        Text{
            text: ":"
            font.pixelSize: parent.parent.width*0.1
        }
        Text{
            text: Math.round(cs.value).toString().length==1?"0"+Math.round(cs.value):Math.round(cs.value)
            font.pixelSize: parent.parent.width*0.1
            color: cs.pressed?"orange":"black"
        }
    }




}
