import Foundation

// MARK: - The developers set out on their journey, determined to rise to the challenge. They began by creating an extension for String that would allow the citizens to easily check if a string was a palindrome, a word or phrase that reads the same forwards as backwards.

extension String {
    func isPalindrome(myString:String) -> Bool {
        let reverseString = String(myString.reversed())
        if(myString != "" && myString == reverseString) {
            return true
        } else {
            return false
        }
    }
}

let sentence = "Berkay is an iOS developer"

//print(sentence.isPalindrome(myString: sentence))

// MARK: - Next, the developers tackled the Int extension. They added a function that would determine if a number was prime, which made solving mathematical puzzles much easier for the kingdom's scholars.

extension Int {
    func isPrime() -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
}

let number = 23

if number.isPrime() {
    print("The number is prime.")
} else {
    print("The number is not prime.")
}

// MARK: - The Bool extension was not left behind, they added a function that could easily invert a boolean value, allowing the citizens to quickly switch between true and false, making their lives more efficient.

extension Bool {
    func inverted() -> Bool {
        return !self
    }
}

//let booleanValue = true
//let invertedBooleanValue = booleanValue.inverted()
//print(invertedBooleanValue)

// MARK: - The developers continued on their journey, creating an extension for Date that would allow the citizens to calculate the number of days between two dates.

extension Date {
    func numbersOfdaysBetween(start: Date, end: Date) -> Int {
            return Calendar.current.dateComponents([.day], from: start, to: end).day!
        }
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

let startDateString = "2021-01-01"
let endDateString = "2024-10-10"
let startDate = dateFormatter.date(from: startDateString)!
let endDate = dateFormatter.date(from: endDateString)!

let days = startDate.numbersOfdaysBetween(start: startDate, end: endDate)
print("The number of days between the two dates: \(days)")

