//
//  ViewController.swift
//  hw12(Parsing)
//
//  Created by gleba on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {
    var CharactersArray:PurpleData?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
          super.viewDidLoad()
                CharactersLoader().loadCharacters(completion: {characters in
                    self.CharactersArray = characters
                  DispatchQueue.main.async {self.tableView.reloadData()}
                })
            }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = tableView.indexPath(for: cell){
            tableView.deselectRow(at: index, animated: true)
            let model = (CharactersArray?.results[index.row])!
            if let vc = segue.destination as? CharacterViewController, segue.identifier == "segue"{
                vc.character=characterInfo(imageURL: model.image, name: model.name, liveStatus: model.status.rawValue, location: model.location.name, episodes: model.episode,species: model.species.rawValue+"("+model.gender.rawValue+")")
            }
        }
        
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (CharactersArray?.results.count ?? 0)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! RickNMortyCell
        let model = (CharactersArray?.results[indexPath.row])!
//        if let filePath = Bundle.main.path(forResource: "\(model.image.description)", ofType: "jpg"),let image = UIImage(contentsOfFile: filePath){
//            cell.PictureOfChar.image = image
//        }
        let url = URL(string: "\(model.image)")
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url!) {
                cell.PictureOfChar.image = UIImage(data: data)
            }
        }
        cell.location.text = "\(model.location.name)"
        cell.CharStatusText.text = "\(model.status.rawValue) - \(model.species.rawValue)"
        cell.charName.text = "\(model.name)"
       
        if model.status.rawValue=="Alive"{
            cell.StatusIndicator.backgroundColor = UIColor.green
        } else if model.status.rawValue=="unknown"{
            cell.StatusIndicator.backgroundColor = cell.backgroundColor
        } else {
            cell.StatusIndicator.backgroundColor = UIColor.red
        }
        return cell
    }
}

