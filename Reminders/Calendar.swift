//
//  Calendar.swift
//  Reminder
//
//  Created by Floriana Nalbone on 23/11/23.
//

import Foundation
import SwiftUI

struct CalendarTypeNumber: Identifiable {
    var id = UUID()
    var iconCalendar: Image
    var type: String
    var number: Int
    var color: Color
}
