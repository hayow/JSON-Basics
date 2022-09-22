




import Foundation





let studentsJSON: String =

"""

    [
        {
            "id": "student-1",
            "name": "Samatar",
            "age": 26,
            "gender": "male",
            "courses": [
                "Pre-Calculus",
                "Environmental Chemistry",
                "Minnesota History"
            ]
        },

        {
            "id": "student-2",
            "name": "Shankaroon",
            "age": 19,
            "gender": "female",
            "courses": [
                "College Algebra",
                "Freshman Composition",
                "US History"
            ]
        },

        {
            "id": "student-3",
            "name": "Sharmaarke",
            "age": 21,
            "gender": "male",
            "courses": [
                "Trigonometry",
                "Freshman Composition",
                "Introduction To Philosophy"
            ]
        },

        {
            "id": "student-4",
            "name": "Cosob",
            "age": 18,
            "gender": "female",
            "courses": [
                "College Algebra",
                "Freshman Composition",
                "Micro Economics"
            ]
        },

        {
            "id": "student-5",
            "name": "Ja'eelow",
            "age": 23,
            "gender": "male",
            "courses": [
                "Calculus",
                "Programming In C",
                "Minnesota History"
            ]
        }
    ]

"""


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
}



func decode<T: Decodable>(_ string: String) throws -> T {
    guard let data: Data = string.data(using: .utf8) else { throw JSONDecodingError.failedToConvertToData }
    guard let decodedData: T = try? JSONDecoder().decode(T.self, from: data) else { throw JSONDecodingError.failedToDecodeData }
    return decodedData
}


do {
    let students: [Student] = try decode(studentsJSON)
    for student in students {
        print("id: \(student.id), name: \(student.name), courses: \(student.courses)")
    }
} catch JSONDecodingError.failedToConvertToData {
    print("Failed to convert to data.")
} catch JSONDecodingError.failedToDecodeData {
    print("Failed to decode data.")
} catch {
    print("Unknown error has occured.")
}





