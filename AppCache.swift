//
//  AppCache.swift
//  Sparrow
//


import UIKit

class AppCache: NSObject {
    
    static let shared = AppCache()
    
    // MARK: - CLASS LIFE CYCLE
    private override init() {
        super.init()
    }
    
    // MARK: - VARIABLES
   var selectedProjectId = String()
    var currentUser: GetUserDetailResponseModel? {
        set {
            if let data = JSONEncoder().convertToData(newValue) {
                UserDefaults.standard.setValue(data, forKey: AppConstants.UserDefault.currentUser)
                UserDefaults.standard.synchronize()
            }
        }
        get {
            if let data = UserDefaults.standard.data(forKey: AppConstants.UserDefault.currentUser) {
                return JSONDecoder().convertDataToModel(data)
            }
            return nil
        }
    }
    
//    var finalCurrentUser: FinalProfileResponseDataModel? {
//        set {
//            if let data = JSONEncoder().convertToData(newValue) {
//                UserDefaults.standard.setValue(data, forKey: AppConstants.UserDefault.finalCurrentUser)
//                UserDefaults.standard.synchronize()
//            }
//        }
//        get {
//            if let data = UserDefaults.standard.data(forKey: AppConstants.UserDefault.finalCurrentUser) {
//                return JSONDecoder().convertDataToModel(data)
//            }
//            return nil
//        }
//    }
  
    func removeAllUserDefaults() {
        if let domain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
        }
    }
    
    
}
