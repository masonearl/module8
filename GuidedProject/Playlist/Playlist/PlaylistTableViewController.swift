//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Mason Earl on 5/11/16.
//  Copyright © 2016 Earl Clyde. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //MARK: - IBActions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        if let playlistName = playlistNameTextField.text where playlistName.characters.count > 0 {
            PlaylistController.sharedInstance.addPlaylist(playlistName)
            tableView.reloadData()
            playlistNameTextField.text = ""
            
        }
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  PlaylistController.sharedInstance.playlists.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playlistCell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.songs.count) songs"
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject? ) {
        if segue.identifier == "toSongList", let  songListTVC = segue.destinationViewController as?
            SongTableViewController, let playlistCell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(playlistCell) {
            songListTVC.playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        }
        
        
    }
    
}
