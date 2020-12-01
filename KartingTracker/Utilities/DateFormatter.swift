//
//  DateFormatter.swift
//  KartingTracker
//
//  Created by Alexandr Khrutskiy on 01/12/2020.
//  Copyright © 2020 Alexandr Khrutskiy. All rights reserved.
//

import Foundation

class DateFormatterBuilder {
    
    func formate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let strDate = formatter.string(from: date)
        return strDate
    }
}
