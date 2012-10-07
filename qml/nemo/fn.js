function func() {
    
}

var slices = new Array()


function nearestPointOnCircle(vX, vY, centerX, centerY, radius){
    var magV = Math.sqrt(vX*vX + vY*vY);
    var aX = centerX + vX / magV * radius;
    var aY = centerY + vY / magV * radius;
    return {x: aX, y:aY}
}
function getSlices(numberOfSlices,R){
    var slices = new Array();
    for (var i=0;i<numberOfSlices;i++){
        slices.push({x:R-Math.sin(2*i*Math.PI/numberOfSlices)*R,y:R-Math.cos(2*i*Math.PI/numberOfSlices)*R})
    }
    return slices;
}
function findNearestSlice(x,y, slices){
    var minDist=1000000;
    var nearest=-1;
    for (var i=0;i<slices.length;i++){
        var dist = distance(x,y,slices[i].x,slices[i].y)
        if (dist<minDist) {
            nearest = i;
            minDist = dist;
        }
    }
    return nearest;
}
function distance(x,y,xx,yy){
    return Math.sqrt(Math.pow(x-xx,2)+Math.pow(y-yy,2))
}
