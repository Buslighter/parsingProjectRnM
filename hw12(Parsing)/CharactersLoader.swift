//
//  CharactersLoader.swift
//  hw12(Parsing)
//
//  Created by gleba on 24.01.2022.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

class CharactersLoader{
    public func loadCharacters(completion : @escaping (PurpleData) -> Void){
        let charURL = "https://rickandmortyapi.com/api/character"
        let url = URL(string: charURL)
        
        
        var characters:PurpleData?
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!){ (data, response, error) in
            if error == nil && data != nil{
                let decoder = JSONDecoder()
                do {
                    let purpleData = try? decoder.decode(PurpleData.self, from: data!)
                    characters = purpleData
                } catch{
                    print("error in json")
                }
            }
            DispatchQueue.main.async{
                        completion(characters!)
            }
        }
        dataTask.resume()
    }
    public func loadCharactersAF(completion : @escaping (PurpleData) -> Void){
        let charURL = "https://rickandmortyapi.com/api/character"
        AF.request(charURL).responseJSON{ response in
            let objects = response.data
            var characters:PurpleData?
            let decoder = JSONDecoder()
            let purpleData = try? decoder.decode(PurpleData.self, from: objects!)
                characters = purpleData
                DispatchQueue.main.async{
                            completion(characters!)
                }
            
        }
           
    }
    
    
    
    
    
    
    
    
}






//
//
//        let request = AF.request(charURL)
//        request.responseDecodable(of: parsedata.self){ (respone) in
//            guard let data = respone.value else{
//                return}
//        }
//
//        }
//    }
            
        
    
//        AF.request(charURL, method: .get).responseJSON { response in
//                print(type(of: response))
//                print(response)
//        }
//            if let objects = response.value,
//               let jsonDict = objects as? NSDictionary,
//               let resultAr = jsonDict.object(forKey: "results") as? NSArray{
//                let  k = resultAr.value(forKey: "id")
//                let decoder = JSONDecoder()
//                let answer = try decoder.decode(headLoad.self, from: response.data!)
//                print(answer)
//                print(k)
//                print(resultAr)
//                print (jsonDict)
//                print(type(of: jsonDict))
//                print(type(of: resultAr))
                
//                print(jsonDict.allKeys)
//                print(type (of:jsonDict.object(forKey: "results")))
//                let k = jsonDict.results
//                print(k)
//                print(type(of: k))
              
//                let j = jsonDict.object(forKey: "info") as Info
//                print(type (of:deserilizedDict))
//                print(deserilizedDict![0])
//                print(k)
//                var CharactersArray : [Welcome] = []
//                CharactersArray.append(Results)
//                 print(type(of:resultAr.firstObject))
//
//                for keys in resultAr {
//
//
//                }
//                print(CharactersArray)
//
////                print(CharactersArray)
////                for ( _, data) in jsonDict where data is NSArray{
//                    if let characterInfo = Results(data: data as! NSArray)
//                    { CharactersArray.append(characterInfo)
////                        print(type (of:characterInfo))
//                    }
//
               
            
            
            
            
            
//                print(CharactersArray)
