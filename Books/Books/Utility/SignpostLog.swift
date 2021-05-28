//
//  SignpostLog.swift
//  Books
//
//  Created by Yogesh Bhople on 16/05/21.
//  Copyright © 2021 SOMEONE. All rights reserved.
//

import Foundation

import os.signpost

final class SignpostLog {
    static let networking = OSLog(subsystem: "com.yuvedha.booksapp", category: "Networking")
    
    static let pointOFInterest = OSLog(subsystem: "com.yuvedha.booksapp", category: .pointsOfInterest)
}
