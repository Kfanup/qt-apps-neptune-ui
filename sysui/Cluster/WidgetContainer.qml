/****************************************************************************
**
** Copyright (C) 2015 Pelagicore AG
** Contact: http://www.qt.io/ or http://www.pelagicore.com/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL3-PELAGICORE$
** Commercial License Usage
** Licensees holding valid commercial Pelagicore Neptune IVI UI
** licenses may use this file in accordance with the commercial license
** agreement provided with the Software or, alternatively, in accordance
** with the terms contained in a written agreement between you and
** Pelagicore. For licensing terms and conditions, contact us at:
** http://www.pelagicore.com.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU General Public License version 3 requirements will be
** met: http://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.0
import utils 1.0
import com.pelagicore.ApplicationManager 0.1

Item {
    id: root
    width: 700
    height: 600

    property string title: ""
    default property alias content: container.children

    Keys.onPressed: {
        if (container.children[0])
            WindowManager.setSurfaceWindowProperty(container.children[0], "keyPressed", event.key)
    }

    Item {
        id: container
        anchors.fill: parent
    }

    BorderImage {
        id: rightBorder
        width: sourceSize.width/5
        height: parent.height
        anchors.right: parent.right
        border.top: 20
        border.bottom: 20
        source: Style.gfx("cluster/right_mask")
    }

    BorderImage {
        id: leftBorder
        width: sourceSize.width/5
        height: parent.height
        anchors.left: parent.left
        border.top: 20
        border.bottom: 20
        source: Style.gfx("cluster/left_mask")
    }
}

