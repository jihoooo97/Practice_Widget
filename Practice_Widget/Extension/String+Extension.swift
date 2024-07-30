//
//  String+Extension.swift
//  Practice_Widget
//
//  Created by 유지호 on 7/30/24.
//

import Foundation

extension String {
    
    var getPercentEncodedString: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
}
