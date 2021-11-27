//
//  MainCollectionViewController.swift
//  NetworkApp
//
//  Created by Robert Miller on 08.08.2021.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let itemsPerRow: CGFloat = 2
    
    var characters: [BBCharacter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBBCharacters()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        activityIndicator.startAnimating()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CharacterCell
        let character = characters[indexPath.item]
        cell.configure(with: character)
        activityIndicator.stopAnimating()
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoViewController else { return }
        let cell = sender as! CharacterCell
        
        infoVC.character = cell.character
        infoVC.fetchImage()
    }
    
}

// MARK: - Network
extension MainCollectionViewController {
    func fetchBBCharacters() {
        let url =  "https://www.breakingbadapi.com/api/characters"
        NetworkManager.shared.fetchCharacters(with: url) { characters in
            self.characters = characters
            self.collectionView.reloadData()
        }
    }
}

// MARK: - CollectionView FlowLayout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInserts.left
    }
}

