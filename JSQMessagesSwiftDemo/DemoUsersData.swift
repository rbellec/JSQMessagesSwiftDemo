//
//  UsersEnum.swift
//  JSQMessagesSwiftDemo
//
//  Created by Raphaël Bellec on 18/08/2015.
//  Copyright (c) 2015 inventiveWays. All rights reserved.
//

import Foundation


enum DemoUsersData {
//    let kJSQDemoAvatarDisplayNameSquires    =
//    let kJSQDemoAvatarDisplayNameCook       =
//    let kJSQDemoAvatarDisplayNameJobs       = 
//    let kJSQDemoAvatarDisplayNameWoz        =
    
//    let kJSQDemoAvatarIdSquires             =
//    let kJSQDemoAvatarIdCook                =
//    let kJSQDemoAvatarIdJobs                =
//    let kJSQDemoAvatarIdWoz                 =
    
    case Squires, Cook, Jobs, Woz
    
    func displayName() -> String {
        switch self{
        case .Cook:     return "Tim Cook"
        case .Jobs:     return "Jobs"
        case .Squires:  return "Jesse Squires"
        case .Woz:      return "Steve Wozniak"
        }
    }
    
    func stringId() -> String {
        switch self{
        case .Cook:     return "468-768355-23123"
        case .Jobs:     return "707-8956784-57"
        case .Squires:  return "053496-4509-289"
        case .Woz:      return "309-41802-93823"
        }
        
    }
    
    
    
}