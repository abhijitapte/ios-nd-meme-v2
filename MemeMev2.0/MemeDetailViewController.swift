//
//  MemeDetailViewController.swift
//  MemeMev2.0
//
//  Created by Abhijit Apte on 17/03/21.
//

import UIKit

class MemeDetailViewController: UIViewController {
	
	var meme: Meme?
	
	@IBOutlet weak var memedImage: UIImageView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		memedImage?.image = meme?.memedImage
	}

}
