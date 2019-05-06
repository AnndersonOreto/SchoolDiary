//
//  Storage.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 03/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation
import Disk
import Fakery

class Storage {
    static var children : [Child] = []
    static var parents : [Parent] = []
    
    init() {
//        var helenaBirth = Date.init()
//        helenaBirth.month = 2
//        helenaBirth.year = 1984
//        helenaBirth.day = 12
//
//        var auroraBirth = Date.init()
//        auroraBirth.month = 2
//        auroraBirth.day = 25
//        auroraBirth.year = 2017
//
//        var aurora = Child(name: "Aurora", birth: auroraBirth, photo: "aurora.jpg", weight: 11.5, height: 85, parents: Set<Parent>(), medicines: [], allergies: Set<Allergy>(), diaries: [])
//        var helena = Parent(name: "Helena", birth: helenaBirth, photo: "helena.jpg", cpf: 12345678901, email: "helena63@gmail.com", password: "teste1", children: [aurora])
//        aurora.parents.insert(helena)
//        let allergy = Allergy(type: .food, description: "Ao ovo")
//        aurora.allergies.insert(allergy)
//        let tylenol = Medicine(name: "Tylenol baby", dose: 1, type: .drops, condition: "Se tiver febre acima de 37,5º", time: Date.init())
//        let maresis = Medicine(name: "Maresis", dose: 1, type: .drops, condition: "Se tiver secreção no nariz", time: Date.init())
//        aurora.medicines = [tylenol, maresis]
//        let snack = Meal(type: .snack, quantity: .all)
//        let lunch = Meal(type: .lunch, quantity: .all)
//        let milk = Meal(type: .milk, quantity: .half)
//        let poop = Bathroom(type: .poop, condition: .normal)
//        var diary = Diary(date: Date.init(), meals: [snack, lunch, milk], naps: [Date.init()], activities: Set<Activity>(), bathroom: [poop], medsTaken: [], pictures: [], notes: "A Aurora gostou muito da brincadeira dos balões hoje!")
//        aurora.diaries.append(diary)
//
//        Storage.children.append(aurora)
//        Storage.parents.append(helena)
        
        if Storage.children.isEmpty && Storage.parents.isEmpty {
            generateMockData(count: 20)
            Storage.save()
        }
    }
    
    static func reload() {
        if Disk.exists("children.json", in: .applicationSupport) {
            do {
                children = try Disk.retrieve("children.json", from: .applicationSupport, as: [Child].self)
                parents = try Disk.retrieve("parents.json", from: .applicationSupport, as: [Parent].self)
            } catch {
                print("Could not reload database.")
                print(error)
            }
            
            print("Database reloaded.")
        }
    }
    
    static func save() {
        do {
            try Disk.save(children, to: .applicationSupport, as: "children.json")
            try Disk.save(parents, to: .applicationSupport, as: "parents.json")
        } catch {
            print("Could not save database.")
            print(error)
        }
        
        print("Database saved.")
    }
    
    func generateMockData(count: Int) {
        let faker = Faker(locale: "en")
        
        let tylenol = Medicine(name: "Tylenol baby", dose: 1, type: .drops, condition: "Se tiver febre acima de 37,5º", time: Date.init())
        let maresis = Medicine(name: "Maresis", dose: 1, type: .drops, condition: "Se tiver secreção no nariz", time: Date.init())
        
        let snack = Meal(type: .snack, quantity: .all)
        let lunch = Meal(type: .lunch, quantity: .all)
        let milk = Meal(type: .milk, quantity: .half)
        let preDinner = Meal(type: .preDinner, quantity: .aLittle)
        
        let meals = [snack, lunch, milk, preDinner]
        
        for _ in 0..<count {
            var child = Child(name: faker.name.name(),
                              birth: faker.date.birthday(1, 6),
                              photo: faker.internet.image(),
                              weight: faker.number.randomFloat(min: 8, max: 15),
                              height: faker.number.randomFloat(min: 60, max: 130),
                              parents: Set<Parent>(),
                              medicines: [tylenol, maresis],
                              allergies: Set<Allergy>(),
                              diaries: [])
            
            var parent = Parent(name: faker.name.name(),
                                birth: faker.date.birthday(18, 60),
                                photo: faker.internet.image(),
                                cpf: faker.number.randomInt(min: 00000000000, max: 99999999999),
                                email: faker.internet.email(),
                                password: faker.internet.password(),
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
                
                let allergy = Allergy(type: allergyType, description: faker.lorem.sentences(amount: 4))
                
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
    }
}
