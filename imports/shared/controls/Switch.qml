/****************************************************************************
**
** Copyright (C) 2016 Pelagicore AG
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL-QTAS$
** Commercial License Usage
** Licensees holding valid commercial Qt Automotive Suite licenses may use
** this file in accordance with the commercial license agreement provided
** with the Software or, alternatively, in accordance with the terms
** contained in a written agreement between you and The Qt Company.  For
** licensing terms and conditions see https://www.qt.io/terms-conditions.
** For further information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.1

import controls 1.0
import utils 1.0

UIElement {
    id: root

    property bool checked: false

    hspan: 3; vspan: 2

    Row {
        anchors.centerIn: parent
        Label {
            hspan: 1
            vspan: 2
            text: root.checked?'ON':'OFF'
            font.pixelSize: Style.fontSizeS
            horizontalAlignment: Qt.AlignHCenter
        }
        Item {
            width: Style.hspan(2)
            height: Style.vspan(2)
            Image {
                id: background
                anchors.centerIn: parent
                source: Style.icon('cloud_switch_background')
                rotation: 180
                asynchronous: true
            }
            Image {
                id: iconOff
                anchors.verticalCenter: background.verticalCenter
                anchors.right: background.horizontalCenter
                anchors.rightMargin: -10
                source: Style.icon('cloud_switch_toggle_off')
                asynchronous: true
            }
            Image {
                id: iconOn
                visible: false
                anchors.verticalCenter: background.verticalCenter
                anchors.left: background.horizontalCenter
                anchors.leftMargin: -10
                source: Style.icon('cloud_switch_toggle_on')
                asynchronous: true
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.checked = !root.checked
    }

    states: [
        State {
            name: "checked"
            when: root.checked

            PropertyChanges { target: iconOn; visible: true }
            PropertyChanges { target: iconOff; visible: false }
            PropertyChanges { target: background; rotation: 0 }
        }
    ]
}

