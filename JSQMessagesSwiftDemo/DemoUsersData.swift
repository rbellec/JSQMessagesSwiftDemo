//
//  UsersEnum.swift
//  JSQMessagesSwiftDemo
//
//  Created by Raphaël Bellec on 18/08/2015.
//  Copyright (c) 2015 inventiveWays. All rights reserved.
//

import Foundation


enum DemoUsersData : String {
//    let kJSQDemoAvatarDisplayNameSquires    =
//    let kJSQDemoAvatarDisplayNameCook       =
//    let kJSQDemoAvatarDisplayNameJobs       = 
//    let kJSQDemoAvatarDisplayNameWoz        =
    
//    let kJSQDemoAvatarIdSquires             =
//    let kJSQDemoAvatarIdCook                =
//    let kJSQDemoAvatarIdJobs                =
//    let kJSQDemoAvatarIdWoz                 =
    
    case Squires    = "053496-4509-289"
    case Cook       = "468-768355-23123"
    case Jobs       = "707-8956784-57"
    case Woz        = "309-41802-93823"
    
    func displayName() -> String {
        switch self{
        case .Cook:     return "Tim Cook"
        case .Jobs:     return "Jobs"
        case .Squires:  return "Jesse Squires"
        case .Woz:      return "Steve Wozniak"
        }
    }
    
    func stringId() -> String {
        return self.rawValue
    }
    
    // return an Array of all possible recipients
    static func recipients() -> [DemoUsersData] {
        return [.Cook, .Jobs, .Woz]
    }
    
}