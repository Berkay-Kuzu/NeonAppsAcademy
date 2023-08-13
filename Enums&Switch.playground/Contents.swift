class NeonAcademyMember {
    let fullName: String
    let title: String
    let horoscope: String
    let memberLevel: String
    let homeTown: String
    let age: Int
    let contactInformation: ContactInformation
    let team: Team
    
    init(fullNameInit: String, titleInit: String, horoscopeInit: String, memberLevelInit: String, homeTownInit: String, ageInit: Int, contactInformationInit: ContactInformation, teamInit: Team) {
        fullName = fullNameInit
        title = titleInit
        horoscope = horoscopeInit
        memberLevel = memberLevelInit
        homeTown = homeTownInit
        age = ageInit
        contactInformation = contactInformationInit
        team = teamInit
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

enum Team {
    case iOSDevelopmentTeam
    case AndroidDevelopmentTeam
    case UIUXDesignTeam
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

let kamil = NeonAcademyMember(fullNameInit: "Kamil Çal", titleInit: "iOS Developer", horoscopeInit: "Leo", memberLevelInit: "A1 Level", homeTownInit: "Tokat", ageInit: 26, contactInformationInit: kamilContactInfo, teamInit: Team.iOSDevelopmentTeam )

let ozgur = NeonAcademyMember(fullNameInit: "Ozgür Mercan", titleInit: "iOS Developer", horoscopeInit: "Virgo", memberLevelInit: "A1 Level", homeTownInit: "Diyarbakır", ageInit: 27, contactInformationInit: ozgurContactInfo, teamInit: Team.iOSDevelopmentTeam)

let osman = NeonAcademyMember(fullNameInit: "Osman Tarık Kurgaç", titleInit: "iOS Developer", horoscopeInit: "Capricorn", memberLevelInit: "A2 Level", homeTownInit: "Giresun", ageInit: 26, contactInformationInit: osmanContactInfo, teamInit: Team.iOSDevelopmentTeam)

let emre = NeonAcademyMember(fullNameInit: "Emre Özel", titleInit: "Android Developer", horoscopeInit: "Leo", memberLevelInit: "A2 Level", homeTownInit: "Kars", ageInit: 23, contactInformationInit: emreContactInfo, teamInit: Team.AndroidDevelopmentTeam)

let yasar = NeonAcademyMember(fullNameInit: "Yaşar Kiremitçi", titleInit: "iOS Developer", horoscopeInit: "Capricorn", memberLevelInit: "A2 Level", homeTownInit: "Ordu", ageInit: 22, contactInformationInit: yasarContactInfo, teamInit: Team.AndroidDevelopmentTeam)

let atilla = NeonAcademyMember(fullNameInit: "Atilla Eren", titleInit: "Android Developer", horoscopeInit: "Agarius", memberLevelInit: "A2 Level", homeTownInit: "Malatya", ageInit: 28, contactInformationInit: atillaContactInfo, teamInit: Team.AndroidDevelopmentTeam)

let ezgi = NeonAcademyMember(fullNameInit: "Ezgi Kahraman", titleInit: "UI/UX Developer", horoscopeInit: "Pisces", memberLevelInit: "A1 Level", homeTownInit: "Malatya", ageInit: 26, contactInformationInit: ezgiContactInfo, teamInit: Team.UIUXDesignTeam)

let ipek = NeonAcademyMember(fullNameInit: "Ipek Yılmaz", titleInit: "UI/UX Developer", horoscopeInit: "Leo", memberLevelInit: "A1 Level", homeTownInit: "İstanbul", ageInit: 24, contactInformationInit: ipekContactInfo, teamInit: Team.UIUXDesignTeam)

let recep = NeonAcademyMember(fullNameInit: "Recep Akkoyun", titleInit: "iOS Developer", horoscopeInit: "Scorpio", memberLevelInit: "A2 Level", homeTownInit: "İstanbul", ageInit: 21, contactInformationInit: recepContactInfo, teamInit: Team.iOSDevelopmentTeam)

let mehmet = NeonAcademyMember(fullNameInit: "Mehmet Arıkan", titleInit: "iOS Developer", horoscopeInit: "Taurus", memberLevelInit: "A2 Level", homeTownInit: "Malatya", ageInit: 24, contactInformationInit: mehmetContactInfo, teamInit: Team.iOSDevelopmentTeam)

let berkay = NeonAcademyMember(fullNameInit: "Berkay Kuzu", titleInit: "iOS Developer", horoscopeInit: "Scorpio", memberLevelInit: "A1 Level", homeTownInit: "Ankara", ageInit: 25, contactInformationInit: berkayContactInfo, teamInit: Team.iOSDevelopmentTeam)


var neonAcademyMembers = [kamil, ozgur, osman, emre, yasar, atilla, ezgi, ipek, recep, mehmet, berkay]

// MARK: - Create a new array that contains only the members of the iOS Development Team and print out their full names.

let neonAcademyiOSdevelopers = neonAcademyMembers.filter {$0.team == Team.iOSDevelopmentTeam}

//for iOSdeveloper in neonAcademyiOSdevelopers {
//    print(iOSdeveloper.fullName)
//}

// MARK: - Create a dictionary that contains the number of members in each team, and print out the number of members in the UI/UX Design Team.

var numberOfTeamMembers: [Team: Int] = [:]

for member in neonAcademyMembers {
    let team = member.team
    numberOfTeamMembers[team, default: 0] += 1
}

numberOfTeamMembers[.UIUXDesignTeam]

//print("\("The number of members in the UI/UX Design Team: \(numberOfTeamMembers.count)")")

// MARK: - Create a function that takes a team as an input and prints out the full names of all members in that team.

func teamMembers(team: Team) {
    for member in neonAcademyMembers {
        if member.team == team {
            print(member.fullName)
        }
    }
}
//teamMembers(team: Team.AndroidDevelopmentTeam)

// MARK: - Create a switch statement that performs different actions based on the team of a member. For example, if a member is in the iOS Development Team, the function could print out "This member is a skilled iOS developer", and if the member is in the UI/UX Design Team, the function could print out "This member is a talented designer".

func memberNames(member:NeonAcademyMember) {
    
    switch member.team {
    case .iOSDevelopmentTeam:
        print("This member is a skilled iOS developer")
    case .AndroidDevelopmentTeam:
        print("This member is a skilled Android developer")
    case .UIUXDesignTeam:
        print("This member is a talented designer")
    }
}

//memberNames(member: atilla)
//memberNames(member: recep)

// MARK: - Create a function that takes an age as an input and prints out the full names of all members that are older than that age and belong to a specific team (iOS Development Team for example)

func memberAge(age: Int) {
    for member in neonAcademyMembers {
        if member.age > age {
            print("\(member.fullName) is in the \(member.team)" )
        } else {
            print("There is no member with that age")
        }
    }
}

//memberAge(age: 23)

// MARK: - Create a switch statement that gives a promotion to a member based on their team. For example, if a member is in the iOS Development Team, the function could promote them to "Senior iOS Developer" and if the member is in the UI/UX Design Team, the function could promote them to "Lead Designer".

func member(member: NeonAcademyMember) {
    switch member.team {
    case .iOSDevelopmentTeam:
        print("Senior iOS Developer")
    case .UIUXDesignTeam:
        print("Lead Designer")
    case .AndroidDevelopmentTeam:
        print("Senior Android Developer")
    }
}

//member(member: ozgur)
//member(member: atilla)
//member(member: ipek)

// MARK: - Create a function that takes a team as an input and calculates the average age of the members in that team

func calculateAverageAge(team: Team) -> Double {
    var sumAge = 0 // the average of age
    var teamMemberCount = 0 // the number of team members
    
    for member in neonAcademyMembers {
        if member.team == team {
            sumAge += member.age
            teamMemberCount += 1
        }
    }
    
    if teamMemberCount > 0 {
        let averageAgeOfMembers = Double(sumAge) / Double(teamMemberCount)
        return averageAgeOfMembers
    } else {
        return 0
    }
}

let averageAgeOfTeam = calculateAverageAge(team: .UIUXDesignTeam)
//print("The average age of Android Team is \(averageAgeOfTeam)")

// MARK: - Create a switch statement that prints out a different message for each team, such as "The iOS Development Team is the backbone of our academy" for the iOS Development Team and "The UI/UX Design Team is the face of our academy" for the UI/UX Design Team.

func team(team: Team) {
    switch team {
    case .iOSDevelopmentTeam:
        print("The iOS Development Team is the backbone of our academy")
    case .UIUXDesignTeam:
        print("The UI/UX Design Team is the face of our academy")
    case .AndroidDevelopmentTeam:
        print("The Android Development Team is one of the backbones of our academy")
    }
}

//team(team: .AndroidDevelopmentTeam)

// MARK: - Create a function that takes a team as an input and returns an array of the contact information of all members in that team.

func contactInformation(team: Team) -> [ContactInformation] {
    var contactInformationArray: [ContactInformation] = [] // an empty array with the type of ContactInformation
    
    for member in neonAcademyMembers {
        if member.team == team {
            contactInformationArray.append(member.contactInformation)
        }
    }
    
    return contactInformationArray
}

//let iosTeamContactInformation = contactInformation(team: .iOSDevelopmentTeam)

// MARK: - Create a switch statement that performs different actions based on the team of a member and their age. For example, if a member is in the iOS Development Team and is over 23 years old, the function could print out "XXX member is a seasoned iOS developer", and if the member is in the UI/UX Design Team and is under 24, the function could print out "XXX member is a rising star in the design world".

func memberTeam(member: NeonAcademyMember) {
    switch member.team {
    case .iOSDevelopmentTeam:
        if member.age > 23 {
            print("\(member.fullName) is a seasoned iOS Developer")
        } else {
            print("\(member.fullName) is a junior iOS Developer")
        }
    case .UIUXDesignTeam:
        if member.age < 24 {
            print("\(member.fullName) is a rising star in the design world")
        } else {
            print("\(member.fullName) is a seasoned designer")
        }
    case .AndroidDevelopmentTeam:
        if member.age > 23 {
            print("\(member.fullName) is a seasoned Android Developer")
        } else {
            print("\(member.fullName) is a junior Android Developer")
        }
    }
}

//memberTeam(member: atilla)
