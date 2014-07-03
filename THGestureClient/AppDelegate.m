//
//  AppDelegate.m
//  THGestureClient
//
//  Created by Michael Conrads on 03/07/14.
//  Copyright (c) 2014 pre-alpha. All rights reserved.
//

#import "AppDelegate.h"
//#import <CocoaHTTPServer/HTTPServer.h>
#import <CocoaAsyncSocket/GCDAsyncSocket.h>
#import "AppleScriptHandler.h"

typedef struct
{
    uint8_t opcode;
} Controll_MSG;


@interface AppDelegate ()<GCDAsyncSocketDelegate>

@property (nonatomic, strong, readwrite) GCDAsyncSocket *socket;
@property (nonatomic, strong, readwrite) GCDAsyncSocket *connectedSocket;

@end


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self
                                             delegateQueue:dispatch_get_main_queue()];
    NSError *error;
    BOOL works = [self.socket acceptOnPort:1234 error:&error];
    
    if(works)
    {
        NSLog(@"socket is open");
    }
    else
    {
        NSLog(@"%@",error);
        return;
    }
    
    
    
}

- (void)socket:(GCDAsyncSocket *)sock
didAcceptNewSocket:(GCDAsyncSocket *)newSocket
{
    NSLog(@"connected commandcentral");
    self.connectedSocket = newSocket;
    [self.connectedSocket readDataToLength:sizeof(Controll_MSG)
                               withTimeout:-1
                                       tag:42];
}


- (void)socket:(GCDAsyncSocket *)sock
   didReadData:(NSData *)data
       withTag:(long)tag
{
    Controll_MSG *s = (Controll_MSG *)[data bytes];
    if(s->opcode == 1)
    {
        //start pres
        [[[AppleScriptHandler alloc] init] startPresentation];
    } else if(s->opcode == 2)
    {
        //next slide
        [[[AppleScriptHandler alloc] init] pressArrowRight];
    }
    else if(s->opcode == 3)
    {
        //pref slide
        [[[AppleScriptHandler alloc] init] pressArrowLeft];
    }
    
    //read next message
    [self.connectedSocket readDataToLength:sizeof(Controll_MSG)
                               withTimeout:-1
                                       tag:42];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
