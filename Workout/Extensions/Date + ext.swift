//
//  Date + ext.swift
//  Workout
//
//  Created by Айдар Оспанов on 09.03.2023.
//

import Foundation

extension Date {
    
    func getWeekDayNumber() -> Int {
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: self)
        
        return weekDay
    }
    
    func localDate() -> Date {
        let timeZoneOffSet = Double(TimeZone.current.secondsFromGMT(for: self))
        let localDete = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffSet), to: self) ?? Date()
        return localDete
    }
    
    func getWeekArray() -> [[String]] {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB")
        formatter.dateFormat = "EEEEEE"
        let calendar = Calendar.current
        
        var week: [[String]] = [[], []]
        
        for index in -6...0 {
            let date = calendar.date(byAdding: .day, value: index, to: self) ?? Date()
            let day = calendar.component(.day, from: date)
            week[1].append("\(day)")
            let weekday = formatter.string(from: date)
            week[0].append(weekday)
        }
        return week
    }
    
    func offSetDay(_ day: Int) -> Date {
        let offSetDay = Calendar.current.date(byAdding: .day, value: -day, to: self) ?? Date()
        return offSetDay
    }
    
    func offSetMonth(_ month: Int) -> Date {
        let offSetMonth = Calendar.current.date(byAdding: .month, value: -month, to: self) ?? Date()
        return offSetMonth
    }
    
    func startEndDate() -> (start: Date, end: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let calendar = Calendar.current
//        let day = calendar.component(.day, from: self)
//        let month = calendar.component(.month, from: self)
//        let year = calendar.component(.year, from: self)
//        let dateStart = formatter.date(from: "\(year)\(month)\(day)") ?? Date()
        let stringDate = formatter.string(from: self)
        let totalDate = formatter.date(from: stringDate) ?? Date()
        
        let local = totalDate.localDate()
        let dateEnd: Date = {
            let components = DateComponents(day: 1, second: -1)
            return calendar.date(byAdding: components, to: local) ?? Date()
        }()
        return (local, dateEnd)
    }
}
