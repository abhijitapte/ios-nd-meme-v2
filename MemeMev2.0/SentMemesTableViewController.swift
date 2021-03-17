//
//  SentMemesTableViewController.swift
//  MemeMev2.0
//
//  Created by Abhijit Apte on 17/03/21.
//

import UIKit

class SentMemesTableViewController: UITableViewController {
	
	var memes: [Meme]! {
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		return appDelegate.memes
	}
	
	var detailRowIndex: Int?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.title = "Sent Memes"
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		tableView.reloadData()
	}
	
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemesTableViewCell")!
		let meme = memes[indexPath.row]
		cell.textLabel?.text = meme.topText + "..." + meme.bottomText
		cell.imageView?.image = meme.memedImage
		
		return cell
    }
	
	// MARK: - Collection view delegate
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		detailRowIndex = (indexPath as NSIndexPath).row
		performSegue(withIdentifier: "ShowSentMemeDetailFromTableViewCell", sender: self)
		
	}
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowSentMemeDetailFromTableViewCell" {
			let detailController = segue.destination as! MemeDetailViewController
			detailController.meme = memes[detailRowIndex!]
			detailRowIndex = nil
		}
	}

}
