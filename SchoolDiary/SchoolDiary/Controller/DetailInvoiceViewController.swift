//
//  DetailInvoiceViewController.swift
//  SchoolDiary
//
//  Created by Marcus Vinicius Vieira Badiale on 14/05/19.
//  Copyright © 2019 Annderson Packeiser Oreto. All rights reserved.
//

import UIKit

class DetailInvoiceViewController: UIViewController {

    
    @IBOutlet weak var parentNameLabel: UILabel!
    var detail: DetailInvoice!
    
    struct DetailInvoice {
        var parentChild: Parent!
        var invoice: Invoice!
    }
    
    @IBOutlet weak var headerMonthlyPayment: UILabel!
    @IBOutlet weak var parentsNameLabel: UILabel!
    @IBOutlet weak var parentsCpfLabel: UILabel!
    @IBOutlet weak var maturityLabel: UILabel!
    @IBOutlet weak var invoiceValueLabel: UILabel!
    @IBOutlet weak var totalValueInvoiceLabel: UILabel!
    @IBOutlet weak var descriptionMonthlyPaymentLabel: UILabel!
    @IBOutlet weak var descriptionInvoiceDateLabel: UILabel!
    @IBOutlet weak var barCodeLabel: UILabel!
    @IBOutlet weak var barCodeImageView: UIImageView!
    @IBOutlet weak var parentNameHeader: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parentNameHeader.text = detail.parentChild.name
        
        var monthWritten = ""
        switch detail.invoice.month.month {
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
        
        self.headerMonthlyPayment.text = "Mensalidade de \(monthWritten)"
        self.parentsNameLabel.text = detail.parentChild.name
        self.parentsCpfLabel.text = "\(detail.parentChild.cpf)"
        self.maturityLabel.text = "\(detail.invoice.month.day)/\(detail.invoice.month.month)/\(detail.invoice.month.year)"
        self.invoiceValueLabel.text = "R$ \(detail.invoice.total)".replacingOccurrences(of: ".", with: ",")
        self.totalValueInvoiceLabel.text = "R$ \(detail.invoice.total)".replacingOccurrences(of: ".", with: ",")
        self.descriptionMonthlyPaymentLabel.text = "Mensalidade da Escola Unicórnio"
        self.descriptionInvoiceDateLabel.text = "\(monthWritten) \(detail.invoice.month.year)"
        self.barCodeLabel.text = "\(detail.invoice.barcode)"
    }
    @IBAction func copyBarCode(_ sender: UIButton) {
        UIPasteboard.general.string = "\(detail.invoice.barcode)"
        
        let alertController = UIAlertController(title: "Código de barras copiado.", message: "", preferredStyle: .alert)
        
        self.present(alertController, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alertController.dismiss(animated: true, completion: nil)
        }
    }
}
