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
       fetchBeers()
    }
    
}

// MARK: - Networking
extension MainViewController {
    func fetchBeers() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode([Beer].self, from: data)
                print("\(response)")
                
            } catch let error {
                print(String(describing: error))
            }
        }.resume()
        
    }
}

