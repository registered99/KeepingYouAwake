#
#  AppcastXML.coffee
#  Appcast
#
#  Created by Marcel Dierkes on 23.11.2014
#  Copyright (c) 2014 Marcel Dierkes. All rights reserved.
#

XML = require "xml"

class AppcastXML
    constructor: (@options) ->
        @channel = {}
    
    setChannelConfiguration: (config) ->
        @channel = [
            {title: config.title ? ""}
            {link: config.link ? ""}
            {description: config.description ? ""}
            {language: config.language ? "en"}
        ]
    
    addItem: (item) ->
        item = [
            {title: _cdata: item.title ? ""}
            {description: _cdata: item.description ? ""}
            {pubDate: item.date.toGMTString()}
            {enclosure: [
                _attr: 
                    'url': item.file_url ? ""
                    'length': item.file_length ? ""
                    'type': 'application/octet-stream'
                    'sparkle:version': item.file_version ? ""
                    'sparkle:shortVersionString': item.file_short_version ? ""
            ]}
        ]
        @channel.push item: item

    toString: ->
        envelope = [
            rss: [
                {_attr:
                    'version': '2.0'
                    'xmlns:sparkle': 'http://www.andymatuschak.org/xml-namespaces/sparkle'
                    'xmlns:dc': 'http://purl.org/dc/elements/1.1/'
                }
                {channel: @channel}
            ]
        ]
        XML envelope, @options

module.exports = AppcastXML
