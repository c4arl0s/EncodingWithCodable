# Encoding with Codable

```swift
struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}
```

### Creating an instance of Note

```swift
let newNote = Note(title: "new note", text: "this is a new note", timestamp: Date())
```

### encode a value to a plist

```swift
        let propertyListEncoder = PropertyListEncoder()
        if let encodableNote = try? propertyListEncoder.encode(newNote) {
            print(encodableNote)
            print("it prints the number of bytes stored in the Data Object")
        }
```


# Writing data to a file



# Writing the data

# Saving an Array of Model Data





