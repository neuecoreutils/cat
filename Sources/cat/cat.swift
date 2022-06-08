
import ArgumentParser
import Foundation

func concat(_ f: String) {
    if FileManager.default.fileExists(atPath: f) {
        let file = FileHandle(forReadingAtPath: f)
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

func catWithLineNums(_ f: String) {
    if FileManager.default.fileExists(atPath: f) {

        let file = FileHandle(forReadingAtPath: f)
        if file != nil {
            let data = file!.readDataToEndOfFile()
            if data.count > 0 {
                let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                if str != nil {
                    let lines = str!.components(separatedBy: "\n")
                    for (index, line) in lines.enumerated() {
                        print("    \(index + 1)    \(line)")
                    }
                }
            }
        }  
    }

    else {
        print("File does not exist.")
    }
}

@main
struct cat: ParsableCommand {
    @Flag(help: "Print the line numbers along with each line.")
    var number: Bool = false

    @Argument(help: "Path of the file to concatenate.")
    var fileName: String

    mutating func run() throws {
        if number {
            catWithLineNums(fileName)
        } else {
            concat(fileName)
        }
    }
}
