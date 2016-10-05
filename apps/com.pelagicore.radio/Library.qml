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
import QtQuick.Layouts 1.0

import controls 1.0
import utils 1.0
import "."

UIElement {
    id: root
    hspan: 12
    vspan: 22

    signal close()

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Tool {
        id: closeButton
        vspan: 2
        hspan: 2

        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 35
        name: 'close'
        onClicked: root.close()
    }

    TabView {
        id: tabView
        vspan: root.vspan - 2
        hspan: root.hspan
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        horizontalAlignment: false
        viewLeftMargin: letterPicker.width
        tabWidth: 2
        tabs: [
            { title : "ALL", url : library, properties : {} },
            { title : "FAVS", url : favs, properties : { type: "favorites" } }
        ]

    }

    LetterPicker {
        id: letterPicker
        vspan: root.vspan - 3
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        numOfVisibleLetters: 17
    }

    LibraryList {
        id: library
        visible: false
    }

    LibraryList {
        id: favs
        visible: false
    }
}
