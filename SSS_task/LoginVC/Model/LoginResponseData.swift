// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: jsonData)

import Foundation

// MARK: - LoginResponse
struct LoginResponseData: Codable {
    let v, type, authType, creationDate: String?
    let customerID, customerNo, email: String?
    let enabled: Bool?
    let firstName: String?
    let gender: Int?
    let hashedLogin, lastLoginTime, lastModified, lastName: String?
    let lastVisitTime, login, phoneMobile, previousLoginTime: String?
    let previousVisitTime, salutation, visitID: String?
    let cAddToEmailList: Bool?
    let cCashbackPointHistory, cCustomerCreationLocale, cCustomerUUID, cDeliveredProducts: String?
    let cDeviceID, cFluentCustomerID, cGamesInformation, cOtpPhone: String?
    let cOtpVerified: Bool?
    let cPhoneWhatsApp, cReferralCode, cSfscRecordID, cSscLastSyncDate: String?
    let cSscSyncResponseText: [String]?
    let cSscSyncStatus, cWishlistID: String?

    enum CodingKeys: String, CodingKey {
        case v = "_v"
        case type = "_type"
        case authType = "auth_type"
        case creationDate = "creation_date"
        case customerID = "customer_id"
        case customerNo = "customer_no"
        case email, enabled
        case firstName = "first_name"
        case gender
        case hashedLogin = "hashed_login"
        case lastLoginTime = "last_login_time"
        case lastModified = "last_modified"
        case lastName = "last_name"
        case lastVisitTime = "last_visit_time"
        case login
        case phoneMobile = "phone_mobile"
        case previousLoginTime = "previous_login_time"
        case previousVisitTime = "previous_visit_time"
        case salutation
        case visitID = "visit_id"
        case cAddToEmailList = "c_addToEmailList"
        case cCashbackPointHistory = "c_cashbackPointHistory"
        case cCustomerCreationLocale = "c_customerCreationLocale"
        case cCustomerUUID = "c_customerUUID"
        case cDeliveredProducts = "c_deliveredProducts"
        case cDeviceID = "c_deviceId"
        case cFluentCustomerID = "c_fluentCustomerId"
        case cGamesInformation = "c_gamesInformation"
        case cOtpPhone = "c_otpPhone"
        case cOtpVerified = "c_otpVerified"
        case cPhoneWhatsApp = "c_phoneWhatsApp"
        case cReferralCode = "c_referralCode"
        case cSfscRecordID = "c_sfscRecordId"
        case cSscLastSyncDate = "c_sscLastSyncDate"
        case cSscSyncResponseText = "c_sscSyncResponseText"
        case cSscSyncStatus = "c_sscSyncStatus"
        case cWishlistID = "c_wishlistID"
    }
}
