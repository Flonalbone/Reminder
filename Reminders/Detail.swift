//
//  Detail.swift
//  Reminder
//
//  Created by Floriana Nalbone on 23/11/23.
//

import Foundation

import SwiftUI

struct DetailDateTime: Identifiable {
    var id = UUID()
    var iconDateTime: Image
    var typeDateTime: String
    var colorDT: Color
    @State var isSwitchDateOn: Bool
    @State var isSwitchTimeOn: Bool
}

struct DetailFlag: Identifiable {
    var id = UUID()
    var iconFlag: Image
    var typeFlag: String
    var colorFlag: Color
    @State var isSwithFlagOn: Bool
}
