//
//  ViewController.swift
//  tippy
//
//  Created by Gangi Palem on 8/15/17.
//  Copyright © 2017 Gangi Palem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let appCloseTimeKey = "app_close_time"
  let billAtAppCloseTimeKey = "bill_at_app_close_time"

  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var tipPercent: UISegmentedControl!
  @IBOutlet weak var billField: UITextField!


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    billField.becomeFirstResponder()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadBillIfShortTime()
    loadDefaultTip()
    calculateTip()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    let currentTime = NSDate()
    let defaults = UserDefaults.standard
    defaults.setValue(currentTime, forKey: appCloseTimeKey)
    defaults.setValue(billField.text, forKey: billAtAppCloseTimeKey)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func loadBillIfShortTime() {
    let defaults = UserDefaults.standard
    let appCloseTime = defaults.object(forKey: appCloseTimeKey) as? NSDate
    print(appCloseTime ?? 0)
    let currentTime = NSDate()
    if (appCloseTime != nil && appCloseTime?.addingTimeInterval(3600).compare(currentTime as Date) == .orderedDescending) {
      billField.text = defaults.string(forKey: billAtAppCloseTimeKey)
    }
  }

  func loadDefaultTip() {
    let defaults = UserDefaults.standard
    let tipIndex = defaults.integer(forKey: "default_tip_percent")
    tipPercent.selectedSegmentIndex = tipIndex
  }

  func calculateTip() {
    let tipPercentage = [0.18, 0.2, 0.25]

    let bill = Double(billField.text!) ?? 0
    let tip = bill * tipPercentage[tipPercent.selectedSegmentIndex]
    let total = bill + tip

    tipLabel.text = String(format: "$%.2f", tip)
    totalLabel.text = String(format: "$%.2f", total)
  }

  @IBAction func calculateTip(_ sender: Any) {
    calculateTip()
  }

  @IBAction func onTap(_ sender: Any) {
    view.endEditing(true)
  }
}

