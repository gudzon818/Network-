//
//  ViewController.swift
//  Network!
//
//  Created by user on 21.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let url = "https://api.punkapi.com/v2/beers"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func request() {
       fetchbeers()
    }
    
}

// MARK: - Networking
extension MainViewController {
    func fetchbeers() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(Response.self, from: data)
                let beers = response.data.beers
                print("Number of memes: \(beers.count)")
                guard let beer = beers.randomElement() else { return }
                print("Random beer: \(beer)")
            } catch let error {
              //  print(error.localizedDescription)
                print(String(describing: error))
            }
        }.resume()
        
    }
}
//
