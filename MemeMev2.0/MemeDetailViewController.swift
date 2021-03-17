//
//  MemeDetailViewController.swift
//  MemeMev2.0
//
//  Created by Abhijit Apte on 17/03/21.
//

import UIKit

class MemeDetailViewController: UIViewController {
	
	var meme: Meme?
	
	@IBOutlet weak var originalImage: UIImageView!
	@IBOutlet weak var topLabel: UILabel!
	@IBOutlet weak var bottomLabel: UILabel!
	@IBOutlet weak var memedImage: UIImageView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		self.memedImage?.image = meme?.memedImage
		self.originalImage?.image = meme?.originalImage
		self.topLabel?.text = meme?.topText
		self.bottomLabel?.text = meme?.bottomText
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
