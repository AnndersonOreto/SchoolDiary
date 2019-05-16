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
            generateMockData(count: 5)
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
        
        let childNames = ["Aurora", "Valentina", "Enzo", "Brian", "Lucas"]
        let motherNames = ["Helena", "Luiza", "Ana", "Beatriz", "Carla"]
        let fatherNames = ["André", "Marcelo", "Gilmar", "Clayton", "Renan"]
        
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
        
        let allergyDescriptions = [
            "Alergia ao leite",
            "Alergia a penicilina",
            "Alergia a abelhas",
            "Rinite alérgica"
        ]
        
        let activities = [
            Activity(type: .classes, description: "Aula de música"),
            Activity(type: .storytelling, description: "Contos infantis"),
            Activity(type: .games, description: "Brincadeira de balões"),
            Activity(type: .other, description: "Piquenique")
        ]
        
        let notes = [
            "#### gostou muito da brincadeira de balões hoje. ☺️\nAté amanhã!",
            "#### interagiu bastante com os coleguinhas! 😁",
            "#### estava um amor hoje!! 🥰"
        ]
        
        let notices = [
            ("Uniforme", "Os pedidos de uniforme feitos até o dia 02 de Abril estão prontos para retirada na Secretaria da Escola.", NoticeType.secretary),
            ("Cardápio", "A nutricionista da escola fez alterações no cardápio das turmas do Berçário e Maternal conforme orientações do Ministério da Saúde." , NoticeType.health),
            ("Calendário", "O Dia das Mães contará com uma comemoração na escolinha! Venha prestigiar a apresentação musical das crianças 😊" , NoticeType.administrative),
            ("Mensalidade", "A mensalidade referente ao mês de Maio já encontra-se disponível para pagamento, e pode ser encontrada no seu perfil." , NoticeType.finance),
            ("Aula de Inglês", "A aula de inglês da próxima semana contará com uma atividade lúdica musical. Traga uma música para seu filho mostrar à turma!" , NoticeType.pedagogy)
        ]
        
        for i in 0..<count {
            var child = Child(name: childNames[i%5],
                              birth: faker.date.birthday(1, 6),
                              photo: "child",
                              weight: faker.number.randomFloat(min: 8, max: 15),
                              height: faker.number.randomFloat(min: 60, max: 130),
                              parents: Set<Parent>(),
                              medicines: [tylenol, maresis],
                              allergies: Set<Allergy>(),
                              diaries: [],
                              relatives: [])
            
            let motherName = motherNames[i % motherNames.count]
            let fatherName = fatherNames[i % fatherNames.count]
            
            var mother = Parent(name: motherName,
                                birth: faker.date.birthday(18, 60),
                                photo: "helena",
                                cpf: faker.number.randomInt(min: 11111111111,
                                                            max: 99999999999),
                                email: "\(motherName.lowercased())@example.net",
                                phone: faker.phoneNumber.cellPhone(),
                                relationship: .parent,
                                password: "\(motherName.lowercased())123",
                                invoices: [Invoice(month: Date(),
                                                   total: 599.90,
                                                   situation: .unpaid,
                                                   barcode: faker.number.randomInt(min: 1111111111111111,
                                                                                   max: 9999999999999999))],
                                children: [])
            
            var father = Parent(name: fatherName,
                                birth: faker.date.birthday(18, 60),
                                photo: "helena",
                                cpf: faker.number.randomInt(min: 11111111111,
                                                            max: 99999999999),
                                email: "\(fatherName.lowercased())@example.net",
                                phone: faker.phoneNumber.cellPhone(),
                                relationship: .parent,
                                password: "\(fatherName.lowercased())123",
                                invoices: [Invoice(month: Date(),
                                                   total: 599.90,
                                                   situation: .unpaid,
                                                   barcode: faker.number.randomInt(min: 1111111111111111,
                                                                                   max: 9999999999999999))],
                                children: [])
            
//            var childActivities : [Activity] = []
            
            for _ in 0..<Int.random(in: 1...3) {
                let allergyType = AllergyType.allCases[i % AllergyType.allCases.count]
                var allergyDescription : String
                
                switch allergyType {
                case .food:
                    allergyDescription = allergyDescriptions[0]
                case .medicine:
                    allergyDescription = allergyDescriptions[1]
                case .animal:
                    allergyDescription = allergyDescriptions[2]
                case .other:
                    allergyDescription = allergyDescriptions[3]
                }
                
                let allergy = Allergy(type: allergyType,
                                      description: allergyDescription)
                
                child.allergies.insert(allergy)
                
//                let activityType = ActivityType.allCases[i % ActivityType.allCases.count]
//                var activityDescription : String
//
//                switch activityType {
//                case .classes:
//                    activityDescription = activities[0]
//                case .storytelling:
//                    activityDescription = activities[1]
//                case .games:
//                    activityDescription = activities[2]
//                case .other:
//                    activityDescription = activities[3]
//                }
//
//                let activity = Activity(type: activityType, description: activityDescription)
//                childActivities.append(activity)
            }
            
            let diary = Diary(date: Date(),
                              meals: meals,
                              naps: [
                                Nap(napTime: .morning, start: Date().changing(.hour, value: 8)!, end: Date().changing(.hour, value: 9)!),
                                Nap(napTime: .afternoon, start: Date().changing(.hour, value: 13)!, end: Date().changing(.hour, value: 14)!)],
                              activities: activities.suffix(Int.random(in: 1...activities.count)),
                              provide: [Provide(description: "Pomada (assaduras)")],
                              bathroom: [
                                Bathroom(type: .pee, condition: BathroomCondition.allCases.randomElement()!),
                                Bathroom(type: .poop, condition: BathroomCondition.allCases.randomElement()!)],
                              medsTaken: [TakenMedicine(medicine: child.medicines.randomElement()!, timeTaken: Date().changing(.hour, value: 15)!)],
                              pictures: [],
                              notes: notes.randomElement()!.replacingOccurrences(of: "####", with: child.name))
            
            child.diaries.append(diary)
            child.parents.insert(mother)
            child.parents.insert(father)
            mother.children.append(child)
            father.children.append(child)
            
            let randomNotice = notices[i % notices.count]
            let notice = Notice(title: randomNotice.0,
                                type: randomNotice.2,
                                text: randomNotice.1,
                                date: faker.date.between(Date().yesterday.yesterday.yesterday, Date()))
            
            Storage.children.append(child)
            Storage.parents.append(mother)
            Storage.parents.append(father)
            Storage.notices.append(notice)
        }
        
        print("Mock data generated.")
        print("Generated e-mail and password pairs:")
        for parent in Storage.parents {
            print("\(parent.name)\t\t\(parent.email)\t\t\(parent.password)")
        }
    }
}
