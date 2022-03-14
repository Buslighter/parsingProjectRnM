//
//  CharacterViewController.swift
//  hw12(Parsing)
//
//  Created by gleba on 14.03.2022.
//

import UIKit
class characterInfo{
    let imageURL: String?
    let name: String?
    let liveStatus: String?
    let location: String?
    let episodes: [String]?
    let species: String?
    init(imageURL: String?,name: String?,liveStatus: String?,location:String?, episodes:[String]?,species: String?){
        self.imageURL = imageURL
        self.name = name
        self.episodes=episodes
        self.location=location
        self.liveStatus = liveStatus
        self.species = species
    }
}

class CharacterViewController: UIViewController {
    var character:characterInfo?
    @IBOutlet weak var episodesTableView: UITableView!
    @IBOutlet weak var speciesAndGender: UILabel!
    @IBOutlet weak var fistSeenIn: UILabel!
    @IBOutlet weak var lastKnowLocation: UILabel!
    @IBOutlet weak var liveStatusIndicator: UIView!
    @IBOutlet weak var liveStatusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageViewChar: UIImageView!
    override func viewDidLoad() {
        nameLabel.text = character?.name
        fistSeenIn.text = character?.episodes![0]
        lastKnowLocation.text = character?.location
        liveStatusLabel.text = character?.liveStatus
        speciesAndGender.text = character?.species
        if liveStatusLabel.text=="Alive"{
            liveStatusIndicator.backgroundColor = UIColor.green
        }
        let defaultImage = "https://rickandmortyapi.com/api/character/avatar/20.jpeg"
        let url = URL(string: "\(character?.imageURL ?? defaultImage)")
        DispatchQueue.main.async{
            if let data = try? Data(contentsOf: url!) {
                self.imageViewChar.image = UIImage(data: data)
            }
        }
        print(character?.imageURL)
        super.viewDidLoad()

    }


}
extension CharacterViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (character?.episodes?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = episodesTableView.dequeueReusableCell(withIdentifier: "episode cell") as! EpisodesCell
        cell.episodeText.text = character?.episodes![indexPath.row]
        return cell
    }
    
    
}
