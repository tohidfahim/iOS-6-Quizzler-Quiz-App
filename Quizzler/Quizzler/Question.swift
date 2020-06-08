//
//  Question.swift
//  Quizzler
//
//  Created by Tohid Fahim on 6/6/20.
//  Copyright © 2020 Tohid Fahim. All rights reserved.
//

import Foundation


class question{
    
    let questionText : String
    let answer : Bool 
    
    
    init(text: String, correctAnswer : Bool){
        questionText = text
        answer = correctAnswer
    }
    
}
