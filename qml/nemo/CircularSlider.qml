// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "fn.js" as FN

BorderImage {
    source: "circularSlider.png"
    property int numberOfSteps : 0
    property real minimumValue: 0
    property variant maximumValue : 12
    property bool topValueMax : false
    property variant value : topValueMax?maximumValue:minimumValue
    property variant pressed : handle.pressed
    width: 350
    height: 350

    BorderImage {
        id: rect
        width: parent.width*0.2; height: parent.height*0.2
        source: "circularSliderHandle.png"
        x: -(Math.sin(value/(maximumValue-minimumValue)*-2*Math.PI)*(parent.width-width)/2)+parent.width/2-width/2
        y: -(Math.cos(value/(maximumValue-minimumValue)*-2*Math.PI)*(parent.height-height)/2)+parent.height/2-height/2
        Component.onCompleted: console.log(Math.sin(value/(maximumValue-minimumValue)*2*Math.PI),Math.cos(value/(maximumValue-minimumValue)*2*Math.PI));
        Text {
            id: val
            anchors.centerIn: parent;
            text: value
            font.pixelSize: 24
        }
    }

    MouseArea{
        id: handle
        property int center: parent.width/2
        property int clickpointX
        property int clickpointY
        property bool isIn
        anchors.fill: parent
        onPressed: {
            if (mouseX>rect.x&&mouseX<rect.x+rect.width&&mouseY>rect.y&&mouseY<rect.y+rect.height){
                isIn = true;
                clickpointX =  mouseX - rect.x -rect.width/2
                clickpointY =  mouseY - rect.y - rect.height/2
                console.log(clickpointX)
            } else {
                clickpointX = 0
                clickpointY = 0
                isIn = false
            }
            mouse.accepted = contains(mouseX, mouseY);
        }
        onMouseXChanged: {
            if (mouse.accepted){
                var res = FN.nearestPointOnCircle(mouseX - center - clickpointX, mouseY - center - clickpointY, center, center, center-rect.width/2)
                if (numberOfSteps>0){
                    var nearest = FN.findNearestSlice(mouseX,mouseY,FN.slices)
                    res.x = FN.slices[nearest].x;
                    res.y = FN.slices[nearest].y;
                }
                rect.x = res.x - rect.width/2
                rect.y = res.y - rect.height/2
                var range = (maximumValue-minimumValue)
                var currentAngle = (Math.atan2(res.x -center, res.y -center)+Math.PI)/(2*Math.PI)
                if (range>1) var roundAdjust = 1; else
                var roundAdjust = Math.pow(10,Math.ceil(-Math.log(range)+2))
//                console.log(roundAdjust)
                if (topValueMax && currentAngle==1) value = maximumValue;
                else value = maximumValue - currentAngle* range;
    //            console.log(value)
                val.text =  Math.round(value * roundAdjust)/roundAdjust
            }
        }
        Component.onCompleted: {
            FN.slices = FN.getSlices(numberOfSteps,center);
        }
        function contains(x, y) {
            var d = (width / 2);
            var ds = width/2-rect.width
            var dx = (x - width / 2);
            var dy = (y - height / 2);
            return (d * d > dx * dx + dy * dy)&&(ds * ds < dx * dx + dy * dy);
        }


    }


}
