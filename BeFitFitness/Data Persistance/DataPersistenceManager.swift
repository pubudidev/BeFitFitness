//
//  DataPersistenceManager.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/18/23.
//

import Foundation
import Foundation
import UIKit
import CoreData


class DataPersistenceManager {
    
    static let shared = DataPersistenceManager()
    
    func downloadTitleWith(model: Exersice, completion: @escaping (Result<Void, Error>) -> Void) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let context = appDelegate.persistentContainer.viewContext

        let item = ExerciseItems(context: context)
        
        item.id = model.id
        item.media_type = model.media_type
        item.original_name = model.original_name
        item.original_title = model.original_title
        item.poster_path = model.poster_path
        item.overview = model.overview
        item.calories_count = Int64(model.calories_count!)
        item.reps_and_sets = model.reps_and_sets
        item.minute_average = model.minute_average
        item.video_URL = model.video_URL
        
        do {
            try context.save()
            completion(.success(())) // to pass void use empty()
        } catch {
            completion(.failure(DatabasError.failedToSaveData))
        }
    }
    
    func fetchingTitlesFromDataBase(completion: @escaping (Result<[ExerciseItems], Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<ExerciseItems>
        
        request = ExerciseItems.fetchRequest()
        
        do {
            
            let workouts = try context.fetch(request)
            completion(.success(workouts))
            
        } catch {
            completion(.failure(DatabasError.failedToFetchData))
        }
    }
    
    func deleteTitleWith(model: ExerciseItems, completion: @escaping (Result<Void, Error>)-> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabasError.failedToDeleteData))
        }
        
    }
}
