//
//  DemoModelData.swift
//  JSQMessages
//
//  Created by Raphaël Bellec on 11/08/2015.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

import Foundation
import UIKit
import JSQMessagesViewController

class DemoModelData : NSObject{
    // Constants

    
    var messages : [JSQMessage]
    var avatars  : Dictionary< DemoUsersData, JSQMessagesAvatarImage>
    
    var outgoingBubbleImageData : JSQMessagesBubbleImage!
    var incomingBubbleImageData : JSQMessagesBubbleImage!
    
    // This value replace kJSQMessagesCollectionViewAvatarSizeDefault which lead to some trouble with swift type system
    let messagesCollectionViewAvatarSizeDefault = UInt(kJSQMessagesCollectionViewAvatarSizeDefault)
    
    
    override init() {
        messages = [JSQMessage]()
        avatars  = [DemoUsersData : JSQMessagesAvatarImage]()
        
        super.init()
        
        
        if (!NSUserDefaults.emptyMessagesSetting() ) {
            self.loadFakeMessages()
        }
        
        self.create_avatars()
        self.create_bubble_image_objects()
        
    }
    
    
    private func create_avatars() {
        /**
        *  Create avatar images once.
        *
        *  Be sure to create your avatars one time and reuse them for good performance.
        *
        *  If you are not using avatars, ignore this.
        */
        
        
        let jsqImage : JSQMessagesAvatarImage    = JSQMessagesAvatarImageFactory.avatarImageWithUserInitials( "JSQ",
            backgroundColor: UIColor(white: 0.85, alpha:1.0),
            textColor: UIColor(white: 0.60, alpha:1.0),
            font: UIFont.systemFontOfSize(14.0),
            diameter: messagesCollectionViewAvatarSizeDefault
        )
        
        let cookImage : JSQMessagesAvatarImage   = JSQMessagesAvatarImageFactory.avatarImageWithImage( UIImage(named: "demo_avatar_cook") , diameter:messagesCollectionViewAvatarSizeDefault )
        let jobsImage : JSQMessagesAvatarImage   = JSQMessagesAvatarImageFactory.avatarImageWithImage( UIImage(named: "demo_avatar_jobs") , diameter:messagesCollectionViewAvatarSizeDefault )
        let wozImage  : JSQMessagesAvatarImage   = JSQMessagesAvatarImageFactory.avatarImageWithImage( UIImage(named: "demo_avatar_woz" ) , diameter:messagesCollectionViewAvatarSizeDefault )
        
        
        self.avatars = [ .Squires   : jsqImage ,
                         .Cook      : cookImage,
                         .Jobs      : jobsImage,
                         .Woz       : wozImage   ]
        
        
        
    }
    
    
    
    private func create_bubble_image_objects() {
        /**
        *  Create message bubble images objects.
        *
        *  Be sure to create your bubble images one time and reuse them for good performance.
        *
        */
        let bubbleFactory            = JSQMessagesBubbleImageFactory()
        
        self.outgoingBubbleImageData = bubbleFactory.outgoingMessagesBubbleImageWithColor( UIColor.jsq_messageBubbleLightGrayColor() )
        self.incomingBubbleImageData = bubbleFactory.incomingMessagesBubbleImageWithColor( UIColor.jsq_messageBubbleGreenColor()     )
        
    }
    
    private func create_message(sender : DemoUsersData, text : String) -> JSQMessage {
        let senderId            = sender.stringId()
        let senderDisplayName   = sender.displayName()
        let date                = NSDate.distantPast() as! NSDate
        
        
        return JSQMessage(senderId: senderId, senderDisplayName:senderDisplayName, date: date, text: text)
        
    }
    
    private func create_message(sender : DemoUsersData, media : JSQMediaItem) -> JSQMessage {
        return JSQMessage(     senderId: sender.stringId(), displayName:sender.displayName(), media:media)
    }
    
    // Load some fake messages for demo.
    private func loadFakeMessages() {
        
        // Fake text messages
        self.messages = [
            create_message( .Squires , text:"Welcome to JSQMessages: A messaging UI framework for iOS."),
            create_message( .Woz     , text:"It is simple, elegant, and easy to use. There are super sweet default settings, but you can customize like crazy."),
            create_message( .Squires , text:"It even has data detectors. You can call me tonight. My cell number is 123-456-7890. My website is www.hexedbits.com."),
            create_message( .Jobs    , text:"JSQMessagesViewController is nearly an exact replica of the iOS Messages App. And perhaps, better."),
            create_message( .Cook    , text:"It is unit-tested, free, open-source, and documented."),
            create_message( .Squires , text:"Now with media messages!"),
            
        ]
        
        self.addPhotoMediaMessage()
        
        
        // Setting to load extra messages for testing/demo
        if (NSUserDefaults.extraMessagesSetting()) {
            // take the first 4 messages and add them to the end of message array
            self.messages += self.messages[0...3]
        }
        
        
        
        // Setting to load REALLY long message for testing/demo
        // You should see "END" twice
        if (NSUserDefaults.longMessageSetting()) {
            let long_text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? END Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? END"
            
            let reallyLongMessage : JSQMessage = create_message( .Squires , text:long_text)
            
            messages.append(reallyLongMessage)
            
        }
    }
    
    
    
    func addPhotoMediaMessage() {
        let photoItem         = JSQPhotoMediaItem( image: UIImage( named:"goldengate" )  )
        let photoMessage      = create_message(.Squires, media: photoItem)
        
        messages.append(photoMessage)
    }
    
    func addLocationMediaMessageCompletion(completion : JSQLocationMediaItemCompletionBlock)  {
        let ferryBuildingInSF = CLLocation(latitude: 37.795313, longitude:-122.393757)
        let locationItem      = JSQLocationMediaItem()
        
        locationItem.setLocation(ferryBuildingInSF, withCompletionHandler:completion)
        
        let locationMessage : JSQMessage  = create_message(.Squires, media:locationItem)
        
        messages.append(locationMessage)
    }
    
    func addVideoMediaMessage() {
        // don't have a real video, just pretending
        let videoURL          = NSURL(string:"file://")
        let videoItem         = JSQVideoMediaItem(fileURL: videoURL, isReadyToPlay:true)
        let videoMessage      = create_message(.Squires, media:videoItem)
        messages.append(videoMessage)
    }
    
    
}