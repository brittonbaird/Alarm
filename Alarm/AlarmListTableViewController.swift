//
//  AlarmListTableViewController.swift
//  Alarm
//
//  Created by Britton Baird on 7/24/17.
//  Copyright © 2017 Britton Baird. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmController.shared.alarms.count // change this later
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as? SwitchTableViewCell
        let alarm = AlarmController.shared.alarms[indexPath.row] // change this later
        cell?.updateViews(with: alarm)
        cell?.delegate = self
        
        return cell ?? UITableViewCell()
    }

}

extension AlarmListTableViewController: SwitchTableViewCellDelegate {
    func alarmValueChanged(_ cell: SwitchTableViewCell, selected: Bool) {
        guard let cellIndexPath = tableView.indexPath(for: cell) else { return }
        let alarm = AlarmController.shared.alarms[cellIndexPath.row] //change this later
        tableView.beginUpdates()
        alarm.enabled = selected
        tableView.reloadRows(at: [cellIndexPath], with: .automatic)
        tableView.endUpdates()
    }
}
