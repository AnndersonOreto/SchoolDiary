//
//  FirebaseStorage.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 08/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation
import Firebase
import Fakery

class Storage {
    static var children : [Child] = []
    static var parents : [Parent] = []
    
    
    init() {
        if Disk.exists("children.json", in: .applicationSupport) &&
            Disk.exists("parents.json", in: .applicationSupport) {
            print("Existing database found. Loading data...")
            Storage.load()
        } else {
            print("Database not found. Generating new data.")
            generateMockData(count: 7)
            Storage.save()
        }
    }
    
    static func load() {
        
    }
    
    static func save() {
        
    }
    
    func generateMockData(count: Int) {
        let faker = Faker(locale: "en")
        
        let names = ["Aurora", "Valentina", "Enzo", "Brian", "Lucas"]
        let tylenol = Medicine(name: "Tylenol baby",
                               dose: 1,
                               type: .drops,
                               condition: "Se tiver febre acima de 37,5º",
                               time: Date.init())
        let maresis = Medicine(name: "Maresis",
                               dose: 1,
                               type: .drops,
                               condition: "Se tiver secreção no nariz",
                               time: Date.init())
        
        let snack = Meal(type: .snack, quantity: .all)
        let lunch = Meal(type: .lunch, quantity: .all)
        let milk = Meal(type: .milk, quantity: .half)
        let preDinner = Meal(type: .preDinner, quantity: .aLittle)
        
        let meals = [snack, lunch, milk, preDinner]
        
        for i in 0..<count {
            var child = Child(name: names[i%5],
                              birth: faker.date.birthday(1, 6),
                              photo: faker.internet.image(),
                              weight: faker.number.randomFloat(min: 8, max: 15),
                              height: faker.number.randomFloat(min: 60, max: 130),
                              parents: Set<Parent>(),
                              medicines: [tylenol, maresis],
                              allergies: Set<Allergy>(),
                              diaries: [])
            
            let name = faker.name.firstName()
            
            var parent = Parent(name: name,
                                birth: faker.date.birthday(18, 60),
                                photo: faker.internet.image(),
                                cpf: faker.number.randomInt(min: 00000000000,
                                                            max: 99999999999),
                                email: "\(name.lowercased())@example.net",
                password: "\(name.lowercased())123",
                children: [])
            
            let allergyCount = Int.random(in: 0...3)
            
            for _ in 0..<allergyCount {
                let allergyRandom = Int.random(in: 1...4)
                var allergyType : AllergyType
                
                switch allergyRandom {
                case 1:
                    allergyType = AllergyType.animal
                case 2:
                    allergyType = AllergyType.food
                case 3:
                    allergyType = AllergyType.medicine
                default:
                    allergyType = AllergyType.other
                }
                
                let allergy = Allergy(type: allergyType,
                                      description: faker.lorem.sentences(amount: 4))
                
                child.allergies.insert(allergy)
            }
            
            let diary = Diary(date: Date(),
                              meals: meals.suffix(Int.random(in: 0..<meals.count)),
                              naps: [],
                              activities: Set<Activity>(),
                              bathroom: [],
                              medsTaken: [],
                              pictures: [],
                              notes: faker.lorem.sentence(wordsAmount: Int.random(in: 4...10)))
            
            child.diaries.append(diary)
            child.parents.insert(parent)
            parent.children.append(child)
            
            Storage.children.append(child)
            Storage.parents.append(parent)
        }
        
        print("Mock data generated.")
        print("Generated e-mail and password pairs:")
        for parent in Storage.parents {
            print("\(parent.name)\t\t\(parent.email)\t\t\(parent.password)")
        }
    }
}
