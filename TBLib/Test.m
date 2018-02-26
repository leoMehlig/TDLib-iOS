//
//  Test.m
//  TBLib
//
//  Created by Leo Mehlig on 23.02.18.
//  Copyright © 2018 Leo Mehlig. All rights reserved.
//

#import "Test.h"
#import "td_json_client.h"
@implementation Test
- (instancetype)init
{
    self = [super init];
    if (self) {
        void * client = td_json_client_create();
        NSString* test = @"{\"@type\": \"getTextEntities\", \"text\": \"@telegram /test_command https://telegram.org telegram.me\", \"@extra\": [\"5\", 7.0]}";
        
        const char * result = td_json_client_execute(client, [test cStringUsingEncoding:NSUTF8StringEncoding]);
        NSLog(@"%s", result);
        td_json_client_send(client, [@"{\"@type\": \"getAuthorizationState\", \"@extra\": 1.01234}" cStringUsingEncoding:NSUTF8StringEncoding]);
        
        while (true) {
            const char * result = td_json_client_receive(client, 1.0);
            if (result) {
                NSString* event = [NSString stringWithCString:result encoding:NSUTF8StringEncoding];
                NSLog(@"%@", event);

            }
        }
        
//        td_json_client_receive(client, 1.0)
        
    }
    return self;
}
@end
