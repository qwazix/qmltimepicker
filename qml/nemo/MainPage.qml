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
    Rectangle{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 350
        height: 350

        Rectangle {
            id: rect
            width: 50; height: 50
            color: "red"
            opacity: (600.0 - rect.x) / 600
            x: parent.width/2 -1
            y: 0

            MouseArea {
                property int diameter: parent.parent.width;
                property int center: diameter/2
                property int xx: parent.x
                property int yy: parent.y
                anchors.fill: parent
                drag.target: rect
                drag.axis: Drag.XandYAxis
                drag.minimumX: {
                    if (xx-center<-20){
                        return center - Math.sqrt(Math.pow(center,2)-Math.pow(center - yy,2))
                    } else if (xx-center>20) {
                        return center + Math.sqrt(Math.pow(center,2)-Math.pow(center - yy,2))
                    } else return 0;
                }
                drag.maximumX: {
                    if (xx-center<-20){
                        return center - Math.sqrt(Math.pow(center,2)-Math.pow(center - yy,2))
                    } else if (xx-center>20) {
                        return center + Math.sqrt(Math.pow(center,2)-Math.pow(center - yy,2))
                    } else return diameter;
                }
                drag.minimumY: {
                    if (Math.abs(xx-center) < 10) {
                        if (yy<center){
                            return center - Math.sqrt(Math.pow(center,2)-Math.pow(center - xx,2))
                        } else if (yy>center) {
                            return center + Math.sqrt(Math.pow(center,2)-Math.pow(center - xx,2))
                        }
                    } else return 0;
                }
                drag.maximumY: {
                    if (Math.abs(xx-center) < 10) {
                        if (yy<center){
                            return center - Math.sqrt(Math.pow(center,2)-Math.pow(center - xx,2))
                        } else if (yy>center) {
                            return center + Math.sqrt(Math.pow(center,2)-Math.pow(center - xx,2))
                        }
                    } else return 2*center
                }
            }
            onXChanged: console.log(y)
        }
    }
}
