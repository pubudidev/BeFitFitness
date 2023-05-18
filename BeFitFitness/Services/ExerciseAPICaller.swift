//
//  ExerciseAPICaller.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/18/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ExerciseAPICaller {
    
    // Create a shared isntant to access this from anyware in application
    static let shared = ExerciseAPICaller()
    
    public func getExercises(completion: @escaping (Result<[Exersice?], Error>) -> Void) {
        
        let db = Firestore.firestore()
        let collection = db.collection("Exercises")
        
        collection.getDocuments { result, error in
            guard let data = result, error == nil else {
                return
            }
            
            let exerciseCollection =  data.documents.map{ doc -> Exersice in
                print(doc.data())
                let docSnapShot = doc.data()
                
                let media_type = docSnapShot["media_type"] as? String
                let original_name = docSnapShot["original_name"] as? String
                let original_title = docSnapShot["original_title"] as? String
                let poster_path = docSnapShot["poster_path"] as? String
                let overview = docSnapShot["overview"] as? String
                let calories_count = docSnapShot["calories_count"] as? Int
                let reps_and_sets = docSnapShot["reps_and_sets"] as? String
                let minute_average = docSnapShot["minute_average"] as? String
                let video_URL = docSnapShot["video_URL"] as? String
                
                return Exersice(id: doc.documentID, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average, video_URL: video_URL)
            }
            
            completion(.success(exerciseCollection))
        }
        completion(.failure(APIError.failedTogetData))
    }
    
    func getUpcomingExercises(completion: @escaping (Result<[Exersice], Error>) -> Void) {
        let db = Firestore.firestore()
        let collection = db.collection("Exercises")
        
        collection.getDocuments { result, error in
            guard let data = result, error == nil else {
                completion(.failure(APIError.failedTogetData))
                return
            }
            
            let exersicesCollection =  data.documents.map{ doc -> Exersice in
                //print(doc.data())
                let docSnapShot = doc.data()
                
                let media_type = docSnapShot["media_type"] as? String
                let original_name = docSnapShot["original_name"] as? String
                let original_title = docSnapShot["original_title"] as? String
                let poster_path = docSnapShot["poster_path"] as? String
                let overview = docSnapShot["overview"] as? String
                let calories_count = docSnapShot["calories_count"] as? Int
                let reps_and_sets = docSnapShot["reps_and_sets"] as? String
                let minute_average = docSnapShot["minute_average"] as? String
                let video_URL = docSnapShot["video_URL"] as? String
                
                return Exersice(id: doc.documentID, media_type: media_type, original_name: original_name, original_title: original_title, poster_path: poster_path, overview: overview, calories_count: calories_count, reps_and_sets: reps_and_sets, minute_average: minute_average, video_URL: video_URL)
            }
            
            completion(.success(exersicesCollection))
        }
    }
    
    func getExercise(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(YoutubeSearchAPIResponse.self, from: data)
                
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
