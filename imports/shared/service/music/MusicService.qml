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

pragma Singleton
import QtQuick 2.0
import QtMultimedia 5.0
import "." 1.0

QtObject {
    id: root

    property string defaultMusicApp: "com.pelagicore.music"
    property var musicProvider
    property Audio player: Audio {
        id: player
        source: currentTrack ? root.url : ""
        onVolumeChanged: {
            print('volume: ' + volume)
        }
        onStatusChanged: {
            if (status == Audio.EndOfMedia)
            nextTrack()
        }
    }

    property alias volume: player.volume

    property int currentIndex
    property int trackCount
    property var currentTrack
    property string coverPath
    property bool playing: player.playbackState === Audio.PlayingState
    property alias duration: player.duration
    property alias position: player.position
    property string currentTime: Qt.formatTime(new Date(position), 'mm:ss')
    property string durationTime: Qt.formatTime(new Date(duration), 'mm:ss')
    property int remaining: player.duration - player.position
    property string remainingTime: Qt.formatTime(new Date(remaining), 'mm:ss')
    property string url

    function musicPlay() {
        player.source = Qt.binding(function() { return currentTrack ? root.url : ""})
        play()
    }

    function play() {
        print('MusicService.play: ' + player.source)
        player.autoPlay = true
        player.play()
    }

    function pause() {
        print('MusicService.pause: ' + player.source)
        player.autoPlay = false
        player.pause()
    }

    function togglePlay() {
        if (playing) {
            pause()
        } else {
            play()
        }
    }

    function nextTrack() {
        if (root.musicProvider)
            root.musicProvider.next()
    }

    function previousTrack() {
        if (root.musicProvider)
            root.musicProvider.previous()
    }

    function selectAllAlbums() {
        provider.query = 'select distinct album, cover, artist from music'
    }

    function seek(value) {
        player.seek(value)
    }

    Component.onDestruction: {
        // required to avoid crashing qmllive
        player.autoLoad = false
        player.autoPlay = false
        player.stop()
        player.source = ''
    }
}
