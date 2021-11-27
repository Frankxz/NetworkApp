//
//  CharacterImageView.swift
//  NetworkApp
//
//  Created by Robert Miller on 02.09.2021.
//

import UIKit

class CharacterImageView: UIImageView {
    func fetchImage(from url: String) {
        guard let imageURL = URL(string: url) else {
            return }
        
        // Если есть в кэше используем
        if let cachedImage = getCachedImage(from: imageURL) {
            image = cachedImage
            print("from cache")
            return
        }
        
        
        // Если изображения нет то загрузим его из сети
        NetworkManager.shared.fetchImage(url: imageURL) { data, response in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                print("fetched")
            }
            //save to cache
            self.saveDataToCache(with: data, and: response)
            print("saved")
        }
        
        
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        print("No catched")
        return nil
        
    }
    
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let urlResponse = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        
        let request = URLRequest(url: urlResponse)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
    
    
}
