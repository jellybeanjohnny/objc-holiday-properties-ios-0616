//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    NSDictionary *holidays = self.database[season];
    
    return holidays.allKeys;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    
    NSDictionary *holidays = self.database[season];
    NSArray *supplies = holidays[holiday];
    
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    NSDictionary *holidays = self.database[season];
    
    if (holidays[holiday]) {
        return YES;
    }
    return NO;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    NSDictionary *holidays = self.database[season];
    
    NSArray *supplies = holidays[holiday];
    
    if ([supplies containsObject:supply]) {
        return YES;
    }
    return NO;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableDictionary *seasons = self.database[season];
    seasons[holiday] = [@[] mutableCopy];
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    NSMutableDictionary *seasons = self.database[season];
    NSMutableArray *supplies = seasons[holiday];
    [supplies addObject:supply];
}

@end
