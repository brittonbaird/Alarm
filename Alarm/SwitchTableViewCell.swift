//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by Britton Baird on 7/24/17.
//  Copyright © 2017 Britton Baird. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: class {
    func alarmValueChanged(_ cell: SwitchTableViewCell, selected: Bool)
}

class SwitchTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    weak var delegate: SwitchTableViewCellDelegate?
    
    func updateViews(with alarm: Alarm?) {
        guard let alarm = alarm else { return }
        timeLabel?.text = alarm.fireTimeAsString
        nameLabel?.text = alarm.name
        alarmSwitch?.isOn = alarm.enabled
    }
    
    @IBAction func switchValueChanged() {
        delegate?.alarmValueChanged(self, selected: alarmSwitch.isOn)
    }
}
