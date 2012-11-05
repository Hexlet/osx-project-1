#import <Foundation/Foundation.h>

@interface NucleobaseType : NSObject

+(NSString*) random;
+(NSString*) randomExcluding:(NSString*)type;
+(int) typesCount;

@end
