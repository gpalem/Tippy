//
//  SettingsViewController.swift
//  tippy
//
//  Created by Gangi Palem on 8/15/17.
//  Copyright © 2017 Gangi Palem. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet weak var defaultTipPercent: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  override func viewWillAppear(_ animated: Bool) {
    let defaults = UserDefaults.standard
    let tipIndex = defaults.integer(forKey: "default_tip_percent")
    defaultTipPercent.selectedSegmentIndex = tipIndex
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func defaultTip(_ sender: Any) {
    let defaults = UserDefaults.standard
    defaults.set(defaultTipPercent.selectedSegmentIndex, forKey: "default_tip_percent")
    defaults.synchronize()
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
