//
//  AlarmDetailTableViewController.swift
//  Alarm
//
//  Created by Britton Baird on 7/24/17.
//  Copyright © 2017 Britton Baird. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Makes the button rounded
        disableButton.layer.cornerRadius = 10
        disableButton.clipsToBounds = true
        
        updateViews()
    }
    
    var alarm: Alarm? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var topTitleText: UINavigationItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var disableButton: UIButton!
    
    func updateViews() {
        if let alarm = alarm, let fireDate = alarm.fireDate{
            
            topTitleText?.title = alarm.name
            datePicker?.date = fireDate
            titleText?.text = alarm.name
            disableButton?.isEnabled = alarm.enabled
            
            switch alarm.enabled{
            
            case true:
                disableButton?.setTitle("Disabled", for: .normal)
                disableButton?.backgroundColor = .red
            
            case false:
                disableButton?.setTitle("Enabled", for: .normal)
                disableButton?.backgroundColor = .gray
                
            }
        } else {
            disableButton.isHidden = true
        }
        
    }
    
    @IBAction func disableButtonTapped() {
        guard let alarm = alarm else { return }
        AlarmController.shared.toggleEnabled(alarm: alarm)
        print("\(alarm.enabled)")
        updateViews()
    }
    
    @IBAction func saveButtonTapped() {
        guard let time = DateHelper.thisMorningAtMidnight?.compare(datePicker.date) else { return }
        guard let alarm = alarm, let name = titleText.text, name != "" else { return }
        
        if alarm == nil {
            AlarmController.shared.addAlarm(fireTimeFromMidnight: TimeInterval(time.rawValue), name: name)
        } else {
            AlarmController.shared.update(alarm: alarm, fireTimeFromMidnight: TimeInterval(time.rawValue), name: name)
        }
    }
}











