//
//  ViewController.m
//  World Traweler
//
//  Created by David Pirih on 16.09.14.
//  Copyright (c) 2014 Piri-Piri. All rights reserved.
//

#import "PPListViewController.h"
#import "PPFourSquareSessionManager.h"

#import "AFMMRecordResponseSerializer.h"
#import "AFMMRecordResponseSerializationMapper.h"

static NSString *const kCLIENTID = @"SBBS3V3OESBOWFN31TZHNGGWWWQKATYH2TXOU5BCK25MQSRE";
static NSString *const kCLIENTSECRET = @"IO1UMEGESICFUA2CX3SC0EL5R2UVYLWZPXSVZZ0ZR2DWZYEC";

@interface PPListViewController ()

@end

@implementation PPListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PPFourSquareSessionManager *sessionManager = [PPFourSquareSessionManager sharedClient];
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    
    AFHTTPResponseSerializer *HTTPResponseSerializer = [AFJSONResponseSerializer serializer];
    AFMMRecordResponseSerializationMapper *mapper = [[AFMMRecordResponseSerializationMapper alloc] init];
    [mapper registerEntityName:@"Venue" forEndpointPathComponent:@"venues/search?"];
    
    AFMMRecordResponseSerializer *serializer = [AFMMRecordResponseSerializer serializerWithManagedObjectContext:context responseObjectSerializer:HTTPResponseSerializer entityMapper:mapper];
    sessionManager.responseSerializer = serializer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refreshAction:(UIBarButtonItem *)sender
{
    [[PPFourSquareSessionManager sharedClient] GET:@"venues/search?ll=30.25,-97.75" parameters:@{@"client_id" : kCLIENTID, @"client_secret" :kCLIENTSECRET, @"v" : @"20140416"} success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@", responseObject);
//        NSArray *venues = responseObject;
//        self.venues = venues;
//        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
}

@end
