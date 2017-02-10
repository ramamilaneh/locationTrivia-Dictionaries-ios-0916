//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    NSString *name = location[@"name"];
    if(length > name.length) {
        return name;
    }
    
    return [name substringToIndex:length];
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSDictionary *trivia = @{@"name":name,@"latitude":@(latitude),@"longitude":@(longitude)};
    return trivia;
}


-(NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *namesOfLocations = [NSMutableArray array];
    for(NSInteger i = 0;i<[locations count];i++){
        [namesOfLocations addObject:locations[i][@"name"]];
    }
    return namesOfLocations;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)location {
    
    if (location.count != 3) {
        return NO;
    }
    
    
    NSString *name = location[@"name"];
    if (!name) {
        return NO;
    }
    
    NSNumber *latitudeNumber = location[@"latitude"];
    if (!latitudeNumber) {
        return NO;
    }
    
    NSNumber *longitudeNumber = location[@"longitude"];
    if (!longitudeNumber) {
        return NO;
    }
    
    
    return YES;
 
}

-(NSDictionary *)locationNamed:(NSString *)name inLocations: (NSArray *)locations {
    for (NSUInteger i = 0; i<[locations count]; i++) {
        if([locations[i][@"name"] isEqualToString:name]){
            return locations[i];
        }
    }
    return nil;
}


@end
