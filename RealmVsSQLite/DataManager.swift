//
//  DataGenerator.swift
//  RealmVsSQLite
//
//  Created by Felipe P Braz on 2017-02-03.
//  Copyright © 2017 iOS Quickstart. All rights reserved.
//

import Foundation

struct DataManager {
    
    enum DataManagerError : Error {
        case NoValidDataFilePath
    }
    
    var data: [Person]?
    
    private lazy var dataFilePath: String? = {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                .userDomainMask,
                                                                true).first
        if let documentsPath = documentsPath {            
            return documentsPath.appending("/data.plist")
        } else {
            return nil
        }
    }()
    
    mutating func generateDataIfNeeded() throws {
        if data == nil {
            let generatedData = previouslyGeneratedData()
            
            if generatedData == nil {
                data = [Person]()
                
                for _ in 0 ... 1000 {
                    let person = Person(firstName: String.random(),
                                        middleName: String.random(),
                                        lastName: String.random(),
                                        address: String.random(),
                                        phoneNumber: String.random(),
                                        country: String.random(),
                                        netWorth: Double.random())
                    data!.append(person)
                }
                try saveData(dataToSave: data!)
            } else {
                data = generatedData
            }
        }
        print("\(data)")
    }
    
    private mutating func previouslyGeneratedData() -> [Person]?  {
        guard let filePath = dataFilePath else {
            return nil
        }
        
        do {
            let rawData = try Data(contentsOf: URL(fileURLWithPath:filePath))
            return NSKeyedUnarchiver.unarchiveObject(with: rawData) as? [Person]
        } catch {
            print("File not found")
        }
        
        return nil
    }
 
    private mutating func saveData(dataToSave: [Person]) throws {
        guard let path = dataFilePath else {
            throw DataManagerError.NoValidDataFilePath
        }
        
        let data = NSKeyedArchiver.archivedData(withRootObject: dataToSave)
        
        try data.write(to:URL(fileURLWithPath:path))
    }
    
    
}
