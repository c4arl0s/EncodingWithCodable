``` swift
//
//  Note.swift
//  EncodingWithCodable
//
//  Created by Carlos Santiago Cruz on 11/19/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//
import Foundation

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}
```

``` swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let newNote = Note(title: "new note", text: "this is a new note", timestamp: Date())
        // now look at the following example to see how to use encoder object to encode a value to a plist.
        let propertyListEncoder = PropertyListEncoder()
        if let encodableNote = try? propertyListEncoder.encode(newNote) {
            print(encodableNote)
            print("it prints the number of bytes stored in the Data Object")
        }
    }


}
```

