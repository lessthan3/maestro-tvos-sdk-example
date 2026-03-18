//
//  Extensions.swift
//  SwiftUI tvOS Test App
//
//  Created by Todd Gibbons on 2/9/25.
//

import Foundation

extension String {
    func lastLines(_ count: Int) -> String {
        let lines = self.components(separatedBy: .newlines)
        let startIndex = max(0, lines.count - count)
        return Array(lines[startIndex...]).joined(separator: "\n")
    }
}

extension Double {
    func asPercentage() -> String {
        return String(format: "%.0f%%", self * 100)
    }
}

extension TimeInterval {
    func secondsToNow() -> String {
        let now = Date().timeIntervalSince1970
        return String(format: "%04d: ", Int(now - self))
    }
}
