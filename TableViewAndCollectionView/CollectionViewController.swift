//
//  CollectionViewController.swift
//  TableViewAndCollectionView
//
//  Created by Châu Hiệp on 01/12/2022.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate ,UICollectionViewDataSource {
    @IBOutlet weak var collection: UICollectionView!
    
    struct RandomImage{
        let title: String
    }

    let collectionData: [RandomImage] = [
        RandomImage(title: "Image 1"),
        RandomImage(title: "Image 2"),
        RandomImage(title: "Image 3"),
        RandomImage(title: "Image 4"),
        RandomImage(title: "Image 5"),
        RandomImage(title: "Image 6"),
        RandomImage(title: "Image 7"),
        RandomImage(title: "Image 8"),
        RandomImage(title: "Image 9"),
        RandomImage(title: "Image 10"),
        RandomImage(title: "Image 11"),
        RandomImage(title: "Image 12"),
        RandomImage(title: "Image 13"),
        RandomImage(title: "Image 14"),
        RandomImage(title: "Image 15"),
        RandomImage(title: "Image 16"),
        RandomImage(title: "Image 17"),
        RandomImage(title: "Image 18"),
        RandomImage(title: "Image 19"),
        RandomImage(title: "Image 20"),
        RandomImage(title: "Image 21"),
        RandomImage(title: "Image 21"),
        RandomImage(title: "Image 22"),
        RandomImage(title: "Image 23"),
        RandomImage(title: "Image 24"),
        RandomImage(title: "Image 25"),
        RandomImage(title: "Image 26"),
        RandomImage(title: "Image 27"),
        RandomImage(title: "Image 28"),
        RandomImage(title: "Image 29"),
        RandomImage(title: "Image 30"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Custom Collection View"
        collection.delegate = self
        collection.dataSource = self
        
    }
    
    func getRandomPhoto() -> Data?{
        let urlString = "https://picsum.photos/120/120"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return nil
        }
        return data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.randomImageView.image = UIImage(data: getRandomPhoto()!)
        return cell
    }
    

}
