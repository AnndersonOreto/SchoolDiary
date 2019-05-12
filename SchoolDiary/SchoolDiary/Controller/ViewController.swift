//
//  ViewController.swift
//  SchoolDiary
//
//  Created by Annderson Packeiser Oreto on 29/04/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit
import TinyConstraints
import EventKit

enum Section : String {
    case meal = "Alimentação"
    case naps = "Sono"
    case bathroom = "Evacuação"
    case medicines = "Medicamentos"
    case activities = "Atividades"
    case provide = "Providenciar"
    case pictures = "Fotos e Vídeos"
    case observation = "Observações"
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellGridView = GridTableViewCell()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    
    //Section of Table view (each section is a cell)
    let sections : [Section] = [.meal, .naps, .bathroom, .medicines, .activities, .provide, .pictures, .observation]
    
    var section : Section!
    var child : Child!
    var diary : Diary!
    var eventStore = EKEventStore()
    var calendars:Array<EKCalendar> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = Storage()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        tableView.tableHeaderView?.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        eventStore.requestAccess(to: EKEntityType.reminder, completion:
            {(granted, error) in
                if !granted {
                    print("Access to store not granted")
                }
        })
        
        // you need calender's permission for the reminders as they live there
        calendars = eventStore.calendars(for: EKEntityType.reminder)
        
        for calendar in calendars as [EKCalendar] {
            print("Calendar = \(calendar.title)")
        }
        
        guard let child = Storage.children.first else {
            print("Child not found.")
            return
        }
        
        self.child = child
        nameLabel.text = self.child.name
        
        schoolLabel.text = "Escola Unicórnio"
        
        guard let diary = child.diaries.first else {
            print("Diary not found.")
            return
        }
        
        self.diary = diary
        dayLabel.text = "\(self.diary.date.day)"
        monthLabel.text = self.diary.date.monthName()
        // TO DO: FIND WHERE THIS IS BEING SET ON STORYBOARD - PROBABLY A MERGE PROBLEM
        tableView.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "photoInfo"{
//            let photoInfoVC = segue.destination as? PhotoInfoViewController
//            photoInfoVC?.recieveImage =
//
//        }
//    }
    
    @IBAction func testeReminder(_ sender: Any) {
        let reminder = EKReminder(eventStore: self.eventStore)
        
        reminder.title = "Go to the store and buy milk"
        reminder.calendar = eventStore.defaultCalendarForNewReminders()
        
        do {
            try eventStore.save(reminder,
                                commit: true)
        } catch let error {
            print("Reminder failed with error \(error.localizedDescription)")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 30))

        let headerImageView = UIImageView(frame: CGRect(x: 16, y: 0, width: 25, height: 23))
        var image: UIImage = UIImage(named: "alimentacao1x")!
        
        let headerTitle: UILabel = UILabel(frame: CGRect(x: 50, y: -3, width: 200, height: 30))
        
        headerTitle.textColor = .black
        headerTitle.font = UIFont(name: "System", size: 18)
        
        if section == 0 {
            headerTitle.text = Section.meal.rawValue
            image = UIImage(named: "alimentacao1x")!
        }else if section == 1 {
            headerTitle.text = Section.naps.rawValue
            image = UIImage(named: "sonoSectionHeader")!
        }else if section == 2{
            headerTitle.text = Section.bathroom.rawValue
            image = UIImage(named: "banheiro")!
        }else if section == 3{
            headerTitle.text = Section.medicines.rawValue
            image = UIImage(named: "medicamentosSectionHeader")!
        }
        else if section == 4{
            headerTitle.text = Section.activities.rawValue
            image = UIImage(named: "atividades")!
        }
        else if section == 5{
            headerTitle.text = Section.provide.rawValue
            image = UIImage(named: "providenciar")!
        }
        else if section == 6{
            headerTitle.text = Section.pictures.rawValue
            image = UIImage(named: "fotos")!
        }
        else if section == 7{
            headerTitle.text = Section.observation.rawValue
            image = UIImage(named: "obervacoes")!
        }
        
        headerImageView.image = image
        headerImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        headerImageView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        
        view.addSubview(headerImageView)
        view.addSubview(headerTitle)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "cell") as! GridTableViewCell
            
            switch indexPath.row {
            case 0:
                cell.count = self.diary.meals.count
                cell.section = .meal
            case 1:
                cell.count = self.diary.naps.count
                cell.section = .naps
            case 2:
                cell.count = self.diary.bathroom.count
                cell.section = .bathroom
            case 3:
                cell.count = self.diary.activities.count
                cell.section = .activities
            case 4:
                cell.count = 0
                cell.section = .provide
            case 5:
                cell.count = self.diary.pictures.count
                cell.section = .pictures
            default:
                cell.count = 6
                cell.section = .meal
            }
            
            cell.selectionStyle = .none
            cell.diary = self.diary
            
            return cell
        }else if indexPath.section == 1{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "statusCell") as! StatusTableViewCell
            
            cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            cell.icon1.image = UIImage(named: "sono-preenchido")
            cell.icon2.isHidden = true
            cell.labelGray1.text = self.diary.naps[0].napTime.rawValue
            cell.labelGray2.text = self.diary.naps[1].napTime.rawValue
            cell.labelGray3.isHidden = true
            cell.labelBlack1.text = "\(self.diary.naps[0].start.hour)h - \(self.diary.naps[0].end.hour)h"
            cell.labelBlack2.text = "\(self.diary.naps[1].start.hour)h - \(self.diary.naps[1].end.hour)h"
            cell.labelBlack3.isHidden = true
            cell.stackLabelView.leftToRight(of: cell.lineView, offset: 25.0)
            
            //Shadows
            cell.cellView.dropShadow(color: #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1) , opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
            cell.selectionStyle = .none
        
            return cell
            
        }else if indexPath.section == 2{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "statusCell") as! StatusTableViewCell
            
            cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            cell.icon1.image = UIImage(named: "xixi")
            cell.icon2.image = UIImage(named: "coco")
            cell.labelGray1.text = self.diary.bathroom[0].type.rawValue
            cell.labelGray2.text = self.diary.bathroom[1].type.rawValue
            cell.labelBlack1.text = self.diary.bathroom[0].condition.rawValue
            cell.labelBlack2.text = self.diary.bathroom[1].condition.rawValue
            cell.labelGray3.isHidden = true
            cell.labelBlack3.isHidden = true
            cell.stackLabelView.leftToRight(of: cell.icon2, offset: 12.0)
            
            //Shadows
            cell.cellView.dropShadow(color: #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1), opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
            cell.selectionStyle = .none
            return cell
            
        }else if indexPath.section == 3{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "statusCell") as! StatusTableViewCell
            
            var typeDose: String = ""
            
            switch self.diary.medsTaken[indexPath.row].medicine.type{
            case .drops:
                typeDose = "ml"
            case .pills:
                typeDose = "mg"
            case .other:
                break
            }
        
            cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            cell.icon1.image = UIImage(named: "medicamentos")
            cell.icon2.isHidden = true
            cell.labelGray1.text = "nome"
            cell.labelGray2.text = "dose"
            cell.labelGray3.text = "horário"
            cell.labelBlack1.text = self.diary.medsTaken[indexPath.row].medicine.name
            cell.labelBlack2.text = "\(self.diary.medsTaken[indexPath.row].medicine.dose) \(typeDose)"
            cell.labelBlack3.text = "\(self.diary.medsTaken[indexPath.row].medicine.time.hour)h"
            cell.stackLabelView.leftToRight(of: cell.lineView, offset: 25.0)
            cell.stackLabelView2.leftToRight(of: cell.stackLabelView, offset: 40.0)
            cell.selectionStyle = .none
            //Shadows
            cell.cellView.dropShadow(color: #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1), opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
            return cell
            
        }else if indexPath.section == 4{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "activitiesCell") as! ActivitiesTableViewCell
            
            cell.section = .activities
            cell.diary = diary
            cell.configure()
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 5{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "activitiesCell") as! ActivitiesTableViewCell
            cell.section = .provide
            cell.diary = diary
            cell.configure()
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 6{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "photosCell") as! PhotosTableViewCell
            
            cell.section = .pictures
            cell.diary = diary
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 7{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "observationCell") as! NotesTableViewCell
            
            cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            cell.noteLabel.text = self.diary.notes
            
            //For now we fake the professor name
            cell.professorNameLabel.text = "Professora Ana"
            
            
            cell.selectionStyle = .none
            return cell
        }
        else {
            fatalError()
        }
    }
 


}


