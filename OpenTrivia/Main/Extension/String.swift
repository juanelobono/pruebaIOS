//
//  String.swift
//  OpenTrivia
//
//  Created by Leinhio on 05/12/2019.
//  Copyright © 2019 Nexo Soluciones. All rights reserved.
//

import Foundation

extension String {

    init(htmlEncodedString: String) {
      self.init()
      guard let encodedData = htmlEncodedString.data(using: .utf8) else {
          self = htmlEncodedString
          return
      }

      let attributedOptions: [NSAttributedString.DocumentReadingOptionKey : Any] = [
          .documentType: NSAttributedString.DocumentType.html,
          .characterEncoding: String.Encoding.utf8.rawValue
      ]

      do {
          let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
          self = attributedString.string
      } catch {
          print("Error: \(error)")
          self = htmlEncodedString
      }
    }
}
