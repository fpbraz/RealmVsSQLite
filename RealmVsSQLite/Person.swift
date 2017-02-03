//
//  Person.swift
//  RealmVsSQLite
//
//  Created by Felipe P Braz on 2017-02-03.
//  Copyright © 2017 iOS Quickstart. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    var firstName: String
    var middleName: String
    var lastName: String
    var address: String
    var phoneNumber: String
    var country: String
    var netWorth: Double
    
    init(firstName: String,
         middleName: String,
         lastName: String,
         address: String,
         phoneNumber: String,
         country: String,
         netWorth: Double) {

        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.address = address
        self.phoneNumber = phoneNumber
        self.country = country
        self.netWorth = netWorth
    }
    
    func encode(with aCoder: NSCoder) {        
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(middleName, forKey: "middleName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(address, forKey: "address")
        aCoder.encode(phoneNumber, forKey: "phoneNumber")
        aCoder.encode(country, forKey: "country")
        aCoder.encode(NSNumber(value: netWorth), forKey: "netWorth")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        self.middleName = aDecoder.decodeObject(forKey: "middleName") as! String
        self.lastName = aDecoder.decodeObject(forKey: "lastName") as! String
        self.address = aDecoder.decodeObject(forKey: "address") as! String
        self.phoneNumber = aDecoder.decodeObject(forKey: "phoneNumber") as! String
        self.country = aDecoder.decodeObject(forKey: "country") as! String
        self.netWorth = (aDecoder.decodeObject(forKey: "netWorth") as! NSNumber).doubleValue
    }
}
