//
//  DatabasError.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/18/23.
//

import Foundation

enum DatabasError: Error {
    case failedToSaveData
    case failedToFetchData
    case failedToDeleteData
}
