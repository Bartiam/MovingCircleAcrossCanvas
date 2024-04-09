import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: root
    width: 640
    height: 480
    visible: true

    Rectangle {
        id: scene
        anchors.fill: parent

        state: "InitialState"

        Rectangle {
            id: leftRectangle
            width: 100
            height: 100
            x: 100
            y: 200
            border.width: 3
            border.color: "black"
            radius: 5
            color: "gray"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (ball.x >= rightRectangle.x)
                        scene.state = "InitialState"
                    else {
                        scene.state = "moveRight"
                        ball.x += 30
                    }
                }
            }
        }

        Rectangle {
            id: rightRectangle
            width: 100
            height: 100
            x: 300
            y: 200
            border.width: 3
            radius: 5
            color: "gray" 

            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "InitialState"
            }
        }

        Rectangle {
            id: ball;
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            color: "darkgreen"
            radius: width / 2;
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
        }

        Text {
            anchors.centerIn: leftRectangle
            text: qsTr("Move")
        }

        Text {
            anchors.centerIn: rightRectangle
            text: qsTr("Return")
        }

        states: [
            State {
                name: "moveRight"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            },
            State {
                name: "InitialState"
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + 5
                }
            }
        ]

        transitions: [
            Transition {
                from: "moveRight"
                to: "InitialState"

                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.OutBounce
                }
            }
        ]
    }
}
