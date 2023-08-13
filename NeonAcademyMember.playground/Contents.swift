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
let osmanContactInfo = ContactInformation(phoneNumberInit: "05343853902", emailInit: "osmantarikurkac@hormail.com")
let emreContactInfo = ContactInformation(phoneNumberInit: "05417347453", emailInit: "emreozel@neonapps.co")
let yasarContactInfo = ContactInformation(phoneNumberInit: "05398888846", emailInit: "yasar.krmtc@gmail.com")
let atillaContactInfo = ContactInformation(phoneNumberInit: "05459707602", emailInit: "atilla@neonapps.co")
let ezgiContactInfo = ContactInformation(phoneNumberInit: "05396537642", emailInit: "ezgi@neonapps.co")
let ipekContactInfo = ContactInformation(phoneNumberInit: "05343801527", emailInit: "ipek@neonapps.co")
let recepContactInfo = ContactInformation(phoneNumberInit: "05367411351", emailInit: "recep@neonapps.co")
let mehmetContactInfo = ContactInformation(phoneNumberInit: "05070554436", emailInit: "mehmet@neonapps.co")
 
// MARK: - Neon Academy Member

let kamil = NeonAcademyMember(fullNameInit: "Kamil Çal", titleInit: "iOS Developer", horoscopeInit: "Leo", memberLevelInit: "A1 Level", homeTownInit: "Tokat", ageInit: 26, contactInformationInit: kamilContactInfo )

let ozgur = NeonAcademyMember(fullNameInit: "Özgür Mercan", titleInit: "iOS Developer", horoscopeInit: "Virgo", memberLevelInit: "A1 Level", homeTownInit: "Diyarbakır", ageInit: 27, contactInformationInit: ozgurContactInfo)

let osman = NeonAcademyMember(fullNameInit: "Osman Tarık Kurgaç", titleInit: "iOS Developer", horoscopeInit: "Capricorn", memberLevelInit: "A2 Level", homeTownInit: "Giresun", ageInit: 26, contactInformationInit: osmanContactInfo)

let emre = NeonAcademyMember(fullNameInit: "Emre Özel", titleInit: "Android Developer", horoscopeInit: "Leo", memberLevelInit: "A2 Level", homeTownInit: "Kars", ageInit: 23, contactInformationInit: emreContactInfo)

let yasar = NeonAcademyMember(fullNameInit: "Yaşar Kiremitçi", titleInit: "iOS Developer", horoscopeInit: "Capricorn", memberLevelInit: "A2 Level", homeTownInit: "Ordu", ageInit: 22, contactInformationInit: yasarContactInfo)

let atilla = NeonAcademyMember(fullNameInit: "Atilla Eren", titleInit: "Android Developer", horoscopeInit: "Agarius", memberLevelInit: "A2 Level", homeTownInit: "Malatya", ageInit: 28, contactInformationInit: atillaContactInfo)

let ezgi = NeonAcademyMember(fullNameInit: "Ezgi Kahraman", titleInit: "UI/UX Developer", horoscopeInit: "Pisces", memberLevelInit: "A1 Level", homeTownInit: "Bursa", ageInit: 26, contactInformationInit: ezgiContactInfo)

let ipek = NeonAcademyMember(fullNameInit: "İpek Yılmaz", titleInit: "UI/UX Developer", horoscopeInit: "Leo", memberLevelInit: "A1 Level", homeTownInit: "İstanbul", ageInit: 24, contactInformationInit: ipekContactInfo)

let recep = NeonAcademyMember(fullNameInit: "Recep Akkoyun", titleInit: "iOS Developer", horoscopeInit: "Scorpio", memberLevelInit: "A2 Level", homeTownInit: "İstanbul", ageInit: 21, contactInformationInit: recepContactInfo)

let mehmet = NeonAcademyMember(fullNameInit: "Mehmet Arıkan", titleInit: "iOS Developer", horoscopeInit: "Taurus", memberLevelInit: "A2 Level", homeTownInit: "Malatya", ageInit: 24, contactInformationInit: mehmetContactInfo)

var neonAcademyMembers = [kamil, ozgur, osman, emre, yasar, atilla, ezgi, ipek, recep, mehmet]



