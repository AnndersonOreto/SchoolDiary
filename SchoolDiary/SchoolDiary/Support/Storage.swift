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
    static var notices : [Notice] = []
    
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
        do {
            children = try Disk.retrieve("children.json", from: .applicationSupport, as: [Child].self)
            parents = try Disk.retrieve("parents.json", from: .applicationSupport, as: [Parent].self)
            notices = try Disk.retrieve("notices.json", from: .applicationSupport, as: [Notice].self)
        } catch {
            print("Could not load database.")
            print(error)
        }
        
        print("Database loaded.")
    }
    
    static func save() {
        do {
            try Disk.save(children, to: .applicationSupport, as: "children.json")
            try Disk.save(parents, to: .applicationSupport, as: "parents.json")
            try Disk.save(notices, to: .applicationSupport, as: "notices.json")
        } catch {
            print("Could not save database.")
            print(error)
        }
        
        print("Database saved.")
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
                                invoices: [Invoice(month: Date(),
                                                   total: 599.90,
                                                   situation: .unpaid,
                                                   barcode: 0055050050505)],
                                children: [])
            
            for _ in 0..<Int.random(in: 0...3) {
                let allergy = Allergy(type: AllergyType.allCases.randomElement()!,
                                      description: faker.lorem.sentences(amount: 4))
                
                child.allergies.insert(allergy)
            }
            
            let diary = Diary(date: Date(),
                              meals: meals.suffix(Int.random(in: 1..<meals.count)),
                              naps: [
                                Nap(napTime: .morning, start: Date().changing(.hour, value: 8)!, end: Date().changing(.hour, value: 9)!),
                                Nap(napTime: .afternoon, start: Date().changing(.hour, value: 13)!, end: Date().changing(.hour, value: 14)!)],
                              activities: [
                                Activity(type: ActivityType.allCases.randomElement()!, description: faker.lorem.sentence()),
                                Activity(type: ActivityType.allCases.randomElement()!, description: faker.lorem.sentence())],
                              provide: [Provide(description: faker.lorem.word())],
                              bathroom: [
                                Bathroom(type: .pee, condition: BathroomCondition.allCases.randomElement()!),
                                Bathroom(type: .poop, condition: BathroomCondition.allCases.randomElement()!)],
                              medsTaken: [TakenMedicine(medicine: child.medicines.randomElement()!, timeTaken: Date().changing(.hour, value: 15)!)],
                              pictures: [],
                              notes: faker.lorem.sentence(wordsAmount: Int.random(in: 4...10)))
            
            child.diaries.append(diary)
            child.parents.insert(parent)
            parent.children.append(child)

            let notice = Notice(title: faker.lorem.word(),
                                type: NoticeType.allCases.randomElement()!,
                                text: faker.lorem.paragraph(),
                                date: faker.date.between(Date().yesterday.yesterday.yesterday, Date()))
            
            Storage.children.append(child)
            Storage.parents.append(parent)
            Storage.notices.append(notice)
        }
        
        print("Mock data generated.")
        print("Generated e-mail and password pairs:")
        for parent in Storage.parents {
            print("\(parent.name)\t\t\(parent.email)\t\t\(parent.password)")
        }
    }
}
