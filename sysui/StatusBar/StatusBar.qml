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

import utils 1.0
import service.statusbar 1.0
import service.settings 1.0

UIElement {
    id: root
    hspan: 24
    vspan: 2
    signal clicked()
    signal timePressAndHold();

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
        onPressAndHold: root.timePressAndHold()
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: Style.colorBlack
        opacity: 0.7
    }

    RowLayout {
        id: layout
        spacing: Style.padding
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: Style.padding
        anchors.bottomMargin: Style.padding

        width: Style.hspan(23)

        IndicatorTray {
            Layout.fillHeight: true
            model: StatusBarService.indicators
        }

        Spacer {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Weather {
            Layout.fillHeight: true
            currentTemperature: 15
            weatherIcon: "topbar_icon_rain"
        }

        DateAndTime {
            Layout.preferredWidth: Style.hspan(2)
            Layout.fillHeight: true
            timeFormat: SettingsService.clockOption.format
            currentDate: StatusBarService.currentDate
        }
    }
}
