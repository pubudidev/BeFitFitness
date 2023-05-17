//
//  AuthAPIService.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/17/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {

     // Creating a singleton to access this service accross the appication
     public static let shared = AuthService()
     private init() {}

     // use command + option + / or ? to genarate documentation
     
     /// A method to register the user
     /// - Parameters:
     ///   - userRequest: user reques will cantain the needed parameters for the user registration
     ///   - completion: This will execute after registratin has happend or failed. base on that we can handle what e want to do next. basicaly work like async/callback
     ///   - Bool: will tell user creation has happend correctly or not.
     ///   - Error?: if firebase provides an error
     public func registerUser(with userRequest: RegiserUserAPIRequest, completion: @escaping (Bool, Error?)->Void) {
         let username = userRequest.username
         let email = userRequest.email
         let password = userRequest.password

         Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            // if we got an error this guard clause will privent the execution of the appication further more.
             if let error = error {
                 completion(false, error)
                 return
             }

             guard let resultUser = result?.user else {
                 completion(false, nil)
                 return
             }

            // create the datbase object to connect with firebase
            // find the users collection / create it if not yet created
            // create a document and register the user
            // registern will handle throught the firebase services
             let db = Firestore.firestore()

             db.collection("users")
                 .document(resultUser.uid)
                 .setData([
                     "username": username,
                     "email": email
                 ]) { error in
                     if let error = error {
                         completion(false, error)
                         return
                     }
                     completion(true, nil)
                 }
         }
     }
}
