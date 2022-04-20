//
//  ViewController.swift
//  DateFormatterExample
//
//  Created by Soumitra Bera on 20/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dateString = "2022-04-12T18:41:20.000000Z"
        let result = self.convertDateFormatter(dateStr: dateString, timeZone: "UTC")
        debugPrint(result)
    }

    func convertDateFormatter(dateStr: String?, timeZone: String) -> String {
        var finalDateString: String = ""
        if let dateStr = dateStr {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let result = dateFormatter.date(from: dateStr)
            
            if let result = result {
                dateFormatter.dateFormat = "yyyy-MMMM-dd HH:mm:ss"
                dateFormatter.timeZone = TimeZone(identifier: timeZone)
                finalDateString = dateFormatter.string(from: result)
            }
        }
        return finalDateString
    }

}

