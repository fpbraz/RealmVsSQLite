//
//  RandomizingExtensions.swift
//  RealmVsSQLite
//
//  Created by Felipe P Braz on 2017-02-03.
//  Copyright © 2017 iOS Quickstart. All rights reserved.
//

import Foundation

extension String {
    static func random() -> String {
        let length = Int(arc4random_uniform(100))
        return randomString(length: length)
    }
    
    private static func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}

extension Double {
    static func random() -> Double {
        return Double(arc4random()) / Double(UINT32_MAX)
    }
}

extension Int {
    static func random () -> Int {
        return Int(arc4random())
    }
}
