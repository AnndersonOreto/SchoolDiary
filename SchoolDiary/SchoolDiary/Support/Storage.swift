//
//  Storage.swift
//  SchoolDiary
//
//  Created by Vinícius Chagas on 03/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation
import Disk

class Storage {
    static var children : [Child] = []
    static var parents : [Parent] = []
    
    init() {
        var helenaBirth = Date.init()
        helenaBirth.month = 2
        helenaBirth.year = 1984
        helenaBirth.day = 12
        
        var auroraBirth = Date.init()
        auroraBirth.month = 2
        auroraBirth.day = 25
        auroraBirth.year = 2017
        
        var aurora = Child(name: "Aurora", birth: auroraBirth, photo: "aurora.jpg", weight: 11.5, height: 85, parents: Set<Parent>(), medicines: [], allergies: Set<Allergy>(), diaries: [])
        var helena = Parent(name: "Helena", birth: helenaBirth, photo: "helena.jpg", cpf: 12345678901, email: "helena63@gmail.com", password: "teste1", children: [aurora])
        aurora.parents.insert(helena)
        let allergy = Allergy(type: .food, description: "Ao ovo")
        aurora.allergies.insert(allergy)
        let tylenol = Medicine(name: "Tylenol baby", dose: 1, type: .drops, condition: "Se tiver febre acima de 37,5º", time: Date.init())
        let maresis = Medicine(name: "Maresis", dose: 1, type: .drops, condition: "Se tiver secreção no nariz", time: Date.init())
        aurora.medicines = [tylenol, maresis]
        let snack = Meal(type: .snack, quantity: .all)
        let lunch = Meal(type: .lunch, quantity: .all)
        let milk = Meal(type: .milk, quantity: .half)
        let snack2 = Meal(type: .snack2, quantity: .half)
        let lunch2 = Meal(type: .preDinner, quantity: .aLittle)
        let milk2 = Meal(type: .milk2, quantity: .nothing)
        let poop = Bathroom(type: .poop, condition: .normal)
        let pee = Bathroom(type: .pee, condition: .worrying)
        let napMorning = Nap(napTime: .morning, start: Date(), end: Date())
        let napAfternoon = Nap(napTime: .afternoon, start: Date(), end: Date())
        let medicine1 = TakenMedicine(medicine: Medicine(name: "Alegra", dose: 5, type: .drops, condition: "Teste", time: Date()), timeTaken: Date())
        let activity1 = Activity(type: .games, description: "Blocos de\nencaixe")
        let activity2 = Activity(type: .other, description: "Balões")
        let provide1 = Provide(description: "Pomada/ Assaduras")
        var diary = Diary(date: Date.init(), meals: [snack, lunch, milk, snack2, lunch2, milk2], naps: [napMorning, napAfternoon], activities: [activity1, activity2], provide: [provide1], bathroom: [pee, poop], medsTaken: [medicine1], pictures: [], notes: "A Aurora gostou muito da brincadeira dos balões hoje!")
        aurora.diaries.append(diary)
        
        Storage.children.append(aurora)
        Storage.parents.append(helena)
        Storage.save()
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
}
