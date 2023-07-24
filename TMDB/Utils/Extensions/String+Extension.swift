//
//  String+Extension.swift
//  TMDB
//
//  Created by Aung Kyaw Phyo on 7/24/23.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    public func convertStringToDate(formatDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatDate
        return dateFormatter.date(from: self) ?? Date()
    }
    
    func formattedDateFromString(inputFormat: String, withFormat format: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormat
        
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            return outputFormatter.string(from: date)
        }
        return ""
    }
}
