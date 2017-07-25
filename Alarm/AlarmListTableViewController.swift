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
        return AlarmController.shared.numberOfAlarms()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as? SwitchTableViewCell
        let alarm = AlarmController.shared.alarm(at: indexPath)
        cell?.updateViews(with: alarm)
        cell?.delegate = self
        
        return cell ?? UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditAlarm" {
            if let destinationTableViewController = segue.destination as? AlarmDetailTableViewController {
                if let index = tableView.indexPathForSelectedRow {
                    let alarm = AlarmController.shared.alarm(at: index)
                    return destinationTableViewController.alarm = alarm
                }
            }
        }
    }

}

extension AlarmListTableViewController: SwitchTableViewCellDelegate {
    func alarmValueChanged(_ cell: SwitchTableViewCell, selected: Bool) {
        guard let cellIndexPath = tableView.indexPath(for: cell) else { return }
        let alarm = AlarmController.shared.alarms[cellIndexPath.row] //change this later
        tableView.beginUpdates()
        AlarmController.shared.toggleEnabled(alarm: alarm)
        tableView.reloadRows(at: [cellIndexPath], with: .automatic)
        tableView.endUpdates()
    }
}
