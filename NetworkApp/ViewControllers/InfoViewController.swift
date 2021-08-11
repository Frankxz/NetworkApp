//
//  InfoViewController.swift
//  NetworkApp
//
//  Created by Robert Miller on 08.08.2021.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
  
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    var img: UIImage!
    
    var character: BBCharacter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = img
        birthDateLabel.text = "Birth date: \(character.birthday ?? "Unknown")"
        statusLabel.text = "Status: \(character.status ?? "Unknown")"
        nicknameLabel.text = "Nickname: \(character.nickname ?? "Unknown")"
    }
    func fetchImage() {
        guard let imageData = NetworkManager.shared.fetchImage(with: character.img) else {return}
        img = UIImage(data: imageData)
    }
}
