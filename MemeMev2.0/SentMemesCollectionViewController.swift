//
//  SentMemesCollectionCollectionViewController.swift
//  MemeMev2.0
//
//  Created by Abhijit Apte on 17/03/21.
//

import UIKit

private let reuseIdentifier = "SentMemesCollectionViewCell"

class SentMemesCollectionViewFlowLayout:UICollectionViewFlowLayout {
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		let attributes = super.layoutAttributesForElements(in: rect)
		var leftMargin = sectionInset.left
		var maxY: CGFloat = 2.0
		let horizontalSpacing:CGFloat = 5
		attributes?.forEach { layoutAttribute in
			if layoutAttribute.frame.origin.y >= maxY
				|| layoutAttribute.frame.origin.x == sectionInset.left {
				leftMargin = sectionInset.left
			}
			if layoutAttribute.frame.origin.x == sectionInset.left {
				leftMargin = sectionInset.left
			}
			else {
				layoutAttribute.frame.origin.x = leftMargin
			}
			leftMargin += layoutAttribute.frame.width + horizontalSpacing
			maxY = max(layoutAttribute.frame.maxY, maxY)
		}
		return attributes
	}
}

class SentMemesCollectionViewController: UICollectionViewController {
	
	@IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
	
	var detailItemIndex: Int?
	
	var memes: [Meme]! {
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		return appDelegate.memes
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationItem.title = "Sent Memes"
		
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(SentMemesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
		
		let layout = SentMemesCollectionViewFlowLayout()
		let space:CGFloat = 3.0
		let dimension = (view.frame.size.width - (2 * space)) / 3.0
		layout.minimumInteritemSpacing = space
		layout.minimumLineSpacing = space
		layout.itemSize = CGSize(width: dimension, height: dimension)
		self.collectionView.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		self.collectionView.reloadData()
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		let memeCount = self.memes.count
		return memeCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SentMemesCollectionViewCell
        // Configure the cell
		let meme = self.memes[(indexPath as NSIndexPath).row]
		
		cell.memedImage?.image = meme.memedImage
		cell.memeLabel?.text = meme.topText + "..." + meme.bottomText
		
        return cell
    }

	// MARK: UICollectionViewDelegate
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.detailItemIndex = (indexPath as NSIndexPath).row
		performSegue(withIdentifier: "ShowSentMemeDetailFromCollectionViewCell", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowSentMemeDetailFromCollectionViewCell" {
			let detailController = segue.destination as! MemeDetailViewController
			detailController.meme = self.memes[self.detailItemIndex!]
			self.detailItemIndex = nil
		}
	}

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
