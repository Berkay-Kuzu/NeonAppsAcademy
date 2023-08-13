import Cocoa

class NeonAcademyMember {
    let fullName: String
    let title: String
    let horoscope: String
    let memberLevel: String
    let homeTown: String
    let age: Int
    let contactInformation: ContactInformation
    let team: Team
    var motivationLevel: Int?
    
    init(fullNameInit: String, titleInit: String, horoscopeInit: String, memberLevelInit: String, homeTownInit: String, ageInit: Int, contactInformationInit: ContactInformation, teamInit: Team, motivationLevelInit: Int?) {
        fullName = fullNameInit
        title = titleInit
        horoscope = horoscopeInit
        memberLevel = memberLevelInit
        homeTown = homeTownInit
        age = ageInit
        contactInformation = contactInformationInit
        team = teamInit
        motivationLevel = motivationLevelInit
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

let kamil = NeonAcademyMember(fullNameInit: "Kamil Çal", titleInit: "iOS Developer", horoscopeInit: "Leo", memberLevelInit: "A1 Level", homeTownInit: "Tokat", ageInit: 26, contactInformationInit: kamilContactInfo, teamInit: Team.iOSDevelopmentTeam, motivationLevelInit: nil)

let ozgur = NeonAcademyMember(fullNameInit: "Ozgür Mercan", titleInit: "iOS Developer", horoscopeInit: "Virgo", memberLevelInit: "A1 Level", homeTownInit: "Diyarbakır", ageInit: 27, contactInformationInit: ozgurContactInfo, teamInit: Team.iOSDevelopmentTeam, motivationLevelInit: nil)

let osman = NeonAcademyMember(fullNameInit: "Osman Tarık Kurgaç", titleInit: "iOS Developer", horoscopeInit: "Capricorn", memberLevelInit: "A2 Level", homeTownInit: "Giresun", ageInit: 26, contactInformationInit: osmanContactInfo, teamInit: Team.iOSDevelopmentTeam, motivationLevelInit: nil)

let emre = NeonAcademyMember(fullNameInit: "Emre Özel", titleInit: "Android Developer", horoscopeInit: "Leo", memberLevelInit: "A2 Level", homeTownInit: "Kars", ageInit: 23, contactInformationInit: emreContactInfo, teamInit: Team.AndroidDevelopmentTeam, motivationLevelInit: nil)

let yasar = NeonAcademyMember(fullNameInit: "Yaşar Kiremitçi", titleInit: "iOS Developer", horoscopeInit: "Capricorn", memberLevelInit: "A2 Level", homeTownInit: "Ordu", ageInit: 22, contactInformationInit: yasarContactInfo, teamInit: Team.AndroidDevelopmentTeam, motivationLevelInit: nil)

let atilla = NeonAcademyMember(fullNameInit: "Atilla Eren", titleInit: "Android Developer", horoscopeInit: "Agarius", memberLevelInit: "A2 Level", homeTownInit: "Malatya", ageInit: 28, contactInformationInit: atillaContactInfo, teamInit: Team.AndroidDevelopmentTeam, motivationLevelInit: nil)

let ezgi = NeonAcademyMember(fullNameInit: "Ezgi Kahraman", titleInit: "UI/UX Developer", horoscopeInit: "Pisces", memberLevelInit: "A1 Level", homeTownInit: "Malatya", ageInit: 26, contactInformationInit: ezgiContactInfo, teamInit: Team.UIUXDesignTeam, motivationLevelInit: nil)

let ipek = NeonAcademyMember(fullNameInit: "Ipek Yılmaz", titleInit: "UI/UX Developer", horoscopeInit: "Leo", memberLevelInit: "A1 Level", homeTownInit: "İstanbul", ageInit: 24, contactInformationInit: ipekContactInfo, teamInit: Team.UIUXDesignTeam, motivationLevelInit: nil)

let recep = NeonAcademyMember(fullNameInit: "Recep Akkoyun", titleInit: "iOS Developer", horoscopeInit: "Scorpio", memberLevelInit: "A2 Level", homeTownInit: "İstanbul", ageInit: 21, contactInformationInit: recepContactInfo, teamInit: Team.iOSDevelopmentTeam, motivationLevelInit: nil)

let mehmet = NeonAcademyMember(fullNameInit: "Mehmet Arıkan", titleInit: "iOS Developer", horoscopeInit: "Taurus", memberLevelInit: "A2 Level", homeTownInit: "Malatya", ageInit: 24, contactInformationInit: mehmetContactInfo, teamInit: Team.iOSDevelopmentTeam, motivationLevelInit: nil)

let berkay = NeonAcademyMember(fullNameInit: "Berkay Kuzu", titleInit: "iOS Developer", horoscopeInit: "Scorpio", memberLevelInit: "A1 Level", homeTownInit: "Ankara", ageInit: 25, contactInformationInit: berkayContactInfo, teamInit: Team.iOSDevelopmentTeam, motivationLevelInit: nil)


var neonAcademyMembers = [kamil, ozgur, osman, emre, yasar, atilla, ezgi, ipek, recep, mehmet, berkay]


// MARK: - You will create a function called "increaseMotivation". This function should check if the motivationLevel is nil with if let. If it's nil, it should set it as 1. If it's not nil, it should increase the motivationLevel by a specified number from the function parameter.

func increaseMotivation(member: NeonAcademyMember, number: Int) {
    
    if let motivationLevel = member.motivationLevel {
        member.motivationLevel = motivationLevel + number
    } else {
        member.motivationLevel = 1
    }
}

//increaseMotivation(member: berkay, number: 9 )

// MARK: - Create a function that prints out a message based on the member's motivation level. For example, if the motivation level is nil, the function should print out "This member has no motivation level set" and if the motivation level is greater than 5, the function should print out "This member is highly motivated". ( You should use guard let for this task)

func membersMotivationLevel(member: NeonAcademyMember) {

    guard let motivationLevel = member.motivationLevel else {
        print("This member has no motivation level set")
        return
    }
    if motivationLevel > 5 {
        print("This member is highly motivated")
    }
}

//membersMotivationLevel(member: atilla)

// MARK: - Create a function that takes a member's motivation level as an input and returns a string indicating whether the member is highly motivated, moderately motivated, or not motivated at all.

func memberMotivationLevel(motivationLevel: Int?) -> String {
    guard let motivationLevel = motivationLevel else {
        return "This member's motivation level is not disponible."
    }
    
    if motivationLevel > 8 {
        return "This member is highly motivated."
    } else if motivationLevel > 4 {
        return "This member is moderately motivated."
    } else {
        return "This member is not motivated at all."
    }
}

let member = neonAcademyMembers[0]

let motivationLevelmessage =  memberMotivationLevel(motivationLevel: member.motivationLevel)

//print(motivationLevelmessage)

// MARK: - Create a function that takes a member as an input and returns the member's motivation level if it is not nil, otherwise it returns 0. ( You should use nil coalescing for this task)



func motivationLevelMember(member: NeonAcademyMember) -> Int {
   
    return member.motivationLevel ?? 0
}

//motivationLevelMember(member: berkay)

// MARK: - Create a function that takes a member and a target motivation level as inputs, and returns true if the member's current motivation level is greater than or equal to the target level, or false otherwise. ( You should use if let for this task)

func memberTargetMotivation(member: NeonAcademyMember, targetMotivationLevel: Int) -> Bool {
    if let memberMotivationLevel = member.motivationLevel {
        return memberMotivationLevel >= targetMotivationLevel
    } else {
        return false
    }
    
}

let neonAcademyMember = neonAcademyMembers[5]
let memberTargetMotivationLabel = 44

//print(memberTargetMotivation(member: neonAcademyMember, targetMotivationLevel: memberTargetMotivationLabel))

