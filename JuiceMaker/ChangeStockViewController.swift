//
//  StockViewController.swift
//  JuiceMaker
//  Created by Yetti, yy-ss99, Mary.

import UIKit

final class ChangeStockViewController: UIViewController {
    private var initialStock: [Int] = []
    private var additionalStock = [Int](repeating: 0, count: Fruits.allCases.count)
    var getCurrentHandler: (() -> [Int])?
    var addStockHandler: ((_ quantities:[Int]) -> Void)?
    
    @IBOutlet var stockChangeLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeStockLabels()
    }
    
    private func initializeStockLabels() {
        guard let currentStock = getCurrentHandler?() else { return }
        initialStock = currentStock
        for (index, label) in stockChangeLabels.enumerated() {
            label.text = "\(initialStock[index])"
        }
    }
    
    @IBAction private func hitDismissButton(_ sender: UIBarButtonItem) {
        addStockHandler?(additionalStock)
        dismiss(animated: true)
    }
    
    @IBAction private func hitStepper(_ sender: UIStepper) {
        stockChangeLabels[sender.tag].text = "\(initialStock[sender.tag] + Int(sender.value))"
        additionalStock[sender.tag] = Int(sender.value)
    }
}
