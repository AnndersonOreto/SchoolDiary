//
//  FinanceiroViewController.swift
//  SchoolDiary
//
//  Created by Marcus Vinicius Vieira Badiale on 14/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class FinanceiroViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var section : Section!
    var child : Child!
    var diary : Diary!
    var childParent: Parent!
    
    @IBOutlet weak var invoiceTableView: UITableView!
    @IBOutlet weak var parentNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invoiceTableView.delegate = self
        invoiceTableView.dataSource = self
        invoiceTableView.separatorStyle = .none
        invoiceTableView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        
        guard let childParent = Storage.parents.first else {
            print("Parent not found.")
            return
        }
        
        self.childParent = childParent
        parentNameLabel.text = self.childParent.name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.childParent.invoices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "invoiceCell") as! FinanceiroTableViewCell
        
        cell.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        var monthWritten = ""
        
        switch self.childParent.invoices[indexPath.row].month.month {
        case 1:
            monthWritten = "Janeiro"
        case 2:
            monthWritten = "Fevereiro"
        case 3:
            monthWritten = "Março"
        case 4:
            monthWritten = "Abril"
        case 5:
            monthWritten = "Maio"
        case 6:
            monthWritten = "Junho"
        case 7:
            monthWritten = "Julho"
        case 8:
            monthWritten = "Agosto"
        case 9:
            monthWritten = "Setembro"
        case 10:
            monthWritten = "Outubro"
        case 11:
            monthWritten = "Novembro"
        case 12:
            monthWritten = "Dezembro"
        default:
            monthWritten = "Janeiro"
        }
        
        cell.monthLabel.text = "\(monthWritten)"
        cell.paymentLabel.text = "R$ \(self.childParent.invoices[indexPath.row].total)".replacingOccurrences(of: ".", with: ",")
        cell.statusLabel.text = self.childParent.invoices[indexPath.row].situation.rawValue
        
        switch self.childParent.invoices[indexPath.row].situation {
        case .debt:
            cell.statusInvoiceImageView.image = UIImage(named: "check")
        case .paid:
            cell.statusInvoiceImageView.image = UIImage(named: "check")
        case .unpaid:
            cell.statusInvoiceImageView.image = UIImage(named: "pendente")
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Mensalidades/Taxas"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "infoInvoice", let detailVC = segue.destination as? DetailInvoiceViewController, let selectedInfo = sender as? DetailInvoiceViewController.DetailInvoice{
            detailVC.detail = selectedInfo
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let parentInfo = childParent
        let invoiceInfo = childParent.invoices[indexPath.row]
        
        
        self.performSegue(withIdentifier: "infoInvoice", sender: DetailInvoiceViewController.DetailInvoice(parentChild: parentInfo, invoice: invoiceInfo))
    }
    
}


