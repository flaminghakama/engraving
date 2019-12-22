console.log('loaded lilyEasySlurs.js');

pixelsX = document.querySelector('svg').getAttribute("width").replace("mm", "") * 96 / 25.4
pixelsY = document.querySelector('svg').getAttribute("height").replace("mm", "") * 96 / 25.4
scaleX = document.querySelector('svg').getAttribute("viewBox").split(" ")[2] / pixelsX
scaleY = document.querySelector('svg').getAttribute("viewBox").split(" ")[3] / pixelsY

var slurId = 0
var currCp = null

function setCpsOnPath(path, x1, y1, x2, y2, x3, y3, x4, y4) {
    path.setAttribute("d", "M " + x1 + "," + y1 + " " +
                           "C " + x2 + "," + y2 + " " +
                                  x3 + "," + y3 + " " +
                                  x4 + "," + y4)
}

function initSlur(node) {

    //already initialized
    if (node.hasAttribute("id"))
        return

    cpsCounter = 1
    lineCounter = 1

    for (var child = node.firstChild; child !== null; child = child.nextSibling) {
        if (child.nodeName == "g") {
            for (var child2 = child.firstChild; child2 !== null; child2 = child2.nextSibling) {
                //console.log(child2.nodeName)
                if (child2.nodeName == "circle") {
                    if (!node.hasAttribute("cp" + cpsCounter + "x")) {
                        //TODO Ugly parsering, replace with a proper and safer one
                        node.setAttribute("cp" + cpsCounter + "x", child2.getAttribute("transform").replace("translate(", "").split(",")[0])
                        node.setAttribute("cp" + cpsCounter + "y", child2.getAttribute("transform").split(",")[1].trim().replace(")", ""))
                        child2.setAttribute("id", slurId + "_cp_" + cpsCounter)
                        child2.setAttribute("onmousedown", "selectCp(this)")
                    }
                    cpsCounter++
                }

                if (child2.nodeName == "line") {
                    child2.setAttribute("id", slurId + "_line_" + lineCounter)
                    lineCounter++
                }
            }
        }

        //remove "transform" attribute and set abs coords
        if (child.nodeName == "path") {
            if (child.hasAttribute("transform"))
                child.removeAttribute("transform")

            setCpsOnPath(child, node.getAttribute("cp1x"), node.getAttribute("cp1y"), node.getAttribute("cp2x"), node.getAttribute("cp2y"),
                node.getAttribute("cp3x"), node.getAttribute("cp3y"), node.getAttribute("cp4x"), node.getAttribute("cp4y"))

            child.setAttribute("id", slurId + "_path")
            child.setAttribute("fill", "none")
        }
    }

    node.setAttribute("id", slurId)

    coords = document.createElementNS('http://www.w3.org/2000/svg', 'text');
    coords.setAttribute("transform",
        "translate(" + node.getAttribute("cp1x") + "," + node.getAttribute("cp1y") + ")")
    coords.setAttribute("font-size", "2")
    coords.setAttribute("class", "lilySlurCoords")
    coords.setAttribute("id", slurId + "_coords")
    node.appendChild(coords)

    slurId++
    
}

function selectCp(cp) {

    if (!cp.hasAttribute("id"))
        return

    if (!detectLeftButton(event)) {
        event.preventDefault()
        showCoords(cp.getAttribute("id").split("_")[0])
        return
    }

    cp.setAttribute("color", "cyan")
    currCp = cp
    
}

function unselectCp() {

    if (currCp)
        currCp.setAttribute("color", "red")

    currCp = null
}

function moveCp() {

    if (!currCp)
        return

    currCp.setAttribute("transform", "translate(" + event.pageX * scaleX + "," + event.pageY * scaleY + ")")

    //get the associated path
    assocSlurId = currCp.getAttribute("id").split("_")[0]
    path = document.getElementById(assocSlurId + "_path")

    xs = []
    ys = []

    for (i = 0; i < 4; i++) {
        //TODO ugly parser again!
        xs[i] = document.getElementById(assocSlurId + "_cp_" + (i + 1)).getAttribute("transform").replace("translate(", "").split(",")[0]
        ys[i] = document.getElementById(assocSlurId + "_cp_" + (i + 1)).getAttribute("transform").split(",")[1].trim().replace(")", "")
    }

    for (i = 0; i < 3; i++) {
        document.getElementById(assocSlurId + "_line_" + (i + 1)).setAttribute("transform", "translate(" + xs[i] + "," + ys[i] + ")")
        document.getElementById(assocSlurId + "_line_" + (i + 1)).setAttribute("x2", xs[i + 1] - xs[i])
        document.getElementById(assocSlurId + "_line_" + (i + 1)).setAttribute("y2", ys[i + 1] - ys[i])
    }

    setCpsOnPath(path, xs[0], ys[0], xs[1], ys[1], xs[2], ys[2], xs[3], ys[3])

}

var as = document.querySelectorAll("a")

//Remove all "a" tags
for (var i = 0; i < as.length; i++) {
    as[i].replaceWith(...as[i].childNodes)
}

slurs = document.querySelectorAll("svg .lilySlur")

for (i = 0; i < slurs.length; i++) {
    initSlur(slurs[i])
}

function showCoords(assocSlurId) {

    xsOrig = []
    xsNew = []
    ysOrig = []
    ysNew = []

    coordsToDisplay = "\\shape #'("

    for (q = 0; q < 4; q++) {
        xsOrig[q] = document.getElementById(assocSlurId).getAttribute("cp" + (q + 1) + "x")
        xsNew[q] = document.getElementById(assocSlurId + "_cp_" + (q + 1)).getAttribute("transform").replace("translate(", "").split(",")[0]
    }

    for (q = 0; q < 4; q++) {
        ysOrig[q] = document.getElementById(assocSlurId).getAttribute("cp" + (q + 1) + "y")
        ysNew[q] = document.getElementById(assocSlurId + "_cp_" + (q + 1)).getAttribute("transform").split(",")[1].trim().replace(")", "")
    }

    for (q = 0; q < 4; q++) {
        diffX = (xsNew[q] - xsOrig[q]).toFixed(3)
        diffY = (ysOrig[q] - ysNew[q]).toFixed(3)

        coordsToDisplay += "(" + (+diffX) + " . " + (+diffY) + ") "
    }

	coordsToDisplay  = coordsToDisplay.substring(0, coordsToDisplay.length -1)
    coordsToDisplay += ") " + document.getElementById(assocSlurId).getAttribute("slurtype")

    alert(coordsToDisplay)
    
}

function detectLeftButton(evt) {

    evt = evt || window.event;
    if ("buttons" in evt) {
        return evt.buttons == 1;
    }
    var button = evt.which || evt.button;
    return button == 1;
    
}

window.oncontextmenu = (e) => {

    e.preventDefault();
    
}

document.addEventListener("mouseup", unselectCp);
document.addEventListener("mousemove", moveCp);
