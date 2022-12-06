//
//  ViewController.swift
//  TableViewAndCollectionView
//
//  Created by Châu Hiệp on 01/12/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    struct RandomImage{
        let title: String
    }

    let tableData: [RandomImage] = [
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
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Custom Table View"
        table.dataSource = self
    }
    
    func getRandomPhoto() -> Data?{
        let urlString = "https://picsum.photos/200/115"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return nil
        }
        return data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let image = tableData[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.lbDescription.text = image.title
        
        cell.randomImageView.image = UIImage(data: getRandomPhoto()!)
        return cell
    }

}

