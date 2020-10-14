import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("01_QML_Basic")

    property int rotationStep: 45

    Image {
        id: background
        anchors.fill: parent
        source: "qrc:/assets/background.png"
    }
    Image {
        id: stick
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.top: parent.verticalCenter
        width: parent.width*0.3
        source: "qrc:/assets/stick.png"
    }
    Image {
        id: pinWheel
        anchors.centerIn: parent
        width:  Math.min(parent.width*0.3,parent.height*0.3)
        height: width
        source: "qrc:/assets/pinwheel.png"
        Behavior on rotation {
            NumberAnimation {
                duration: 250
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            pinWheel.rotation += 90
        }
    }

    Item {
        anchors.fill: parent
        focus: true
        Keys.onLeftPressed: {
            console.log("Move left")
            pinWheel.rotation -= rotationStep
        }
        Keys.onRightPressed: {
            console.log("Move right")
            pinWheel.rotation += rotationStep
        }
    }
}
