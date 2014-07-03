//
//  ViewController.m
//  THGestureClient
//
//  Created by Michael Conrads on 03/07/14.
//  Copyright (c) 2014 pre-alpha. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
                                    
    NSLog(@"sending key down");
   
    
    //
//    NSAppleScript *key1 = [[NSAppleScript alloc] initWithSource:
//                           @"tell application \"Keynote\" to activate\n\
//                           delay 0.1\n\
//                           tell application \"System Events\" to tell process \"Keynote\"\n\
//                               keystroke \"p\" using {command down, option down}\n\
//                               delay 2.1\n\
//                               key code 124\n\
//                           end tell"];
//    [key1 executeAndReturnError:nil];
    
//    NSAppleScript *key = [[NSAppleScript alloc] initWithSource:@"tell application \"Keynote\" to keystroke (key code 125)"];
//    [key executeAndReturnError:nil];
    
    
//    CGEventSourceRef source = CGEventSourceCreate(kCGEventSourceStateCombinedSessionState);
//    CGEventRef command
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
                                    
    // Update the view, if already loaded.
                                
}

@end
