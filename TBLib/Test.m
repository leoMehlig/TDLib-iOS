//
//  Test.m
//  TBLib
//
//  Created by Leo Mehlig on 23.02.18.
//  Copyright © 2018 Leo Mehlig. All rights reserved.
//

#import "Test.h"
#import "td_json_client.h"
#import "Keys.h"
@implementation Test
- (instancetype)init
{
    self = [super init];
    if (self) {
        void * client = td_json_client_create();
        NSString* test = @"{\"@type\": \"getTextEntities\", \"text\": \"@telegram /test_command https://telegram.org telegram.me\", \"@extra\": [\"5\", 7.0]}";
        
        
        //        const char * result = td_json_client_execute(client, [test cStringUsingEncoding:NSUTF8StringEncoding]);
        //        NSLog(@"%s", result);
        //         td_json_client_send(client, [@"{\"@type\": \"setTdlibParameters\", \"@api_id\": 177033, \"@api_hash\": \"d61e84baf1d5da953fdabd730b0b557f\"}" cStringUsingEncoding:NSUTF8StringEncoding]);
        ////                NSLog(@"%s", result);
        //        td_json_client_send(client, [@"{\"@type\": \"setAuthenticationPhoneNumber\", \"@phone_number\": \"+4917682536412\"}" cStringUsingEncoding:NSUTF8StringEncoding]);
        
        while (true) {
            const char * result = td_json_client_receive(client, 1.0);
            if (result) {
                NSString* event = [NSString stringWithCString:result encoding:NSUTF8StringEncoding];
                NSDictionary * json = (NSDictionary*) [NSJSONSerialization JSONObjectWithData:[event dataUsingEncoding:NSUTF8StringEncoding] options: nil error:nil];
                if ([json[@"@type"] isEqualToString:@"updateAuthorizationState"]) {
                    NSString * type = json[@"authorization_state"][@"@type"];
                    if ([type isEqualToString:@"authorizationStateWaitTdlibParameters"]) {
                        td_json_client_send(client, [[NSString stringWithFormat:@"{\"@type\": \"setTdlibParameters\", \"parameters\": { \"use_test_dc\": false, \"database_directory\": \"\", \"files_directory\":\"\", \"use_file_database\":false, \"use_chat_info_database\":false, \"use_message_database\":false, \"use_secret_chats\":false, \"api_id\": %d, \"api_hash\":\"%@\", \"system_language_code\":\"en\", \"device_model\": \"phone\", \"system_version\": \"1.0\", \"application_version\":\"1.0\" , \"enable_storage_optimizer\":false, \"ignore_file_names\":true }}", API_ID, API_HASH] cStringUsingEncoding:NSUTF8StringEncoding]);
                    } else if ([type isEqualToString:@"authorizationStateWaitEncryptionKey"]) {
                        td_json_client_send(client, [@"{\"@type\": \"setDatabaseEncryptionKey\", \"new_encryption_key\":\"abcd\"}" cStringUsingEncoding:NSUTF8StringEncoding]);
                    }  else if ([type isEqualToString:@"authorizationStateWaitPhoneNumber"]) {
                        td_json_client_send(client, [[NSString stringWithFormat:@"{\"@type\": \"setAuthenticationPhoneNumber\", \"phone_number\":\"%@\"}", PHONE_NUMBER] cStringUsingEncoding:NSUTF8StringEncoding]);
                    }
                   
                }
                NSLog(@"%@", json);
                
            }
        }
        
        //        td_json_client_receive(client, 1.0)
        
    }
    return self;
}
@end
