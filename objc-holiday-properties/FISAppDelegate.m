//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
//    NSArray *holiday;
//    holiday = self.database[season];
    return [self.database[season] allKeys];
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSMutableArray *suppliesInHolidayAndSeason;
    suppliesInHolidayAndSeason = self.database[season][holiday];
    
    return suppliesInHolidayAndSeason;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    return [[self.database[season] allKeys] containsObject:holiday];
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    return [self.database[season][holiday] containsObject:supply];
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    self.database[season][holiday] = [[NSMutableArray alloc]init];
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season] [holiday]addObject:supply];
    // no return
}

@end
