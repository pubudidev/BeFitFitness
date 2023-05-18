//
//  Extensions.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/18/23.
//

import Foundation

extension String{
      func capitalizeFirstLetter() -> String {
            // first letter upercase
            return self.prefix(1).uppercased() + self.lowercased().dropFirst()
        }
  }
