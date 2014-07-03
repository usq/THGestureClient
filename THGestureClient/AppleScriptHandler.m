//
//  AppleScriptHandler.m
//  THGestureClient
//
//  Created by Michael Conrads on 03/07/14.
//  Copyright (c) 2014 pre-alpha. All rights reserved.
//

#import "AppleScriptHandler.h"

@implementation AppleScriptHandler

//123 left
//124 right
//125 down
//126 up

- (void)startPresentation
{
    NSAppleScript *key1 = [[NSAppleScript alloc] initWithSource:
                           @"tell application \"Keynote\" to activate\n\
                           tell application \"System Events\" to tell process \"Keynote\"\n\
                               keystroke \"p\" using {command down, option down}\n\
                           end tell"];
    [key1 executeAndReturnError:nil];
}

- (void)pressArrowLeft
{
    NSAppleScript *key1 = [[NSAppleScript alloc] initWithSource:
                           @"tell application \"System Events\" to tell process \"Keynote\"\n\
                               key code 123\n\
                           end tell"];
    [key1 executeAndReturnError:nil];
}

- (void)pressArrowRight
{
    NSAppleScript *key1 = [[NSAppleScript alloc] initWithSource:
                           @"tell application \"System Events\" to tell process \"Keynote\"\n\
                               key code 124\n\
                           end tell"];
    [key1 executeAndReturnError:nil];
}
@end
