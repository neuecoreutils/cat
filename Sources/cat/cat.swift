
import ArgumentParser
import Foundation

@main
struct cat: ParsableCommand {
    @Flag(help: "Print the line numbers along with each line.")
    var lineNumbers: Bool = false

    @Argument(help: "Path of the file to concatenate.")
    var fileName: String

    mutating func run() throws {
        if FileManager.default.fileExists(atPath: fileName) {

            let file = FileHandle(forReadingAtPath: fileName)
            if file != nil {
                let data = file!.readDataToEndOfFile()
                if data.count > 0 {
                    let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                    if str != nil {
                        print(str!)
                    }
                }
            }
        }

        else {
            print("File does not exist.")
        }
    }
}
