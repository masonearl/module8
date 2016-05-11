//
//  PlaylistController.swift
//  Playlist
//
//  Created by Mason Earl on 5/11/16.
//  Copyright © 2016 Earl Clyde. All rights reserved.
//

import Foundation

class PlaylistController {
    
    static let sharedInstance = PlaylistController()
    
    var playlists = [Playlist]()

    
    func addPlaylist(name:String) {
        let playlist = Playlist(name: name, songs: [])
        playlists.append(playlist)
        
}
    func deletlePlaylist(playlist: Playlist) {
        guard let indexOfPlaylist = playlists.indexOf(playlist) else {
        
            return
        }
        playlists.removeAtIndex(indexOfPlaylist)
        
    }

    func addSongToPlaylist(song: Song, playlist: Playlist) {
        playlist.songs.append(song)
    
    }
    
    func removeSongFromPlaylist(song: Song, playlist: Playlist) {
        guard let indexOfSong = playlist.songs.indexOf(song) else {
            return
        }
        playlist.songs.removeAtIndex(indexOfSong)
    }
}