




import Foundation





struct Student: Decodable {
    let id: String
    let name: String
    let age: Int
    let gender: String
    let courses: [String]
}




enum JSONDecodingError: Error {
    case failedToConvertToData
    case failedToDecodeData
    case failedToFindTheFile
}




func decode<T: Decodable>(_ fileName: String, _ fileExtension: String) throws -> T {
    guard let url: URL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else { throw JSONDecodingError.failedToFindTheFile }
    guard let data: Data = try? Data(contentsOf: url) else { throw JSONDecodingError.failedToConvertToData }
    guard let decodedData: T = try? JSONDecoder().decode(T.self, from: data) else { throw JSONDecodingError.failedToDecodeData }
    
    return decodedData
}



do {
    let students: [Student] = try decode("students", "json")
    for student in students {
        print("id: \(student.id), name: \(student.name), courses: \(student.courses)")
    }
} catch JSONDecodingError.failedToFindTheFile {
    print("Failed to find the file.")
} catch JSONDecodingError.failedToConvertToData {
    print("Failed to convert to data.")
} catch JSONDecodingError.failedToDecodeData {
    print("Failed to decode data.")
} catch {
    print("Unknown error has occured.")
}





