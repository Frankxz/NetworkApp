//
//  MainCollectionViewController.swift
//  NetworkApp
//
//  Created by Robert Miller on 08.08.2021.
//

import UIKit



class MainCollectionViewController: UICollectionViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    var itemsPerRow: CGFloat = 2
    var characters: [BBCharacter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        fetchBBCharacters()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoViewController else { return }
        let cell = sender as! CharacterCell
    
        infoVC.navigationItem.title = cell.character.name
        infoVC.image = cell.characterImage.image
        infoVC.birthdate = cell.character.birthday
        infoVC.status = cell.character.status
        infoVC.nickname = cell.character.nickname
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
       1
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
    

}

// MARK: - Network
extension MainCollectionViewController {
    func fetchBBCharacters() {
        guard let url = URL(string: "https://www.breakingbadapi.com/api/characters") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error description")
                return
            }
            
            do {
                self.characters = try
                    JSONDecoder().decode([BBCharacter].self, from: data)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch let error{
                print(error.localizedDescription)
            }
        }.resume()
        }
}

// MARK: - CollectionView layout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem + 86)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}

