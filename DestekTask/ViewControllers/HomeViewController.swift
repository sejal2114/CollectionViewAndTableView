//
//  ViewController.swift
//  DestekTask
//
//  Created by Sejal on 12/04/23.
//

import UIKit
class HomeViewController: UIViewController  {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let images = [UIImage(named: "user"), UIImage(named: "bell"), UIImage(named: "chat"), UIImage(named: "home"), UIImage(named: "instagram"),UIImage(named: "lock"), UIImage(named: "next"), UIImage(named: "setting"), UIImage(named: "apps")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
        setDelegates()
        registerXib()
        setLayout()
    }
    
    func setDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func registerXib(){
        let nib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ImageCollectionViewCell")
    }
    
    func setLayout(){
        let layout = UICollectionViewFlowLayout()
        let width = view.frame.size.width / 2 - 10
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
    }
}

extension HomeViewController: UICollectionViewDataSource ,UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        if let image = images[indexPath.row] {
            cell.iconImageView.image = image
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        print("Tapped \(indexPath.row)")
    }
}

