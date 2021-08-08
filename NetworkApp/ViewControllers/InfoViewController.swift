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
    
    var image: UIImage!
    var birthdate: String!
    var status: String!
    var nickname: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        birthDateLabel.text = "Birth date: \(birthdate ?? "Unknown")"
        statusLabel.text = "Status: \(status ?? "Unknown")"
        nicknameLabel.text = "Nickname: \(nickname ?? "Unknown")"
    }

}
