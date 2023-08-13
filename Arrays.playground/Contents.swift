import Cocoa

class NeonAcademyMember {
    let fullName: String
    let title: String
    let horoscope: String
    let memberLevel: String
    let homeTown: String
    let age: Int
    let contactInformation: ContactInformation
    
    init(fullNameInit: String, titleInit: String, horoscopeInit: String, memberLevelInit: String, homeTownInit: String, ageInit: Int, contactInformationInit: ContactInformation) {
        fullName = fullNameInit
        title = titleInit
        horoscope = horoscopeInit
        memberLevel = memberLevelInit
        homeTown = homeTownInit
        age = ageInit
        contactInformation = contactInformationInit
    }
}

class ContactInformation {
    let phoneNumber: String
    let email: String
    
    init(phoneNumberInit: String, emailInit: String) {
        phoneNumber = phoneNumberInit
        email = emailInit
    }
}

// MARK: - Contact Info

let kamilContactInfo = ContactInformation(phoneNumberInit: "05397209525", emailInit: "kamilcaal@gmail.com")
let ozgurContactInfo = ContactInformation(phoneNumberInit: "05399847948", emailInit: "ozgurmercan@windowsline.com")
let osmanContactInfo = ContactInformation(phoneNumberInit: "05343853902", emailInit: "osmantarikurkac@hotmail.com")
let emreContactInfo = ContactInformation(phoneNumberInit: "05417347453", emailInit: "emreozel@neonapps.co")
let yasarContactInfo = ContactInformation(phoneNumberInit: "05398888846", emailInit: "yasar.krmtc@gmail.com")
let atillaContactInfo = ContactInformation(phoneNumberInit: "05459707602", emailInit: "atilla@neonapps.co")
let ezgiContactInfo = ContactInformation(phoneNumberInit: "05396537642", emailInit: "ezgi@neonapps.co")
let ipekContactInfo = ContactInformation(phoneNumberInit: "05343801527", emailInit: "ipek@neonapps.co")
let recepContactInfo = ContactInformation(phoneNumberInit: "05367411351", emailInit: "recep@neonapps.co")
let mehmetContactInfo = ContactInformation(phoneNumberInit: "05070554436", emailInit: "mehmet@neonapps.co")
let berkayContactInfo = ContactInformation(phoneNumberInit: "05549121152", emailInit: "berkay@neonapps.co")

// MARK: - Neon Academy Member

let kamil = NeonAcademyMember(fullNameInit: "Kamil Çal", titleInit: "iOS Developer", horoscopeInit: "Leo", memberLevelInit: "A1 Level", homeTownInit: "Tokat", ageInit: 26, contactInformationInit: kamilContactInfo )

let ozgur = NeonAcademyMember(fullNameInit: "Ozgür Mercan", titleInit: "iOS Developer", horoscopeInit: "Virgo", memberLevelInit: "A1 Level", homeTownInit: "Diyarbakır", ageInit: 27, contactInformationInit: ozgurContactInfo)

let osman = NeonAcademyMember(fullNameInit: "Osman Tarık Kurgaç", titleInit: "iOS Developer", horoscopeInit: "Capricorn", memberLevelInit: "A2 Level", homeTownInit: "Giresun", ageInit: 26, contactInformationInit: osmanContactInfo)

let emre = NeonAcademyMember(fullNameInit: "Emre Özel", titleInit: "Android Developer", horoscopeInit: "Leo", memberLevelInit: "A2 Level", homeTownInit: "Kars", ageInit: 23, contactInformationInit: emreContactInfo)

let yasar = NeonAcademyMember(fullNameInit: "Yaşar Kiremitçi", titleInit: "iOS Developer", horoscopeInit: "Capricorn", memberLevelInit: "A2 Level", homeTownInit: "Ordu", ageInit: 22, contactInformationInit: yasarContactInfo)

let atilla = NeonAcademyMember(fullNameInit: "Atilla Eren", titleInit: "Android Developer", horoscopeInit: "Agarius", memberLevelInit: "A2 Level", homeTownInit: "Malatya", ageInit: 28, contactInformationInit: atillaContactInfo)

let ezgi = NeonAcademyMember(fullNameInit: "Ezgi Kahraman", titleInit: "UI/UX Developer", horoscopeInit: "Pisces", memberLevelInit: "A1 Level", homeTownInit: "Malatya", ageInit: 26, contactInformationInit: ezgiContactInfo)

let ipek = NeonAcademyMember(fullNameInit: "Ipek Yılmaz", titleInit: "UI/UX Developer", horoscopeInit: "Leo", memberLevelInit: "A1 Level", homeTownInit: "İstanbul", ageInit: 24, contactInformationInit: ipekContactInfo)

let recep = NeonAcademyMember(fullNameInit: "Recep Akkoyun", titleInit: "iOS Developer", horoscopeInit: "Scorpio", memberLevelInit: "A2 Level", homeTownInit: "İstanbul", ageInit: 21, contactInformationInit: recepContactInfo)

let mehmet = NeonAcademyMember(fullNameInit: "Mehmet Arıkan", titleInit: "iOS Developer", horoscopeInit: "Taurus", memberLevelInit: "A2 Level", homeTownInit: "Malatya", ageInit: 24, contactInformationInit: mehmetContactInfo)

let berkay = NeonAcademyMember(fullNameInit: "Berkay Kuzu", titleInit: "iOS Developer", horoscopeInit: "Scorpio", memberLevelInit: "A1 Level", homeTownInit: "Ankara", ageInit: 25, contactInformationInit: berkayContactInfo)


var neonAcademyMembers = [kamil, ozgur, osman, emre, yasar, atilla, ezgi, ipek, recep, mehmet, berkay]


// MARK: - Delete the 3rd member:
 
neonAcademyMembers.remove(at: 2)
neonAcademyMembers.count

//for member in neonAcademyMembers {
//    print(member.fullName)
//}

// MARK: - Rank the members according to their age from largest to smallest.

let sortedNeonAcademyMembersAges = neonAcademyMembers.sorted(by: { $0.age > $1.age})

//for member in sortedNeonAcademyMembersAges {
//    print("\(member.fullName)'s age: \(member.age)")
//}

// MARK: - Sort the members according to their names (Z-A).

let sortedNeonAcademyMembersNames = neonAcademyMembers.sorted(by: { $0.fullName < $1.fullName})
 
//for member in sortedNeonAcademyMembersNames {
//    print("\(member.fullName)")
//}

// MARK: - Filter the members of the Academy who are older than 24 and transfer them to a new array. Print the names of the members in this array.

let filteredNeonAcademyMembersAges = neonAcademyMembers.filter {$0.age > 24}

var filteredNeonAcademyMembersAgesArray = [filteredNeonAcademyMembersAges]

//for name in filteredNeonAcademyMembersAges {
//    print("\(name.fullName): \(name.age)")
//}

// MARK: - Print the total number of iOS Developers.

let totalNumberOfiOSDevelers = neonAcademyMembers.filter {$0.title == "iOS Developer"}

//print(totalNumberOfiOSDevelers.count)

// MARK: - Find which index you come across in the array and print it.

let targetName = berkay

let indexOfBerkay = neonAcademyMembers.firstIndex(where: {$0 === berkay})

//if let index = indexOfBerkay {
//    print(index)
//}

// MARK: - Add a new member to the array, who is a mentor of the academy and has a special property "mentorLevel" indicating their level of experience. Print out the full names of all members after adding the new member.

class NeonAcademyMentor: NeonAcademyMember {
    var mentorLevel: String
    
    init(fullNameInit: String, titleInit: String, horoscopeInit: String, memberLevelInit: String, homeTownInit: String, ageInit: Int, contactInformationInit: ContactInformation, mentorLevelInit: String) {
        mentorLevel = mentorLevelInit
        super.init(fullNameInit: fullNameInit, titleInit: titleInit, horoscopeInit: horoscopeInit, memberLevelInit: memberLevelInit, homeTownInit: homeTownInit, ageInit: ageInit, contactInformationInit: contactInformationInit)
    }
}

let burakContactInfo = ContactInformation(phoneNumberInit: "05467861245", emailInit: "burak@neonapps.co")
let burak = NeonAcademyMentor(fullNameInit: "Burak Cicek", titleInit: "iOS Developer", horoscopeInit: "Virgo", memberLevelInit: "A3 Level", homeTownInit: "Sakarya", ageInit: 23, contactInformationInit: burakContactInfo, mentorLevelInit: "Mentor")

neonAcademyMembers.append(burak)

//for member in neonAcademyMembers {
//    print(member.fullName)
//}

// MARK: - Remove all members who have a specific memberLevel, for example, "A1", and print out the remaining members' full names

let filteredMemberLevel = neonAcademyMembers.filter {$0.memberLevel != "A1 Level"}

//for member in filteredMemberLevel {
//    print(" Remaning members' full names: \(member.fullName)")
//}

// MARK: - Find the member with the highest age and print out their full name and age.

//if let highestMemberAge = neonAcademyMembers.max(by: {$0.age < $1.age}) {
//    print("The name of highest member name: \(highestMemberAge.fullName) whose age is \(highestMemberAge.age)")
//}

// MARK: - Find the member with the longest name and print out their full name and the length of their name.

// if let longestMemberFullName = neonAcademyMembers.max(by: {$0.fullName.count < $1.fullName.count}) {
//    print(" The longest name: \(longestMemberFullName.fullName) and the length of name: \(longestMemberFullName.fullName.count)")
//}

// MARK: - Find all members who have the same horoscope sign and group them together in a new array. Print out the full names of members in this new array.

var sameHoroscopeSignMembers: [String: [NeonAcademyMember]] = [:]

for member in neonAcademyMembers {
    if var members = sameHoroscopeSignMembers[member.horoscope] {
        members.append(member)
        sameHoroscopeSignMembers[member.horoscope] = members
    } else {
        sameHoroscopeSignMembers[member.horoscope] = [member]
    }
}

for (horoscope, members) in sameHoroscopeSignMembers {
    print("Horoscope: \(horoscope)")
    for member in members {
        print("Full Name: \(member.fullName)")
    }
}


// MARK: - Find the most common hometown among the members and print out the name of the town.

let hometown = Dictionary(grouping: neonAcademyMembers, by: { $0.homeTown })
let theMostCommonHometown = hometown.max(by: { $0.value.count < $1.value.count })?.key

//if let commonHometown = theMostCommonHometown {
//    print("The most common hometown among the neon academy members is \(commonHometown)")
//}

// MARK: - Find the average age of all members and print out the result

let age = neonAcademyMembers.map {$0.age}
let ageSum = age.reduce(0, { $0 + $1 })

let averageOfAllMembers = Double(ageSum)/Double(neonAcademyMembers.count)

//print(averageOfAllNumbers)

// MARK: - Create a new array that contains only the contact information of the members, and print out the email addresses of all members in this new array.

var contactInformationOfMembers = neonAcademyMembers.map {$0.contactInformation}

//for member in contactInformationOfMembers {
//    print(member.email)
//}

// MARK: - Sort the members according to their memberLevel (highest to lowest) and print out their full names.

let sortedNeonAcademyMembersLevel = neonAcademyMembers.sorted(by: { $0.memberLevel > $1.memberLevel})

//for member in sortedNeonAcademyMembersLevel {
//    print(member.fullName)
//}

// MARK: - Find all members who have the same title and create a new array of their contact information, then print out the phone numbers of all members in this new array.

var sameTitleMembers: [String: [ContactInformation]] = [:]

for member in neonAcademyMembers {
    if var contacts = sameTitleMembers[member.title] {
        contacts.append(member.contactInformation)
        sameTitleMembers[member.title] = contacts
    } else {
        sameTitleMembers[member.title] = [member.contactInformation]
    }
}

var newContactInformationArray: [ContactInformation] = []

for (_, contacts) in sameTitleMembers {
    newContactInformationArray.append(contentsOf: contacts)
}

for contactInfo in newContactInformationArray {
    print("phone numbers of all members is \(contactInfo.phoneNumber)")
}
