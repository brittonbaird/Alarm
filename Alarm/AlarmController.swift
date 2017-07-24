//
//  AlarmController.swift
//  Alarm
//
//  Created by Britton Baird on 7/24/17.
//  Copyright © 2017 Britton Baird. All rights reserved.
//

import Foundation

class AlarmController {
    
    static var shared = AlarmController()
    
    var alarms: [Alarm] = []
    
    var mockAlarms: [Alarm] {
        
        let alarm1 = Alarm(fireTimeFromMidnight: 1401.0, name: "alarm1")
        let alarm2 = Alarm(fireTimeFromMidnight: 2251.0, name: "alarm2")
        let alarm3 = Alarm(fireTimeFromMidnight: 1901.0, name: "alarm3")
        
        return [alarm1, alarm2, alarm3]
    }
    
    init() {
        self.alarms = self.mockAlarms
    }
    
    func addAlarm(fireTimeFromMidnight: TimeInterval, name: String) -> Alarm {
        let alarm = Alarm(fireTimeFromMidnight: fireTimeFromMidnight, name: name)
        alarms.append(alarm)
        return alarm
    }
    
    func update(alarm: Alarm, fireTimeFromMidnight: TimeInterval, name: String) {
        guard let index = alarms.index(of: alarm) else { return }
        alarms[index].fireTimeFromMidnight = fireTimeFromMidnight
        alarms[index].name = name
    }
    
    func delete(alarm: Alarm) {
        guard let index = alarms.index(of: alarm) else { return }
        alarms.remove(at: index)
    }
    
}
