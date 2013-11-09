/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    property real startTime: new Date().getTime()

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "Show Page 2"
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "black"

            Rectangle {
                id: clickRect
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: parent.height / 3
                anchors.margins: Theme.paddingLarge
                color: "lightyellow"

                Label {
                    anchors.centerIn: parent
                    text: "Double tap me"
                    color: "black"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("clicked");
                        clickLog.text = (new Date().getTime() - startTime) + "ms: clicked\n" + clickLog.text
                    }
                    onDoubleClicked: {
                        console.log("double clicked");
                        doubleClickLog.text +=  (new Date().getTime() - startTime) + "ms: double clicked\n" + doubleClickLog.text
                    }
                }
            }
            Rectangle {
                id: logRect
                anchors.top: clickRect.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                color: "lightblue"

                TextArea {
                    id: clickLog
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.verticalCenter
                    clip: true
                    text: "clicks:\n"
                }

                TextArea {
                    id: doubleClickLog
                    anchors.top: clickLog.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    clip: true
                    text: "Double clicks:\n"
                }

            }

        }

        Component.onCompleted: {
            console.log("startTime is " + startTime)
            console.log("new date time is " + new Date().getTime())
        }
    }
}


