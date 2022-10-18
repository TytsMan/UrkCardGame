//
//  Iterator.swift
//  UrkCardGame
//
//  Created by Ivan on 15/10/2022.
//

import Foundation

struct Iterator<Elements> where Elements: Collection {
    
    var elements: Elements
    var iterator: IndexingIterator<Elements>? = nil
    let repeating: Bool
    let shuffle: Bool
    
    private var buffer: Elements.Element? = nil
    
    init(
        elements: Elements,
        repeating: Bool = false,
        shuffle: Bool = false
    ) {
        self.elements = elements
        self.repeating = repeating
        self.shuffle = shuffle
        resetIterator()
    }
    
    mutating func hasNext() -> Bool {
        buffer = iterator?.next()
        return buffer != nil
    }
    
    mutating func next() -> Elements.Element? {
        if let element = buffer {
            defer {
                buffer = nil
            }
            return element
        }
        
        if let element = iterator?.next() {
            return element
        }
        
        if repeating {
            resetIterator()
            return next()
        }
        
        return nil
    }
    
    mutating func resetIterator() {
        if shuffle {
            iterator = (elements.shuffled().makeIterator() as! IndexingIterator<Elements>)
        } else {
            iterator = (elements.makeIterator() as! IndexingIterator<Elements>)
        }
    }
}
