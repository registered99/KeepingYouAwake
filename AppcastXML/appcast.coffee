#!/usr/bin/env coffee

Fs = require "fs"
AppcastXML = require "./AppcastXML.coffee"

appcast = new AppcastXML
    declaration: true
    indent: "\t"

appcast.setChannelConfiguration
    title: "KeepingYouAwake Changelog"
    link: "https://newmarcel.github.io/KeepingYouAwake/appcast.xml"
    description: "The most recent changes for KeepingYouAwake."

# Version 1.2
appcast.addItem
    title: "Version 1.2: Activation Timer"
    description: '''
    <ul>
        <li>There are no significant changes since beta1</li>
        <li>Tweaked the experimental <em>(and hidden)</em> notifications</li>
        <li>You can enable the notifications preview by pasting the following snippet into <em>Terminal.app</em>:<br />
            <pre><code>defaults write info.marcel-dierkes.KeepingYouAwake info.marcel-dierkes.KeepingYouAwake.NotificationsEnabled -bool YES</code></pre>
        </li>
        <li>and to disable it again:<br />
            <pre><code>defaults write info.marcel-dierkes.KeepingYouAwake info.marcel-dierkes.KeepingYouAwake.NotificationsEnabled -bool NO
        </code></pre>
        </li>
    </ul>
    '''
    date: new Date("2014-11-23 11:00:00")
    file_url: 'https://github.com/newmarcel/KeepingYouAwake/releases/download/1.2/KeepingYouAwake-1.2.zip'
    file_length: 1516803
    file_version: '120'
    file_short_version: '1.2'

# Version 1.2beta1
appcast.addItem
    title: "Version 1.2beta1: Activation Timer"
    description: '''
    <ul>
        <li>Activation timer</li>
        <li><a href="http://sparkle-project.org">Sparkle</a> integration for updates
            <ul>
                <li>Sparkle will check for updates once a day</li>
                <li>A second beta will follow in the coming days to test automatic updates</li>
            </ul>
        </li>
        <li>This is <strong>beta</strong> software. If you notice any issues, please report them <a href="https://github.com/newmarcel/KeepingYouAwake/issues/">here</a></li>
    </ul>
    '''
    date: new Date("2014-11-13 19:00:00")
    file_url: 'https://github.com/newmarcel/KeepingYouAwake/releases/download/1.2beta1/KeepingYouAwake-1.2beta1.zip'
    file_length: 1512924
    file_version: '112'
    file_short_version: '1.2beta1'

# Version 1.1
appcast.addItem
    title: "Version 1.1: Start at Login & Developer ID"
    description: '''
    <p>This release adds a "Start at Login" menu item.</p>
    <ul>
        <li>Added Developer ID signing</li>
    </ul>
    '''
    date: new Date("2014-11-13 11:11:00")
    file_url: 'https://github.com/newmarcel/KeepingYouAwake/releases/download/1.1/KeepingYouAwake-1.1.zip'
    file_length: 357603
    file_version: '110'
    file_short_version: '1.1'


Fs.writeFile 'appcast.xml', appcast.toString(), (error) =>
    throw error if error
    console.log "appcast.xml saved."
